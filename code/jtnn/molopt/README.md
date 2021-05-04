# Conda env

* conda create -n test python=2.7
* conda activate test
* conda install pytorch==0.4.1 cuda80 -c pytorch
* conda install rdkit=2017.09.1 -c rdkit
* conda install scipy
* export PYTHONPATH=/home/ubuntu/sagemaker-dlh/code/jtnn
* cd molopt/
* python optimize.py --test ../data/zinc/opt.test.logP-SA --vocab ../data/zinc/vocab.txt --hidden 420 --depth 3 --latent 56 --sim 0.2 --model joint-h420-L56-d3-beta0.005/model.iter-4

# Constrained Molecule Optimization
Suppose the repository is downloaded at `$PREFIX/icml18-jtnn` directory. First set up environment variables:
```
export PYTHONPATH=$PREFIX/icml18-jtnn
```

## Training
We trained VAE model in two phases:
1. We train our model for three epochs without KL regularization term (So we are essentially training an autoencoder).
Pretrain our model as follows (with hidden state dimension=420, latent code dimension=56, graph message passing depth=3):
```
mkdir pre_model/
CUDA_VISIBLE_DEVICES=0 python pretrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA \
--hidden 420 --depth 3 --latent 56 --batch 40 \
--save_dir pre_model/
```
PyTorch by default uses all GPUs, setting flag `CUDA_VISIBLE_DEVICES=0` forces PyTorch to use the first GPU (1 for second GPU and so on).

The final model is saved at pre_model/model.2

2. Train out model with KL regularization, with constant regularization weight $beta$. 
We found setting beta > 0.01 greatly damages reconstruction accuracy.
```
mkdir vae_model/
CUDA_VISIBLE_DEVICES=0 python vaetrain.py --train ../data/zinc/train.txt --vocab ../data/zinc/vocab.txt --prop ../data/zinc/train.logP-SA \
--hidden 420 --depth 3 --latent 56 --batch 40 --lr 0.0007 --beta 0.005 \
--model pre_model/model.2 --save_dir vae_model/
```

## Testing
To optimize a set of molecules, run
```
python optimize.py --test ../data/zinc/opt.test.log-SA --vocab ../data/zinc/vocab.txt \
--hidden 420 --depth 3 --latent 56 --sim 0.2 \
--model joint-h420-L56-d3-beta0.005/model.4
```
Replace `opt.test.log-SA` with `opt.valid.log-SA` for validation.
