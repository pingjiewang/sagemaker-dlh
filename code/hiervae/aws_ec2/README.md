# How to run training from command line using AWS CLI

## Step 1 - Download and install the AWSCLI tool
```
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
```

## Step 2 - Follow the instruction to configure the AWSCLI
```
$ aws configure

AWS Access Key ID [None]: <Get from Ping>
AWS Secret Access Key [None]: <Get from Ping>
Default region name [None]: us-east-2
Default output format [None]: json
```

## Step 3 (Optional)- install private key for ssh login
This is needed only if you want to ssh into the training EC2 instance, which has been setup using key pair named 'dlh-group-pair'


```
mv dlh-group-pair.pem ~/.ssh
chmod 400 ~/.ssh/dlh-group-pair.pem

ls -trl ~/.ssh
-r--------@ 1 pjwang  staff  1704 Apr  5 20:58 dlh-group-pair.pem
```

## Step 3 - Run the training
### To train using CPU
```
make train_cpu
```
### To train using GPU
```
make train_gpu
```

The above Makefile command will preformed the following:

- Launch an EC2 instance from the specified launch template. (see Makefile content for which instance type used)
- Execute the startup bootstrap script (see run_script.txt)

The startup bootstrap script will perform the following:

- Activate the Conda environment
- Execute the training script (e.g. train_tiny.sh )
- Copy output data and log file to s3://output-data-drug-r-us (todo: not yet fully implemented)
- Shut down the instance upon finish training script execution.

## Current issue (pending resolution)

- Unable to run GPU training yet, due to pending G Instance type Quota increase (**RESOLVED as of 4/8/2021 9am EDT**)

- Make diff-vae to use CUDA calls when GPU is avaiable. We commented CUDA call out before to be able to run on CPU

- Need to copy training output data to s3://output-data-drug-r-us. Currently, only log files are copied.

- Need to copy training input data from S3://input-data-drug-r-us to the instance file system.
- Replace train_tiny.sh script with the actual training script.

## To get your access ID and the secret key:
- Go to  IAM service by clicking: https://console.aws.amazon.com/iam/home?#/users
- Under “IAM resources”, click on “Users:3"
- Click on your user name.
- Select the tab “Security credentials.”
- Click on the button “Create Access Key”
- Download .csv file

Note: Please be sure to keep the key safe and secure. Don’t commit to Github nor email it to yourself or anyone.
