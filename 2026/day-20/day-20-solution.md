## Challenge Tasks

### Task 1: Input and Validation
- (DONE) 
Your script should:
1. Accept the path to a log file as a command-line argument
2. Exit with a clear error message if no argument is provided
3. Exit with a clear error message if the file doesn't exist
```bash
#Script within My_Script.sh
---
#!/bin/bash

log_file=$1

if [ -z "$log_file" ]; then
        echo "No argument provided"
        echo "Usage: ./My_Script <log_file>"
        exit 1
fi

if [ ! -f "$log_file" ]; then
        echo "File Does Not Exist!"
        exit 1
fi

echo "File Detected"
echo "Loading..."
```

---

### Task 2: Error Count 
- (DONE)
1. Count the total number of lines containing the keyword `ERROR` or `Failed`
2. Print the total error count to the console

---

### Task 3: Critical Events
- (DONE)
1. Search for lines containing the keyword `CRITICAL`
2. Print those lines along with their line number

Example output:
```
--- Critical Events ---
Line 84: 2025-07-29 10:15:23 CRITICAL Disk space below threshold
Line 217: 2025-07-29 14:32:01 CRITICAL Database connection lost
```

---

### Task 4: Top Error Messages
1. Extract all lines containing `ERROR`
```bash
error=(grep -in "ERROR" "log_file" | awk -F:: '{print $1":"$2}')
```
- OUTPUT:
```bash
5:2026-03-11 10:46:40 [ERROR] Failed to connect - 17817:
9:2026-03-11 10:46:40 [ERROR] Failed to connect - 1555:
13:2026-03-11 10:46:40 [ERROR] Failed to connect - 26185:
27:2026-03-11 10:46:40 [ERROR] Failed to connect - 6352:
30:2026-03-11 10:46:40 [ERROR] Invalid input - 11244:
33:2026-03-11 10:46:40 [ERROR] Out of memory - 8467:
34:2026-03-11 10:46:40 [ERROR] Invalid input - 22949:
42:2026-03-11 10:46:40 [ERROR] Failed to connect - 31961:
44:2026-03-11 10:46:41 [ERROR] Disk full - 16284:
48:2026-03-11 10:46:41 [ERROR] Disk full - 10708:
49:2026-03-11 10:46:41 [ERROR] Disk full - 5475:
50:2026-03-11 10:46:41 [ERROR] Out of memory - 32291:
```
2. Identify the **top 5 most common** error messages
3. Display them with their occurrence count, sorted in descending order
```bash
msg=$(grep -in "ERROR" "$log_file" | awk -F'] | -' '{count[$2]++} END {for (msg in count) count[msg], msg}' | sort -nr | head -n 5)
echo "$msg"
```

Example output:
```
--- Top 5 Error Messages ---
45 Connection timed out
32 File not found
28 Permission denied
15 Disk I/O error
9  Out of memory
```

---

