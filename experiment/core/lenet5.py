import numpy as np
from pdb import set_trace

import torch
import torch.nn as nn
import torch.optim as optim

from utmLib.clses import ProgressIndicator
from contcnet import LrateScheduler

class LeNet5(nn.Module):
    def __init__(self):
        super(LeNet5, self).__init__()
        layers = []
        layers.append( nn.Conv2d(1, 6, kernel_size=5, stride=1, padding=2 ) )
        layers.append( nn.ReLU() )
        layers.append( nn.AvgPool2d(2, stride=2) )
        layers.append( nn.Conv2d(6, 16, kernel_size=5, stride=1, padding=0 ) )
        layers.append( nn.ReLU() )
        layers.append( nn.AvgPool2d(2, stride=2) )
        layers.append( nn.ReLU() )
        layers.append( nn.Flatten() )
        layers.append( nn.Linear(5*5*16, 120) )
        layers.append( nn.ReLU() )
        layers.append( nn.Linear(120, 84) )
        layers.append( nn.ReLU() )
        layers.append( nn.Linear(84, 10) )
        self.layers = nn.Sequential(*layers)

    def forward(self, X):
        return self.layers(X)

class DenseNN(nn.Module):
    def __init__(self, insize, outsize, hsize):
        super(DenseNN, self).__init__()
        layers = []
        layers.append( nn.Linear(insize, hsize[0]) )
        layers.append( nn.ReLU() )
        for i in range(0, len(hsize) -1 ):
            layers.append( nn.Linear(hsize[i], hsize[i+1]) )
            layers.append( nn.ReLU() )
        layers.append( nn.Linear(hsize[-1], outsize) )
        self.layers = nn.Sequential(*layers)

    def forward(self, X):
        return self.layers(X)

class NNClassifier:
    def fit(self, data, labels, hid_size = None, device = 'cuda:0', total_epoches = 200,
            batch_size = 1000, maxlr = 0.01):

        D = data.shape[1]
        N_classes = np.unique(labels).size
        if hid_size is None:
            hid_size = [max(2*D, 64*N_classes)]
            hid_size.append( 16 * N_classes)
            hid_size.append( 4 * N_classes)
        model = DenseNN(D, N_classes, hsize=hid_size)

        loss_func = nn.CrossEntropyLoss()
        optimizer = optim.Adam(model.parameters(), betas=(0.9, 0.999), eps=1e-08, weight_decay=1e-5, amsgrad=False)

        # data preprocessing and move to device
        labels = labels.astype(int)
        labels = torch.from_numpy(labels).to(device)
        train = torch.from_numpy(data).to(device)
        train_loader = torch.utils.data.DataLoader(list(zip(train, labels)), batch_size=batch_size, shuffle=True, drop_last=True)
        model.to(device)

        model.train()
        pi = ProgressIndicator(total_epoches)
        lrs = LrateScheduler(lr_max=maxlr, init_epoches=8, final_epoches=(total_epoches-15))

        for e in range(total_epoches):
            lr = lrs.get_lrate(e)
            for g in optimizer.param_groups:
                g['lr'] = lr

            cur_loss = 0
            for X, y in train_loader:
                optimizer.zero_grad()
                out = model(X)
                loss = loss_func(out, y)
                loss.backward()
                optimizer.step()
                cur_loss += loss.item()
            msg = 'Epoch:{} Loss:{:.6f} LR:{:.6f}'.format(e+1, cur_loss, lr)
            pi.at(e+1, info = msg)

        model.eval()
        model.to('cpu')
        self.model = model
        return self

    def predict(self, test):
        test = torch.from_numpy(test).to('cpu')
        test_loader = torch.utils.data.DataLoader(test, batch_size=500, shuffle=False, drop_last=False)

        ret = None
        with torch.no_grad():
            for X in test_loader:
                outputs = self.model(X)
                _, predicted = torch.max(outputs, 1)

                if ret is None:
                    ret = predicted
                else:
                    ret = torch.cat([ret, predicted], dim=0)

        ret = ret.numpy()
        return ret
