### Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script
```bash
#!/bin/bash

greet() {
echo "Hello, $1!"
}
greet "Khushi"
add() {
    echo $(($1+$2))
}
add 4 5
```
```bash
Hello, Khushi!
9
```

---

### Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
```bash
check_disk() {
local usage=$(df -h / | grep / | awk {'print $5'} | tr -d "%")
echo "The disk usage is: $usage"
}
check_disk
```
   - A function `check_memory` that checks free memory using `free -h`
```bash
check_memory() {
        local usage=$(free -h | awk NR==2{'print $4'})
        echo "Free memory available is: $usage"
}
check_memory
```
   - A main section that calls both and prints the results
```bash
The disk usage is: 1
Free memory available is: 7.2Gi
```
---

### Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?
```bash
#!/bin/bash

set -euo pipefail
cat Non-Existant | wc -l
ls /folder_that_does_not_exist
echo "Hello, $name"
```

**Document:** What does each flag do?
- `set -e` → This returns an Error msg if there is any Error in the statements of the Script.
- `set -u` → This returns an Error if there is an undefined variable present within the Script.
- `set -o pipefail` → This returns an Error if the initial part of the piped command is flawed or generates an error. 

---

### Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables
```bash
#!/bin/bash

var() {
local var1="khushi"
var2="Avni"
echo "$var1"
echo "$var2"
}
var
 << Comment
Only the variable var2 gets displayed when called outside the function
The other variable var1 doesn't get displayed!
Comment
echo "$var1"
echo "$var2"
```
```bash
khushi
Avni

Avni
```

---

### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

Output should look clean and readable.
```bash
**********
Hostname: Khushi
OS Name: Linux
**********
Uptime is: up 9 hours, 2 minutes
**********
Disk_usage Involved:
400K    .
188K    ./git-folder
184K    ./git-folder/.git
68K     ./git-folder/.git/hooks
44K     ./git-folder/.git/objects
**********
Memory Used:
               total        used        free      shared  buff/cache   available
Mem:           7.6Gi       500Mi       7.1Gi       3.8Mi       167Mi       7.2Gi
Swap:          2.0Gi          0B       2.0Gi
**********
CPU_Processing Processes are:
    PID TTY          TIME CMD
    317 pts/0    00:00:01 bash
   5265 pts/0    00:00:00 system_info.sh
   5273 pts/0    00:00:00 ps
**********
```

---

## Explanation of `set -euo pipefail`
- Needed when we need to write error-free code so that my script does not fail/crash silently rather some error message is displayed!
- Bash is really kind and forgiving in a way that it simply ignores the common errors and doesn't even bother to flag them. Therefore, <set -euo pipefail> is used.
- set -e : Exits upon Error 
  - Whenever some error is encountered than it simply exits the script and displays the error message accordingly.
- set -u : No unset variable should exist
  - Bash is forgiving to the extent that it won't flag an error even if the variable is not defined. Therefore the need to use the <statement> increases.
- set -o pipefail : Pipe Failure
  - In case of Command 1 | Command 2 type of situation, Even if Command 1 fails but Command 2 runs than bash doesn't flag it as an error. It simply considers it and continues with the next statement.
  - In case of <statement>, if Command 1 fails than the command 2 will not run irrespective of whether it was working or not!

## What you learned (3 key points)
- How to work with functions in Shell Scripting
- How to use <set -euo pipefail> effectively.
- Concept of local variable and how it is different from the Default one.
---

