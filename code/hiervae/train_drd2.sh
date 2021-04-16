#!/bin/bash

# DRD2 
mkdir -p newmodels/drd2
python gnn_train.py --train data/drd2/ --vocab data/drd2/vocab.txt --save_dir newmodels/drd2/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/drd2/LOG
