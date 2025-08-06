## 🛠️ Project Title:

**Node Health Monitoring Script**

---

## 🧠 Problem Statement:

As a DevOps engineer or system administrator, it’s essential to regularly check the **health of servers or virtual machines** — especially in production. But doing this **manually every time** (checking disk, memory, CPU, etc.) is **time-consuming, error-prone**, and inconsistent.

There’s a need for an **automated, reusable script** that can quickly give a complete picture of a system’s health.

---

## ✅ What Problem Does This Script Solve?

* **Eliminates manual system checks** by automating health monitoring.
* Gives a **quick and consistent report** of disk, memory, CPU, and process status.
* Helps identify **resource bottlenecks** and running services quickly.
* Makes system monitoring **scriptable and shareable** within DevOps teams.
* Prevents performance issues by giving visibility into system usage.

---

## 🎯 What You Will Learn By Doing This Project:

| Concept                    | What You'll Learn                                           |
| -------------------------- | ----------------------------------------------------------- |
| **Shell scripting**        | Writing reusable scripts with comments, flow, and logic     |
| **System health commands** | `df`, `free`, `nproc`, `top`, `ps`, `grep`, `awk`           |
| **Debugging**              | Using `set -x`, `set -e`, `set -o pipefail`                 |
| **Signal handling**        | Using `trap` for safe exits                                 |
| **Data handling**          | Parsing outputs using `awk` and `grep`                      |
| **Remote tools**           | Using `curl`, `wget` for remote downloads                   |
| **File search**            | Using `find` to locate logs or files                        |
| **Script organization**    | Adding metadata, comments, and making scripts user-friendly |

---

## 📂 Real-World Use Case:

> You’re managing 10+ VMs. A few users report that their applications are slow. Instead of logging into each VM and manually checking usage, you run this **Node Health Script** — it shows memory is maxed out on 2 nodes, and one is low on disk space. You act fast. Problem solved.

---

## 📝 Script Execution Steps (Human-Readable Style):

### 1. **Add Script Metadata**

Every good script starts with a header:

```bash
# Author: Ankitha V
# Date: 2025-08-06
# Purpose: Node Health Monitoring Script
# Version: v1.0
```

---

## 🔍 **Command**

### 1. `df -h`

* **What it does**: Shows disk space usage on all mounted file systems.
* **Options used**:

  * `-h`: human-readable format (GB/MB).
* **Why it's useful**: Helps you see if any partition is running out of space, which could crash applications or services.
* **Sample output**:

  ```
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda1        50G   45G   5G   90% /
  ```

---

### 2. `free -g`

* **What it does**: Displays total, used, and free memory (RAM).
* **Options used**:

  * `-g`: shows values in gigabytes.
* **Why it's useful**: Helps identify if your system is running low on memory or has memory leaks.
* **Sample output**:

  ```
               total        used        free
  Mem:            16           14          2
  ```

---

### 3. `nproc`

* **What it does**: Shows the number of available CPU cores.
* **Why it's useful**: Helps you understand how many processors are available for parallel tasks or workloads.
* **Sample output**:

  ```
  4
  ```

---

### 4. `top`

* **What it does**: Displays real-time CPU, memory, and process usage.
* **Why it's useful**: Helps you monitor which processes are using the most resources.
* **Note**: Usually interactive; use `top -b -n 1` in scripts for batch mode.
* **Sample output** (interactive):

  ```
  PID USER  PR  NI  VIRT  RES  SHR S %CPU %MEM  TIME+  COMMAND
  1234 root  20   0  500m  50m  10m R  80.0  25.0  0:10.20 java
  ```

---

### 5. `ps -ef`

* **What it does**: Lists all running processes with full details.
* **Why it's useful**: Helps check which services are running, who started them, and their IDs.
* **Sample output**:

  ```
  UID   PID  PPID   CMD
  root  123     1   /usr/sbin/apache2
  ```

---

### 6. `grep <pattern>`

* **What it does**: Filters output to match specific keywords.
* **Why it's useful**: Helps search for specific services (e.g., `apache`, `amazon`, `nginx`) in process lists.
* **Example**:

  ```bash
  ps -ef | grep apache
  ```

---

### 7. `awk`

* **What it does**: Processes and extracts data from command output by columns.
* **Why it's useful**: Helps print specific fields like PID, CPU, memory, etc., cleanly.
* **Example**:

  ```bash
  ps aux --sort=-%mem | awk 'NR<=6{print $1, $2, $3, $4, $11}'
  ```

  * Prints top 5 memory-consuming processes:

    * `$1`: user
    * `$2`: PID
    * `$3`: CPU %
    * `$4`: MEM %
    * `$11`: command

---

### 8. `set -x`

* **What it does**: Enables debug mode — prints each command before executing it.
* **Why it's useful**: Helpful for troubleshooting and understanding script flow.

---

### 9. `set -e`

* **What it does**: Makes the script stop if any command fails.
* **Why it's useful**: Prevents the script from continuing after an error (safe execution).

---

### 10. `set -o pipefail`

* **What it does**: Makes the script fail if any command in a pipeline fails.
* **Why it's useful**: Ensures that failures in piped commands are not ignored.

---

### 11. `echo`

* **What it does**: Prints messages to the terminal.
* **Why it's useful**: Adds readability to script output (labels, headers, info).

---

### 12. `curl <url>`

* **What it does**: Downloads or fetches content from a URL.
* **Why it's useful**: Helpful to pull log files or monitoring data from remote servers.

---

### 13. `wget <url>`

* **What it does**: Another tool to download files from URLs.
* **Why it's useful**: Similar to `curl`, often used for downloading packages, configs, or logs.

---

### 14. `find`

* **What it does**: Searches for files/directories based on name, type, size, etc.
* **Why it's useful**: Helpful to find log files, large files, or any specific file on the server.
* **Example**:

  ```bash
  find /var/log -name "*.log"
  ```

---

### 15. `trap`

* **What it does**: Catches signals like `CTRL+C` (SIGINT) and runs cleanup code.
* **Why it's useful**: Helps safely stop the script or clean up temporary files on exit.
* **Example**:

  ```bash
  trap 'echo "Exiting..."; exit 1' SIGINT SIGTERM
  ```


