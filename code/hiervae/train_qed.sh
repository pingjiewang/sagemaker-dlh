#!/bin/bash

# # logp06
# mkdir -p newmodels/logp06
# python gnn_train.py --train processed_logp06/ --vocab data/logp06/vocab.txt --save_dir newmodels/logp06/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/logp06/LOG

# # logp04
# mkdir -p newmodels/logp04
# python gnn_train.py --train processed_logp04/ --vocab data/logp04/vocab.txt --save_dir newmodels/logp04/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/logp04/LOG

# QED 
mkdir -p newmodels/qed
python gnn_train.py --train processed_qed/ --vocab data/qed/vocab.txt --save_dir newmodels/qed/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/qed/LOG

# # DRD2 
# mkdir -p newmodels/drd2
# python gnn_train.py --train processed_drd2/ --vocab data/drd2/vocab.txt --save_dir newmodels/drd2/ --hidden_size 300 --anneal_rate 0.9 --epoch 20 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/drd2/LOG
