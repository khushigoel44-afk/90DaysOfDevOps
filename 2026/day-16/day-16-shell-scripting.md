## Challenge Tasks

### Task 1: Your First Script
1. Create a file `hello.sh`
```bash
vim hello.sh
```
2. Add the shebang line `#!/bin/bash` at the top
```bash
// tap i
#!/bin/bash
```
3. Print `Hello, DevOps!` using `echo`
```bash
echo "Hello, Devops!"
```
4. Make it executable and run it
```bash
chmod +x hello.sh
./hello.sh
```

**Document:** What happens if you remove the shebang line?
- If Shebang is removed than either the file has only the basic commands or it has some Bash-specific commands:
  - Basic Commands: Even without the Shebang, script will run without any error. 
  - Bash-type Commands: If the shebang is removed than most probably the script will not run and will generate a "Synatx error".
  - Code Syntax where the script will fail/produce error:--
  ```bash
  name = ("Mango","Apple","Orange")

  for name in ${name[@]}; 
  do
     echo "Hey, My name is $name";
  done

  #./hello.sh: 5: Syntax error: "(" unexpected
  ```
- Without shebang such type of codes will fail and generate Syntax Error as shown above.
---

### Task 2: Variables
1. Create `variables.sh` with:
   - A variable for your `NAME`
   ```bash
   NAME="Apple"
   ```
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   ```bash
   ROLE="Devops Engineer"
   ```
   - Print: `Hello, I am <NAME> and I am a <ROLE>`
   ```bash
   echo "Hello, I am $NAME and I am a $ROLE"
   ```
2. Try using single quotes vs double quotes — what's the difference?
- *With Double Quotes*: The script.sh runs perfectly fine.
- *With Single Quotes*: The Symbols loose their meaning. The following is displayed as the output.
```bash
Hey There, I am $name and my role is $role
```

---

### Task 3: User Input with read
1. Create `greet.sh` that:
   - Asks the user for their name using `read`
   ```bash
   read name
   ```
   - Asks for their favourite tool
   ```bash
   read tool
   ```
   - Prints: `Hello <name>, your favourite tool is <tool>`
   ```bash
   echo "My name is $name and i really like $tool"
   ```

---

### Task 4: If-Else Conditions
1. Create `check_number.sh` that:
   - Takes a number using `read`
   ```bash
   #!/bin/bash
   read num 
   ```
   - Prints whether it is **positive**, **negative**, or **zero**
   ```bash
   if [[ num -eq 0]]; then 
       echo "zero"
   elif [[ num -gt 0]]; then 
       echo "Positive"
   else 
       echo "Negative"
   ```

2. Create `file_check.sh` that:
   - Asks for a filename
   ```bash
   read filename
   ```
   - Checks if the file **exists** using `-f`
   ```bash
   if [[ -f $filename ]]; then
       echo "$filename EXists"
   else 
       echo "$filename DOse not exist"
   ```
   - Prints appropriate message

---

### Task 5: Combine It All
Create `server_check.sh` that:
1. Stores a service name in a variable (e.g., `nginx`, `sshd`)
```bash
service=nginx
```
2. Asks the user: "Do you want to check the status? (y/n)"
```bash
echo "Do you want to check the status? (y/n)"
read res
```
3. If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
```bash
if [[ $res == 'y' ]]; then
        status=$(systemctl is-active "$service")
        if [[ "$status" == "active" ]]; then
                echo "Active"
        else
                echo "Not Active"
        fi
else
        echo "Skipped.."
fi
```
4. If `n` — prints "Skipped."


---

### What I learned ---
- How to Write a basic shell script.
- How to take input from the user
- How effective shell scripted files are for a devops engineer.
- How the tasks become easy with a pre-generated shell-script file.

---
