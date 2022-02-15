import torch
import torch.nn as nn
import torch.optim as optim

from utmLib.clses import ProgressIndicator
from contcnet import LrateScheduler
from lenet5 import DenseNN

class DeepAutoEncoder(nn.Module):
    def __init__(self, insize, outsize, hsize):
        super(DeepAutoEncoder, self).__init__()
        self.encoder = DenseNN(insize, outsize, hsize)
        self.decoder = DenseNN(outsize, insize, list(reversed(hsize)))

    def forward(self, X):
        return self.decoder(self.encoder(X))

class DAET:
    # deep auto encoder transform
    def __init__(self, n_components, hsize, epoches = 250, batchsize = 1000, maxlr = 0.01, device = 'cuda:0') -> None:
        self.k = n_components
        self.hs = hsize
        self.epoches = epoches
        self.batchsize = batchsize
        self.maxlr = maxlr
        self.device = device

    def fit(self, X):
        D = X.shape[1]
        model = DeepAutoEncoder(D, self.k, self.hs)
        optimizer = optim.Adam(model.parameters(), betas=(0.9, 0.999), eps=1e-08, weight_decay = 1e-5, amsgrad=False)
        scheduler = LrateScheduler(self.maxlr, init_epoches=8, final_epoches = (self.epoches-15) )
        loss_func = nn.MSELoss()

        model.to(self.device)
        X = torch.from_numpy(X).to(self.device)
        train_loader = torch.utils.data.DataLoader(X, batch_size=self.batchsize, shuffle=True, drop_last=True)
        model.train()
        pi = ProgressIndicator(self.epoches)

        for e in range(self.epoches):
            lrate = scheduler.get_lrate(e)
            for g in optimizer.param_groups:
                g['lr'] = lrate

            cur_loss = 0
            for X in train_loader:
                optimizer.zero_grad()
                out = model(X)
                loss = loss_func(out,X)
                loss.backward()
                optimizer.step()
                cur_loss += loss.item()
            pi.at(e+1, info='Epoch:{} Loss:{:.6f} LRate:{:.6f}'.format(e+1, cur_loss, lrate))

        model.eval()
        model.to('cpu')
        self.model = model
        return self

    def __repr__(self) -> str:
        desc = 'DAET-{}'.format(self.k)
        return desc

    def transform(self, X):
        with torch.no_grad():
            X = torch.from_numpy(X).to('cpu')
            Y = self.model.encoder(X)
        return Y

    def inverse_transform(self, F):
        with torch.no_grad():
            F = torch.from_numpy(F).to('cpu')
            X = self.model.decoder(F)
        return X

