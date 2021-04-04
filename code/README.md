# Graph2Graph

## Training on small dataset

To run training on a small subset of data (1000 training pairs/SMILES) do the following:

1. Install all dependencies
2. `export PYTHONPATH=/your/path/sagemaker-dlh/code/graph2graph`
3. in `diff_vae/`
    * `>bash preprocess_small.sh`
4. in `diff_vae/`
    * `>bash train_small.sh`


The output for training the small dataset should look something like the following (with some additional warnings that were removed for clarity):

```
running training on logp06
Namespace(anneal_rate=0.85, batch_size=20, beta=2.0, clip_norm=50.0, depthG=3, depthT=6, epoch=2, hidden_size=300, load_epoch=-1, lr=0.001, rand_size=16, save_dir='newmodels_small/logp06', share_embedding=True, train='../data_small/logp06/processed/', use_molatt=False, vocab='../data_small/logp06/vocab.txt')
Model #Params: 3149K
KL: 0.01, Word: 20.28, Topo: 70.57, Assm: 53.00, PNorm: 91.60, GNorm: 50.00
KL: 0.01, Word: 25.61, Topo: 82.90, Assm: 58.49, PNorm: 92.32, GNorm: 36.20
finished training epoch 1 of 2
training time (s) of epoch: 187.16002202
learning rate: 0.000850
KL: 0.01, Word: 29.04, Topo: 89.02, Assm: 59.33, PNorm: 93.49, GNorm: 48.01
KL: 0.01, Word: 35.60, Topo: 91.15, Assm: 63.21, PNorm: 94.18, GNorm: 28.56
finished training epoch 2 of 2
training time (s) of epoch: 185.441420078
learning rate: 0.000722
running training on logp04
...
```

It should then save the trained models in `newmodels_small/` directory (after each epoch)

## Training on real dataset (with GPU)

To train on the real dataset (assuming you are using GPU) first modify the code:

- `decode.py:41:#model = DiffVAE(vocab, args).cuda()`
    * uncomment this line and comment the line above. Here we activate GPU acceleration with cuda()
- `vae_train.py:47:#model = DiffVAE(vocab, args).cuda()`
    * do the same as above

Now run the following steps:

1. Install all dependencies
2. `export PYTHONPATH=/your/path/sagemaker-dlh/code/graph2graph`
3. in `diff_vae/`
    * `>bash preprocess.sh`
4. in `diff_vae/`
    * `>bash train.sh`






