test: test_large

test_gpu:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type g4dn.xlarge \
		--user-data file://run_script.txt

test_large:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t3.large \
		--user-data file://run_script.txt


start_clean:
	aws ec2 run-instances \
		--launch-template LaunchTemplateId=lt-088940a9348fd270b \
		--instance-type t2.medium 


sync:
	aws s3 sync s3://output-data-drug-r-us ~/tmp/output-data-drug-r-us