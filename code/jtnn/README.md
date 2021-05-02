# Junction Tree Variational Autoencoder for Molecular Graph Generation

This code has been copied from https://github.com/wengong-jin/icml18-jtnn.

Junction Tree Variational Autoencoder paper: [https://arxiv.org/abs/1802.04364](https://arxiv.org/abs/1802.04364)

## Requirements
* Python == 2.7
* RDKit >= 2017.09
* PyTorch >= 0.4.0
* Numpy
* scikit-learn
* networkx

# Quick Start
The following directories contains the most up-to-date implementations of our model:
* `fast_jtnn/` contains codes for model implementation.
* `fast_molvae/` contains codes for VAE training. Please refer to `fast_molvae/README.md` for details.

The following directories provides scripts for the experiments in our original ICML paper:
* `bo/` includes scripts for Bayesian optimization experiments. Please read `bo/README.md` for details.
* `molvae/` includes scripts for training our VAE model only. Please read `molvae/README.md` for training our VAE model.
* `molopt/` includes scripts for jointly training our VAE and property predictors. Please read `molopt/README.md` for details.
* `jtnn/` contains codes for model formulation.
* `data/` ZINC training data for smiles and properties

## Steps
* source activate test_dlh_1
* export PYTHONPATH=~/sagemaker-dlh/code/jtnn
* cd ~/sagemaker-dlh/code/jtnn/fast_molvae
* mkdir zinc_model_small/
* python vae_train.py  --hidden_size 300 --latent_size 8 --train zinc-processed_small --vocab ../data/zinc/vocab.txt --save_dir zinc_model_small/
