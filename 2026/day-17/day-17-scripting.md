### Task 1: For Loop
1. Create `for_loop.sh` that:
   - Loops through a list of 5 fruits and prints each one
```bash
#!/bin/bash
for i in Mango Banana Apple Cherry Strawberry
do
        echo "$i"
done
```
2. Create `count.sh` that:
   - Prints numbers 1 to 10 using a for loop
```bash
#!/bin/bash
for (( i=1;i<=10;i++ ))
do
        echo "$i"
done
```

---

### Task 2: While Loop
1. Create `countdown.sh` that:
   - Takes a number from the user
   - Counts down to 0 using a while loop
   - Prints "Done!" at the end
```bash
#!/bin/bash
read n
while((n > 0))
do
        echo "$n"
        (( n=n-1 ))
done
echo "Done!"
```

---

### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
   - Accepts a name as `$1`
   - Prints `Hello, <name>!`
   - If no argument is passed, prints "Usage: ./greet.sh <name>"
```bash
#!/bin/bash
if [[ -z "$1" ]] then
        echo "Usage: ./greet.sh <Name>"
else
        echo "Hey, $1"
fi
```

2. Create `args_demo.sh` that:
   - Prints total number of arguments (`$#`)
   - Prints all arguments (`$@`)
   - Prints the script name (`$0`)
```bash
#!/bin/bash

echo "Number of arguments: $#"
echo "All the arguments: $@"
echo "Script Name: $0"
```
Output:----
```bash
Number of arguments: 3
All the arguments: Mango Banana Apple
Script Name: ./args_demo.sh
```

---

### Task 4: Install Packages via Script
1. Create `install_packages.sh` that:
   - Defines a list of packages: `nginx`, `curl`, `wget`
   - Loops through the list
   - Checks if each package is installed (use `dpkg -s` or `rpm -q`)
   - Installs it if missing, skips if already present
   - Prints status for each package

```bash
Packages=("nginx" "curl" "wget")

for x in "${Packages[@]}"
do
        if dpkg -s "$x"&> /dev/null; then
                echo "$x is already Installed!"
        else
                echo "Installing $x ....."
                sudo apt update "$x"&> /dev/null
                sudo apt install "$x"
                if [ $? -eq 0 ]; then
                        echo "Successfully Installed $x"
                else
                        echo "Failed to Install: Some error occured!"
                fi
        fi
done
```

> Run as root: `sudo -i` or `sudo su`

---

### Task 5: Error Handling
1. Create `safe_script.sh` that:
   - Uses `set -e` at the top (exit on error)
   - Tries to create a directory `/tmp/devops-test`
   - Tries to navigate into it
   - Creates a file inside
   - Uses `||` operator to print an error if any step fails
```bash
   #!/bin/bash

mkdir /tmp/devops-test &> /dev/null || echo "Directory: /tmp/devops-test already Exists!"

if [[ -d /tmp/devops-test ]]; then
        cd /tmp/devops-test
        touch Hello_There.sh
        if [[ -f Hello_There.sh ]]; then
                echo "Both File and Folder Created!"
        else
                echo "File Not Created!"
        fi
else
        echo "Directory Not Created!"
fi
```
OUTPUT:---
```bash
Directory: /tmp/devops-test already Exists!
Both File and Folder Created!
```

Example:
```bash
mkdir /tmp/devops-test || echo "Directory already exists"
```

2. Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.
```bash
#!/bin/bash

if [[ $EUID -ne 0 ]]; then
        echo "Not the root user!"
        echo "Usage: sudo <File_name>"
        exit 1
fi

mkdir /tmp/devops-test &> /dev/null || echo "Directory: /tmp/devops-test already Exists!"

if [[ -d /tmp/devops-test ]]; then
        cd /tmp/devops-test
        touch Hello_There.sh
        if [[ -f Hello_There.sh ]]; then
                echo "Both File and Folder Created!"
                echo "**Everything worked Fine!**"
        else
                echo "File Not Created!"
        fi
else
        echo "Directory Not Created!"
fi
```
OUTPUT:---
```bash
#./safe_scripts.sh :--
Not the root user!
Usage: sudo <File_name>
#sudo ./safe_scripts.sh
Directory: /tmp/devops-test already Exists!
Both File and Folder Created!
**Everything worked Fine!**
```

---

## Hints
- For loop: `for item in list; do ... done`
- While loop: `while [ condition ]; do ... done`
- Arguments: `$1` first arg, `$#` count, `$@` all args
- Check root: `if [ "$EUID" -ne 0 ]; then echo "Run as root"; exit 1; fi`
- Check package: `dpkg -s <pkg> &> /dev/null && echo "installed"`

---

## What I learnt 
- How to use $1 $# $@ $?. 
- How to Create useful scripts like installing packages.
- How to Handle Errors.
- How to switch to root user.

