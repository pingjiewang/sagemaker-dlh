# Hierarchical Generation of Molecular Graphs using Structural Motifs

This code has been copied from https://github.com/wengong-jin/hgraph2graph.

## Installation
First install the dependencies via conda:
 * PyTorch >= 1.0.0
 * networkx
 * RDKit = 2018.09.3
 * numpy
 * Python >= 3.6

And then run `pip install .`

## Graph translation Data Format
* The training file should contain pairs of molecules (molA, molB) that are similar to each other but molB has better chemical properties. Please see `data/qed/train_pairs.txt`.
* The test file is a list of molecules to be optimized. Please see `data/qed/test.txt`.

## Graph translation training procedure
1. Extract substructure vocabulary from a given set of molecules:
```
python get_vocab.py < data/qed/mols.txt > vocab.txt
```
Please replace `data/qed/mols.txt` with your molecules data file.

2. Preprocess training data:
```
python preprocess.py --train data/qed/train_pairs.txt --vocab data/qed/vocab.txt --ncpu 8 < data/qed/train_pairs.txt
mkdir processed_qed
mv tensor* processed_qed/
```
Please replace `--train` and `--vocab` with training and vocab file.

3. Train the model:
```
mkdir models/
python gnn_train.py --train processed_qed/ --vocab data/qed/vocab.txt --save_dir models/ 
```

4. Make prediction on your lead compounds (you can use any model checkpoint, here we use model.5 for illustration)
```
python decode.py --test data/qed/valid.txt --vocab data/qed/vocab.txt --model models/model.5 --num_decode 20 > results.csv
```
