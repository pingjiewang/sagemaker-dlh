#!/bin/bash

# logp06
mkdir -p newmodels_small/logp06
echo "running training on logp06"
python vae_train.py --train ../data_small/logp06/processed/ --vocab ../data_small/logp06/vocab.txt --save_dir newmodels_small/logp06 --hidden_size 300 --rand_size 16 --anneal_rate 0.85 --epoch 2 --beta 2.0 --batch_size 20 --share_embedding | tee newmodels_small/logp06/LOG

# logp04
mkdir -p newmodels_small/logp04
echo "running training on logp04"
python vae_train.py --train ../data_small/logp04/processed/ --vocab ../data_small/logp04/vocab.txt --save_dir newmodels_small/logp04 --hidden_size 330 --rand_size 8 --anneal_rate 0.8 --epoch 2 --share_embedding | tee newmodels_small/logp04/LOG

# QED 
mkdir -p newmodels_small/qed
echo "running training on qed"
python vae_train.py --train ../data_small/qed/processed/ --vocab ../data_small/qed/vocab.txt --save_dir newmodels_small/qed --hidden_size 300 --rand_size 8 --anneal_rate 0.8 --epoch 2 --use_molatt | tee newmodels_small/qed/LOG

# DRD2 
mkdir -p newmodels_small/drd2
echo "running training on drd2"
python vae_train.py --train ../data_small/drd2/processed/ --vocab ../data_small/drd2/vocab.txt --save_dir newmodels_small/drd2 --hidden_size 300 --rand_size 8 --batch_size 20 --epoch 2 --use_molatt | tee newmodels_small/drd2/LOG
