### Project Title: *Automated AWS Resource Usage Report Generator*

### Project Description

This project involves creating a shell script that generates a daily report of AWS resource usage. The report will include details about S3 buckets, EC2 instances, Lambda functions, and IAM users. The script will be scheduled to run automatically every day at a specified time using cron jobs. This ensures that the report is generated regularly without manual intervention, providing up-to-date information for project management and operational oversight.

### Use Case

*Objective*: To automate the generation and delivery of AWS resource usage reports to a team or manager, ensuring that resource utilization is monitored and reported consistently.

*Primary Users*:
- System Administrators
- DevOps Engineers
- IT Managers

*Benefits*:
- *Automation*: Reduces manual effort by automating the reporting process.
- *Consistency*: Ensures regular and accurate reporting of AWS resource usage.
- *Monitoring*: Helps in tracking and managing AWS resources effectively.

### Steps to Create the Project

1. *Set Up AWS CLI*:
   - Ensure AWS CLI is installed and configured with appropriate credentials.
   - Run aws configure to set up access key, secret key, default region, and output format.

2. *Create the Shell Script*:
   - Open a terminal and create a new file for the script:
     bash
     vim AWSResourceTracker.sh
     

   - Write the script with appropriate comments and commands:
     bash
     #!/bin/bash
     set -xe

3. *Make the Script Executable*:
   - Change the script's permissions to make it executable:
     bash
     chmod +x AWSResourceTracker.sh
     

4. *Test the Script*:
   - Run the script manually to ensure it works correctly:
     bash
     ./AWSResourceTracker.sh
     
   - Check the generated aws_resource_report.txt file to verify the output.

5. *Schedule the Script with Cron*:
   - Open the cron job configuration:
     bash
     crontab -e
     

   - Add an entry to run the script daily at 6 PM:
     bash
     0 18 * * * /path/to/AWSResourceTracker.sh
     

6. *Verify Cron Job Execution*:
   - Ensure that the cron job is running as expected and generating the report daily.

7. *Enhance and Maintain the Script*:
   - Review and update the script as needed based on feedback or changes in requirements.
   - Add error handling and logging if required to improve robustness.

### Summary

This project involves creating a script that automates the generation of AWS resource usage reports and schedules it to run daily. By following these steps, you will ensure that resource utilization is consistently monitored and reported, aiding in effective AWS resource management.