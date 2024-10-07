#!/bin/bash

# author: Ankita
# date: 12/05/2024
# version: v1
# this script will report the AWS resource usage

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM users

# Cron Job Setup:
# To run this script every day at 6 AM, add the following line to your crontab:
# 0 6 * * * /path/to/your/script.sh
# This ensures that the script is executed daily without manual intervention.

set -x

# List of S3 buckets
echo "Print list of S3 buckets"
aws s3 ls

# List of EC2 instances
echo "Print list of EC2 instances"
aws ec2 describe-instances

# List of Lambda functions
echo "Print list of Lambda functions"
aws lambda list-functions

# List of IAM users
echo "Print list of IAM users"
aws iam list-users
