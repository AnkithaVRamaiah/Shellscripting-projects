#!/bin/bash

#author: ankitha
#date: 12/05/2024
#version:v1
#this script will report the aws resource usage

#aws s3
#aws ec2
#aws lambda
#aws iam users


set -x

#list of s3 bucketss
echo "print list of s3 buckets"
aws s3 ls

#list of ec2 instances
echo "print list of ec2 instances"
aws ec2 describe-instances

#list of lambda functions
echo "print list of lambda functions"
aws lambda list-functions

#list of IAM users
echo "print list of IAM users"
aws iam list-users