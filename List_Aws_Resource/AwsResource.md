# Problem Statement:
Managing AWS resources manually can be time-consuming and costly. Unused or underutilized resources like EC2 instances or EBS volumes can increase cloud expenses unnecessarily. Organizations need a simple and automated way to track their resources daily and identify areas to save costs.

# Solution:
I developed a shell script that lists all running AWS resources, like EC2, S3, and Lambda, and sends a daily email at 6 PM. This automation helps track resources easily, improves visibility, and identifies unused ones, making it easier to optimize costs.

# Explaining the Project:
*1. What the Project Does:*  "I created a script that lists all active resources in an AWS account and sends a daily report via email at 6 PM. This helps track resources like EC2, S3, and Lambda automatically, saving time and reducing manual effort."

*2. Why It’s Useful:* "The script helps identify unused or underutilized resources, allowing organizations to reduce costs by removing unnecessary expenses."

*3. How It Works:*
The script uses AWS CLI to fetch details of various AWS services.
It runs daily using a cron job at 6 PM.
It sends a clear and detailed email report to ensure everyone has the latest updates.

*4. Key Impact:* "This project helps organizations save money by automatically tracking resources and making it easy to spot areas for cost optimization."






