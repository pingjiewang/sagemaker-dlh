#!/bin/bash

# QED 
mkdir -p newmodels/qed
python gnn_train.py --train data/qed/ --vocab data/qed/vocab.txt --save_dir newmodels/qed/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/qed/LOG