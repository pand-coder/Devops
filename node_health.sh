#!/bin/bash

#######################
# Author : Pavan Shanmukha Madhav Gunda 
# Date : 24/09/2024
#
# This Script outputs the node health and allows users to input parameters for filtering processes
#
# Version: v1 
########################

set -x  		# Enable debugging (show commands as they are executed)
set -e 			#exit the script when there is an error can't catch pipe failures 
set -o pipefail 

#Above 3 lines can be written in a single line called 
#set -exo pipefail
#But not recommended



# Displays the disk usage of file systems in a human-readable format
df -h

# Displays the amount of free and used memory in the system in gigabytes
free -g

# Shows the number of processing units (CPU CORES)
nproc 

# Prompt the user for an input parameter
echo "Enter the parameter to filter processes: "
read parameter

# Selecting the required parameter from all available process list and using awk for formatting
ps -ef | grep "$parameter" | awk '{print $1, $2, $8, $9}'

# Explanation:
# $1 - User who owns the process
# $2 - Process ID (PID)
# $8 - Command name
# $9 - Command arguments

set +x  # Disable debugging
