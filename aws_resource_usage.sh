#!/bin/bash


#####################
# Author : Ayush Dabhade
#
# Date : 15-06-2026
#
# Description : This Script Report The AWS Resources Usage
#
# Version : v1
####################

set -x

set -e

set -o pipefail

#List S3 Buckets

echo "Print List of S3 Buckets"
aws s3 ls


#list ec2 Instances 

echo "Print List of EC2 Instances ID " 

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'



#list Lambda Functions

echo "Print List of Lambda Functions"
aws lambda list-functions


#list IAM Users

echo "Print List of IAM Users"

aws iam list-users
