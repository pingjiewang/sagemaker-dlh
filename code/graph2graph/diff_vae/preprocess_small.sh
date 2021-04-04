#!/bin/bash

#python ../scripts/preprocess_small.py --train ../data_small/logp06/train_pairs.txt
#mkdir processed
#mv tensor* processed
#mv processed ../data_small/logp06

python ../scripts/preprocess_small.py --train ../data_small/logp04/train_pairs.txt
mkdir processed
mv tensor* processed
mv processed ../data_small/logp04

#python ../scripts/preprocess_small.py --train ../data_small/qed/train_pairs.txt
#mkdir processed
#mv tensor* processed
#mv processed ../data_small/qed
#
#python ../scripts/preprocess_small.py --train ../data_small/drd2/train_pairs.txt
#mkdir processed
#mv tensor* processed
#mv processed ../data_small/drd2
