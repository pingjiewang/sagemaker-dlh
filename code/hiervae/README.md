# Hierarchical Generation of Molecular Graphs using Structural Motifs

This code has been copied from https://github.com/wengong-jin/hgraph2graph.



# Installation
First install the dependencies via conda:
 * PyTorch >= 1.0.0
 * networkx
 * RDKit = 2018.09.3
 * numpy
 * Python >= 3.6

And then run `pip install .`

# To set up Conda ENV
#building AMI image

```
conda create -n hiervae1 python=3.7
source activate hiervae1
conda install numpy=1.19.1
conda install -c rdkit rdkit=2019.03.4
pip install networkx
pip install props
conda install -y pytorch==1.5.1 torchvision==0.6.1 cudatoolkit=10.2 -c pytorch
conda install -y scikit-learn
pip install wandb
export PYTHONPATH=/sagemaker-dlh/code/hiervae
```

# Graph translation Data Format
* The training file should contain pairs of molecules (molA, molB) that are similar to each other but molB has better chemical properties. Please see `data/qed/train_pairs.txt`.
* The test file is a list of molecules to be optimized. Please see `data/qed/test.txt`.

# Graph translation training procedure
1. Extract substructure vocabulary from a given set of molecules:
```
python get_vocab.py < data/qed/mols.txt > vocab.txt
```
Please replace `data/qed/mols.txt` with your molecules data file.

2. Preprocess training data:
```
# Common part
source activate hiervae
export PYTHONPATH=~/sagemaker-dlh/code/hiervae
cd ~/sagemaker-dlh/code/hiervae

# qed
python preprocess.py --train data/qed/train_pairs.txt --vocab data/qed/vocab.txt --ncpu 8 < data/qed/train_pairs.txt
mkdir processed_qed
mv tensor* processed_qed/

# drd2
python preprocess.py --train data/drd2/train_pairs.txt --vocab data/drd2/vocab.txt --ncpu 8 < data/drd2/train_pairs.txt
mkdir processed_drd2
mv tensor* processed_drd2/

# logp04
python preprocess.py --train data/logp04/train_pairs.txt --vocab data/logp04/vocab.txt --ncpu 8 < data/logp04/train_pairs.txt
mkdir processed_logp04
mv tensor* processed_logp04/

#logp06
python preprocess.py --train data/logp06/train_pairs.txt --vocab data/logp06/vocab.txt --ncpu 8 < data/logp06/train_pairs.txt
mkdir processed_logp06
mv tensor* processed_logp06/
```
Please replace `--train` and `--vocab` with training and vocab file.

Save preprocess results to s3 for training purpose

```
cd /home/ubuntu/sagemaker-dlh/code/hiervae/processed_qed
aws s3 cp * s3://input-data-drug-r-us/hiervae_processed/qed/
 
cd /home/ubuntu/sagemaker-dlh/code/hiervae/processed_drd2
aws s3 cp * s3://input-data-drug-r-us/hiervae_processed/drd2/

cd /home/ubuntu/sagemaker-dlh/code/hiervae/processed_logp04
aws s3 cp * s3://input-data-drug-r-us/hiervae_processed/logp04/

cd /home/ubuntu/sagemaker-dlh/code/hiervae/processed_logp06
aws s3 cp * s3://input-data-drug-r-us/hiervae_processed/logp06/
```

3. Train the model:
```
mkdir models/
python gnn_train.py --train processed_qed/ --vocab data/qed/vocab.txt --save_dir models/ 
```

4. Make prediction on your lead compounds (you can use any model checkpoint, here we use model.5 for illustration)
```
python decode.py --test data/qed/valid.txt --vocab data/qed/vocab.txt --model models/model.5 --num_decode 20 > results.csv
```

# Automation train scripts
* Qed https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_train/run_train_qed.txt
* Logp06 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_train/run_train_logp06.txt
* Logp04 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_train/run_train_logp04.txt
* Drd2 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_train/run_train_drd2.txt

# Automation validation scripts
* Qed https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_validate/run_script_val_qed_test.txt
* Logp06 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_validate/run_script_val_logp06_test.txt
* Logp04 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_validate/run_script_val_logp04_test.txt
* Drd2 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/hiervae/aws_ec2_validate/run_script_val_drd2_test.txt
