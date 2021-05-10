# Learning Multimodal Graph-to-Graph Translation for Molecular Optimization

This code has been copied from https://github.com/wengong-jin/iclr19-graph2graph.

## Requirements
* Python == 2.7
* RDKit >= 2017.09
* PyTorch >= 0.4.0
* Numpy
* scikit-learn
* networkx

The code has been tested under python 2.7 with pytorch 0.4.1. 

## Set up Conda Env

#create a new enviroment

```
conda create -n test_dlh_1 python=2.7
conda activate test_dlh_1
conda install -y pytorch=0.4.1 
conda install -y scikit-learn=0.20.3 scipy=1.2.1
conda install -y -c rdkit rdkit=2017.09.1
export PYTHONPATH=/sagemaker-dlh/code/graph2graph
```

## Quick Start
The tutorial of training and testing our variational junction tree encoder-decoder is in [diff_vae/README.md](./diff_vae).

A quick summary of different folders:
* `data/` contains the training, validation and test set of logP, QED and DRD2 tasks described in the paper.
* `fast_jtnn/` contains the implementation of junction tree encoder-decoder.
* `diff_vae/` includes the training and decoding script of variational junction tree encoder-decoder ([README](./diff_vae)).
* `props/` is the property evaluation module, including penalized logP, QED and DRD2 property calculation.
* `scripts/` provides evaluation and data preprocessing scripts.

new:
* `data_small/` contains a small subset of training, validation and test set of logP, QED and DRD2 for testing purposes.

# Automation Train Scripts

* LogP06 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2/run_script_1_of_4.txt

* LogP04 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2/run_script_2_of_4.txt

* Qed https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2/run_script_3_of_4.txt

* DRD2 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2/run_script_4_of_4.txt


# Automation Validation Scripts

* LogP06 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2_validate/run_script_val_logp06_iter_0_18.txt

* LogP04 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2_validate/run_script_val_logp04_iter_0_18.txt

* Qed https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2_validate/run_script_val_qed_iter_0_19.txt

* DRD2 https://github.com/pingjiewang/sagemaker-dlh/blob/main/code/graph2graph/aws_ec2_validate/run_script_val_drd2_iter_0_19.txt
