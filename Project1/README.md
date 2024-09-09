### *Project Title*:  
*Node Health Monitoring Script*

### *Use Case*:  
This project involves creating a *shell script* that can be run on any virtual machine (VM) to monitor and retrieve key system health metrics. The script provides details on CPU usage, memory consumption, disk space, and active processes, helping DevOps engineers to quickly assess the health of a node or machine. This is particularly useful for diagnosing performance issues and understanding system resource utilization. The script can be stored in a Git repository for easy retrieval and use by other team members.

### *Commands Used and Their Purpose*:

1. *df -h*  
   - *Purpose*: This command is used to display the disk space usage of the system in a human-readable format (i.e., in gigabytes or megabytes).  
   - *Use*: Helps in monitoring the available and used disk space on different mounted file systems.

2. *free -g*  
   - *Purpose*: Displays the amount of free and used memory in gigabytes.  
   - *Use*: Helps in tracking how much memory is being consumed by applications and how much is free.

3. *nproc*  
   - *Purpose*: Outputs the number of available processing units (CPUs) on the machine.  
   - *Use*: Useful to determine the number of CPU cores available for computation.

4. *top*  
   - *Purpose*: Displays real-time information about system processes, including CPU usage, memory usage, and active processes.  
   - *Use*: Provides insight into which processes are consuming the most system resources.

5. *ps -ef | grep <pattern>*  
   - *Purpose*: The ps -ef command lists all running processes, and grep filters the processes based on the provided pattern (e.g., amazon, apache).  
   - *Use*: Helps identify if a particular service or process (e.g., AWS or Apache) is running on the machine.

6. *awk*  
   - *Purpose*: Used for pattern scanning and processing text-based data. It can extract specific columns from the output of commands (e.g., process ID, memory usage).  
   - *Use*: In conjunction with ps and grep, awk can extract detailed information about processes, such as PID, memory usage, and CPU usage.

7. *set -x*  
   - *Purpose*: Turns on debugging mode, printing each command in the script along with its result before executing.  
   - *Use*: Assists in troubleshooting the script by providing real-time feedback on command execution.

8. *echo*  
   - *Purpose*: Prints custom messages to the terminal.  
   - *Use*: Helps in making the output user-friendly by describing the results of each command (e.g., "Displaying disk space usage").

9. *grep*: Filters output to find specific strings or patterns.

10. *curl*: Retrieves data from a URL, useful for fetching logs from remote storage.

11. *wget*: Downloads files from a URL.

12. *find*: Searches for files and directories within a specified location.

13. *trap*: Handles signals to perform cleanup or specific actions on script termination.

14. *set -e*: Exits the script when a command fails, ensuring the script does not continue executing upon errors.

15. *set -o pipefail*: Ensures the script exits if any command in a pipeline fails.

### *Script Execution Flow*:

1. *Metadata*:  
   At the top of the script, include metadata information (author, date, purpose, and version) for clarity and future reference.
   
2. *Disk Space Check*:
   bash
   echo "Checking Disk Space:"
   df -h
   

3. *Memory Check*:
   bash
   echo "Checking Memory Usage:"
   free -g
   

4. *CPU Check*:
   bash
   echo "Checking CPU Information:"
   nproc
   
   
5. *Enable Debug Mode*:
   bash
   set -x
   
 *Concepts and Commands Learned*

- *Metadata in Scripts*: Using comments at the beginning of the script to describe the author, date, purpose, and version.

- *Debugging*: Using set -x to enable debugging mode, which prints commands and their outputs for troubleshooting.

- *Signal Handling*: Using the trap command to manage signals like SIGINT and SIGTERM, enabling graceful script termination and cleanup.

- *Process Management*: Using ps -ef to list processes and grep to filter specific processes, useful for monitoring and troubleshooting.

- *File Management*: Using find to search for files and directories based on names or patterns.

- *Data Retrieval*: Using curl and wget for fetching and downloading files from remote storage locations.

### *Purpose of the Project*:  
This script simplifies system health monitoring for a DevOps engineer, providing a quick snapshot of the critical health metrics of any node or virtual machine. It can be shared across teams via GitHub and used in various production environments to assess potential performance bottlenecks, memory leaks, or disk usage issues.