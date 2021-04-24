#!/bin/bash

# logp06
mkdir -p newmodels/logp06
python gnn_train.py --train data/logp06/processed/ --vocab data/logp06/vocab.txt --save_dir newmodels/logp06/ --hidden_size 300 --embed_size 300 --anneal_rate 0.9 --epoch 1 --batch_size 20 --beta 2.0 --latent_size 8 | tee newmodels/logp06/LOG
