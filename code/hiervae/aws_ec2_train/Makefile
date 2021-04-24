test: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0cdea90dee9f86d4c \
		--instance-type t3.medium 


train_qed1:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0cdea90dee9f86d4c \
		--instance-type g4dn.xlarge \
		--user-data file://run_train_qed_1.txt


sync:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us

sync-model:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us
	aws s3 cp ~/sagemaker-dlh/code/graph2graph/newmodels_small 

copy-input-from-s3:
	aws s3 sync s3://input-data-drug-r-us/graph2graph_processed/ ~/sagemaker-dlh/code/graph2graph/data

output:
	aws s3 ls s3://output-data-drug-r-us/graph2graph
