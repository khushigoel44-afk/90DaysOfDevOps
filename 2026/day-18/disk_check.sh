#!/bin/bash

check_disk() {
local usage=$(df -h / | grep / | awk {'print $5'} | tr -d "%")
echo "The disk usage is: $usage"

}
check_disk


check_memory() {
        local usage=$(free -h | awk NR==2{'print $4'})
        echo "Free memory available is: $usage"
}
check_memory
~