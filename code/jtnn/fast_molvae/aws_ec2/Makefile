#to be tested:
train: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type g4dn.xlarge \
		--user-data file://run_train.txt

test_train: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2,Version=4 \
		--instance-type g4dn.xlarge \
		--user-data file://run_train_small.txt

# t3.2xlarge - 8cpu, 32GB
#

test_preprocess:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type t3.2xlarge \
		--user-data file://run_preprocess_small.txt

preprocess:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0a9f85a28214b65e2 \
		--instance-type t3.2xlarge \
		--user-data file://run_preprocess.txt


#todo:
sync:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us

#todo:
sync-model:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us
	aws s3 cp ~/sagemaker-dlh/code/graph2graph/newmodels_small 

#todo:
copy-input-from-s3:
	aws s3 sync s3://input-data-drug-r-us/graph2graph_processed/ ~/sagemaker-dlh/code/graph2graph/data

#todo:
output:
	aws s3 ls s3://output-data-drug-r-us/graph2graph
