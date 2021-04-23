#!/bin/bash

DIR_MODEL=$1/drd2
DIR_OUT=$2/drd2
ST=$3
ED=$4

for ((i=ST; i<=ED; i++)); do
    f=$DIR_MODEL/model.$i
    if [ -e $f ]; then
        echo $f
        python decode.py --test ../data/molopt/drd2/valid.txt --vocab ../data/molopt/drd2/align_vocab.txt --enum_root --model $f --hidden_size 300 --embed_size 300 --latent_size 8 | sed -r '/^\s*$/d' | python ../scripts/drd2_score.py > $DIR_OUT/results.$i 
    fi
done
