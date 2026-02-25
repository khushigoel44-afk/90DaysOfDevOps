#!/bin/bash

set -euo pipefail

host_name() {
        hostname=$(hostname)
        os=$(uname)
echo "Hostname: $hostname"
echo "OS Name: $os"
}

up_time() {
        up=$(uptime -p)
echo "Uptime is: $up"
}

disk_usage() {
        echo "Disk_usage Involved:"
        du -ah | sort -rh | head -n 5
}

memory_usage() {
        echo "Memory Used:"
        free -h
}

CPU_Process() {
        echo "CPU_Processing Processes are:"
        ps
}
main() {
echo "**********"
host_name
echo "**********"
up_time
echo "**********"
disk_usage
echo "**********"
memory_usage
echo "**********"
CPU_Process
echo "**********"
}
main