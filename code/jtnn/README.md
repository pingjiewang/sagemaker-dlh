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

# To set up Conda env

* conda create -n test python=2.7
* conda activate test
* conda install pytorch==0.4.1 cuda80 -c pytorch
* conda install rdkit=2017.09.1 -c rdkit
* conda install scipy
* export PYTHONPATH=/home/ubuntu/sagemaker-dlh/code/jtnn
* cd molopt/
* pip install wandb

# Quick Start
The following directories contains the most up-to-date implementations of our model:
* `fast_jtnn/` contains codes for model implementation.
* `molopt/` contains codes for VAE training. Please refer to `molopt/README.md` for details.

The following directories provides scripts for the experiments in our original ICML paper:
* `bo/` includes scripts for Bayesian optimization experiments. Please read `bo/README.md` for details.
* `molvae/` includes scripts for training our VAE model only. Please read `molvae/README.md` for training our VAE model.
* `molopt/` includes scripts for jointly training our VAE and property predictors. Please read `molopt/README.md` for details.
* `jtnn/` contains codes for model formulation.
* `data/` ZINC training data for smiles and properties

# Steps

Original Readme:
https://github.com/wengong-jin/icml18-jtnn/tree/master/molopt
* source activate test_dlh_1
* export PYTHONPATH=~/sagemaker-dlh/code/jtnn
* cd ~/sagemaker-dlh/code/jtnn/molopt

## Set up ENV variables for wandb
* export WANDB_API_KEY=3d8d03a861242e9da71d6eb9ce4b9299259d142c
* export WANDB_PROJECT="jtnn_train"

## train penalized logP

* mkdir pre_model_logP/
* CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA --hidden 300 --depth 3 --latent 56 --batch 40 --save_dir pre_model_logP/
* mkdir vae_model_logP/
* CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA --hidden 300 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 --model pre_model_logP/model.best --save_dir vae_model_logP/

## train qed

* mkdir pre_model_qed/
* CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.qed --hidden 300 --depth 3 --latent 56 --batch 40 --save_dir pre_model_qed/
* mkdir vae_model_qed/
* CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.qed --hidden 300 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 --model pre_model_qed/model.best --save_dir vae_model_qed/


## train drd2

* mkdir pre_model_drd2/
* CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.drd2 --hidden 300 --depth 3 --latent 56 --batch 40 --save_dir pre_model_drd2/
* mkdir vae_model_drd2/
* CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.drd2 --hidden 300 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 --model pre_model_drd2/model.best --save_dir vae_model_drd2/


## testing logP

echo "Begin to test using --sim 0.6"

python optimize.py --test ../data/zinc/opt.test.logP-SA --vocab ../data/zinc/vocab.txt \
--hidden 300 --depth 3 --latent 56 --sim 0.6 \
--model vae_model_logp/model.iter-2

echo "Begin to test using --sim 0.4"

python optimize.py --test ../data/zinc/opt.test.logP-SA --vocab ../data/zinc/vocab.txt \
--hidden 300 --depth 3 --latent 56 --sim 0.4 \
--model vae_model_logp/model.iter-2


## validation logP

echo "Begin to validate using --sim 0.6"

python optimize.py --test ../data/zinc/opt.valid.logP-SA --vocab ../data/zinc/vocab.txt \
--hidden 300 --depth 3 --latent 56 --sim 0.6\
--model vae_model_logp/model.iter-2

echo "Begin to validate using --sim 0.4"

python optimize.py --test ../data/zinc/opt.valid.logP-SA --vocab ../data/zinc/vocab.txt \
--hidden 300 --depth 3 --latent 56 --sim 0.4\
--model vae_model_logp/model.iter-2

