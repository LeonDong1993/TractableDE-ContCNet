# About
This repository contains all codes, datasets and results for the paper Conditionally Tractable Density Estimation using Neural Networks published on AISTATS 2022.


# Setup and Installation
- Please make sure you are using Linux system (MAC OS may work as well, but not Windows).
- Clone this repository.
- Download the zipped dataset from [Here](https://drive.google.com/file/d/1c8sAhhJrqRnZeFfdirGi-zgdDt5SZMJ6/view?usp=sharing) and extract all content into dataset folder.
- Setup the conda environment
    - More details will be updated
    - pass
- Source `core/set_env.profile` before executing any command.


# Usage
All command is assumed to execute at directory `experiment` unless otherwise noted.
More details will be updated

# Reproducibility
We provided the trained instance of all models (SPN, RNADE, OURS) in the `experiement/output` directory. From which you can fully recover our results shown in the paper. Retrain the whole model do incur slightly difference, but the overall results are same.