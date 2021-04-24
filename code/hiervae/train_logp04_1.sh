#!/bin/bash

# logp04
mkdir -p newmodels/logp04
python gnn_train.py --train data/logp04/processed/ --vocab data/logp04/vocab.txt --save_dir newmodels/logp04/ --hidden_size 300 --embed_size 300 --anneal_rate 0.9 --epoch 1 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/logp04/LOG

