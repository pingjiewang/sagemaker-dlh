#!/bin/bash

# logp06
mkdir -p newmodels_small/logp06
echo "running training on logp06"
python vae_train.py --train ../data_small/logp06/processed/ --vocab ../data_small/logp06/vocab.txt --save_dir newmodels_small/logp06 --hidden_size 300 --rand_size 8 --anneal_rate 0.85 --epoch 2 --beta 2.0 --batch_size 20 --share_embedding | tee newmodels_small/logp06/LOG

