#!/bin/bash

##############################################################################################
#Author: Abhishek Sontakke
#Date: 24th Aug 2024
#Version: V1.1


#This script will report all the AWS Services runnning.

#List of Services supported by this script

# 1. EC2
# 2. RDS
# 3. VPC
# 4. CloudWatch
# 5. CloudFormation
# 6. EBS
# 7. IAM
# 8. Lambda
# 9. DynamoDB
# 10. Route5
# 11. S3
# 12. CloudFront



#
#Usages: Please provide the required argumnets for ./aws_resources_tracker <aws_region> <aws_service>
#Example: ./aws_resources_tracker.sh ap-south-1 ec2"

###############################################################################################

# This will stop the script when user not passing the argument correctly.
if [ $# -ne 2 ]; then
	echo "Usages: Please provide the required argumnets for $0 <aws_region> <aws_service> "
	echo "Example: $0 ap-south-1 ec2"
        exit 1
fi

# Assigning the arguments to the variable
aws_region=$1
aws_service=$2

# This will check if AWS CLI  installed in your machine
if ! command -v aws &> /dev/null; then
	echo "AWS CLI is not install in your system, Please install and try"
        exit 1
fi



# This will check is AWS CLI properly configured in your system or not
if [ ! -d ~/.aws ]; then
	echo "AWS CLI is not configured, Please configure and try again"
        exit 1
fi

# List the resources based on the service and region
case $aws_service in
    ec2)
	echo " Listing the EC2 instances in $aws_region"
        aws ec2 describe-instances --region $aws_region | jq '.Reservations[].Instances[].InstanceId'
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac	
