#!/bin/bash

# Metadata
# Author: Ankitha
# Date: 2024-05-26
# Purpose: Monitor system health and provide reports
# Version: 1.0

set -x
set -e
set -o pipefail

# Display disk space
echo "Disk Space:"
df -h

# Display memory usage
echo "Memory Usage:"
free -g

# Display number of CPUs
echo "Number of CPUs:"
nproc
