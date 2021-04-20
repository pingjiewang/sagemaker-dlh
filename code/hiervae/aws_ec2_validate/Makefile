start-clean: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0cdea90dee9f86d4c \
		--instance-type t3.small 

test: 
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0cdea90dee9f86d4c \
		--instance-type t3.medium \
		--user-data run_script_val_qed_test.txt


validate_test:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-0cdea90dee9f86d4c \
		--instance-type t3.medium \
		--user-data run_script_val_qed_test.txt

sync: sync-output

sync-output:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us


sync-input-from-s3:
	aws s3 sync s3://input-data-drug-r-us/hiervae_trained ~/sagemaker-dlh/code/hiervae/newmodels

sync-input-to-s3:
	aws s3 sync ~/tmp/input-data-drug-r-us/hiervae_trained s3://input-data-drug-r-us/hiervae_trained

output:
	aws s3 ls s3://output-data-drug-r-us/graph2graph
