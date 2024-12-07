#!/bin/bash

###############################################################################
# Author: Abhishek Veeramalla (Modified)
# Version: v0.0.2

# Script to automate the process of listing all the resources in an AWS account.
# Now includes logging, email notification, and better error handling.

# Supported AWS services:
# 1. EC2, 2. RDS, 3. S3, 4. CloudFront, 5. VPC, 6. IAM, 7. Route53,
# 8. CloudWatch, 9. CloudFormation, 10. Lambda, 11. SNS, 12. SQS,
# 13. DynamoDB, 14. EBS

# Usage:
# ./aws_resource_list.sh <aws_region> <aws_service>
# To list all services, omit the service: ./aws_resource_list.sh <aws_region>
###############################################################################

# Variables
LOG_FILE="/tmp/aws_resource_list.log"
EMAIL_TO="your_email@example.com"

# Functions
usage() {
    echo "Usage: $0 <aws_region> [aws_service]"
    echo "Example: $0 us-east-1 ec2"
    exit 1
}

send_email() {
    if [[ -s $LOG_FILE ]]; then
        mail -s "AWS Resource Report - $(date)" $EMAIL_TO < "$LOG_FILE"
        echo "Email sent to $EMAIL_TO."
    else
        echo "No data to send via email."
    fi
}

log_and_display() {
    echo -e "$1" | tee -a "$LOG_FILE"
}

# Argument Validation
if [[ $# -lt 1 ]]; then
    usage
fi

aws_region=$1
aws_service=${2:-"all"}

# Check AWS CLI installation
if ! command -v aws &> /dev/null; then
    log_and_display "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check AWS CLI configuration
if [[ ! -d ~/.aws ]]; then
    log_and_display "AWS CLI is not configured. Please configure it before running this script."
    exit 1
fi

# List AWS resources based on the service
list_resources() {
    case $1 in
        ec2)
            log_and_display "Listing EC2 Instances in $aws_region"
            aws ec2 describe-instances --region $aws_region --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output table
            ;;
        rds)
            log_and_display "Listing RDS Instances in $aws_region"
            aws rds describe-db-instances --region $aws_region --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceStatus]' --output table
            ;;
        s3)
            log_and_display "Listing S3 Buckets"
            aws s3api list-buckets --query 'Buckets[*].[Name,CreationDate]' --output table
            ;;
        cloudfront)
            log_and_display "Listing CloudFront Distributions"
            aws cloudfront list-distributions --query 'DistributionList.Items[*].[Id,Status]' --output table
            ;;
        vpc)
            log_and_display "Listing VPCs in $aws_region"
            aws ec2 describe-vpcs --region $aws_region --query 'Vpcs[*].[VpcId,State]' --output table
            ;;
        iam)
            log_and_display "Listing IAM Users"
            aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table
            ;;
        route53)
            log_and_display "Listing Route53 Hosted Zones"
            aws route53 list-hosted-zones --query 'HostedZones[*].[Name,Id]' --output table
            ;;
        cloudwatch)
            log_and_display "Listing CloudWatch Alarms in $aws_region"
            aws cloudwatch describe-alarms --region $aws_region --query 'MetricAlarms[*].[AlarmName,StateValue]' --output table
            ;;
        cloudformation)
            log_and_display "Listing CloudFormation Stacks in $aws_region"
            aws cloudformation describe-stacks --region $aws_region --query 'Stacks[*].[StackName,StackStatus]' --output table
            ;;
        lambda)
            log_and_display "Listing Lambda Functions in $aws_region"
            aws lambda list-functions --region $aws_region --query 'Functions[*].[FunctionName,Runtime]' --output table
            ;;
        sns)
            log_and_display "Listing SNS Topics"
            aws sns list-topics --query 'Topics[*].[TopicArn]' --output table
            ;;
        sqs)
            log_and_display "Listing SQS Queues"
            aws sqs list-queues --query 'QueueUrls' --output table
            ;;
        dynamodb)
            log_and_display "Listing DynamoDB Tables in $aws_region"
            aws dynamodb list-tables --region $aws_region --query 'TableNames' --output table
            ;;
        ebs)
            log_and_display "Listing EBS Volumes in $aws_region"
            aws ec2 describe-volumes --region $aws_region --query 'Volumes[*].[VolumeId,State]' --output table
            ;;
        all)
            for service in ec2 rds s3 cloudfront vpc iam route53 cloudwatch cloudformation lambda sns sqs dynamodb ebs; do
                list_resources "$service"
            done
            ;;
        *)
            log_and_display "Invalid service: $1. Please specify a valid service or use 'all'."
            ;;
    esac
}

# Clear the log file
> "$LOG_FILE"

# Start listing resources
list_resources "$aws_service"

# Send email with the report
send_email

# Cleanup
echo "Script execution completed. Log saved to $LOG_FILE."
