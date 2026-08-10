#!/bin/bash

MAIN=/var/log/maintenance.log

{
        echo "=================================================="
        echo "SYSTEM MAINTENANCE STARTED: $(date +'%Y-%m-%d_%H-%M-%S')"
        echo "=================================================="
        /home/khushi/log_rotation.sh
        /home/khushi/backup.sh

        echo "=================================================="
        echo "SYSTEM MAINTENANCE FINISHED: $(date +'%Y-%m-%d_%H-%M-%S')"
        echo "=================================================="

} >> "$MAIN" 2>&1