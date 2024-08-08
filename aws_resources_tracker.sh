#!/bin/bash


#################################
#Author: Abhishek
#Date: 8th Aug 2024
#Version: V1
#
#
#This script will report the aws services usages
#################################
#Aws Lambda
#Aws EC2
#Aws S3
#Aws IAM

set -x 3

#list S3 buckets
echo " Print list of all S3 buckets"
aws s3 ls >> resourcetracker.txt

#list EC2 Instances
echo " Print list of all ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourcetracker.txt

#list lambda
echo " Print list of all lambda functions"
aws lambda list-functions >> resourcetracker.txt

#list IAM Users
echo " Print list of all IAM users"
aws iam list-users >> resourcetracker.txt
