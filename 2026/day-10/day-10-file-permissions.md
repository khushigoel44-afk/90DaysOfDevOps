## Challenge Tasks

### Task 1: Create Files 

1. Create empty file `devops.txt` using `touch`
```
touch devops.txt
```
2. Create `notes.txt` with some content using `cat` or `echo`
```
echo "Hello There!" >> notes.txt
cat notes.txt
```
3. Create `script.sh` using `vim` with content: `echo "Hello DevOps"`
```
echo "Hello Devops" >> scripts.sh
vim scripts.sh // open scripts.sh in editor mode
```

**Verify:** `ls -l` to see permissions
```
ls -l // 3 files created so far are displayed.
```

---

### Task 2: Read Files 

1. Read `notes.txt` using `cat`
```
cat notes.txt
```
2. View `script.sh` in vim read-only mode
```
vim scripts.sh // :wq to exit
```
3. Display first 5 lines of `/etc/passwd` using `head`
```
head -n 5 /etc/passwd
```
4. Display last 5 lines of `/etc/passwd` using `tail`
```
tail -n 5 /etc/passwd
```

---

### Task 3: Understand Permissions 

Format: `rwxrwxrwx` (owner-group-others)
 `r` = read (4), `w` = write (2), `x` = execute (1)
 ```
 chmod 764 devops.txt
 chmod 766 notes.txt
 chmod 777 scripts.sh
 ```

Check your files: `ls -l devops.txt notes.txt script.sh`
```
ls -l // Displays all the 3 said files with changed permissions.
```

Answer: What are current permissions? Who can read/write/execute?
```
Before Permissions were changed:--
- Devops.txt:-
   - *Owner*: Read, Write
   - *Group*: Read
   - *User*: Read
- notes.txt:
   - *Owner*: Read, Write
   - *Group*: Read
   - *User*: Read
- scripts.sh:
   - *Owner*: Read, Write
   - *Group*: Read
   - *User*: Read
After Permissions were changed:--
- Devops.txt: 
   - *Owner*: Read, write, execute
   - *Group*: Read, write
   - *User*: Read
- notes.txt:
   - *Owner*: Read, write, execute
   - *Group*: Read, write
   - *User*: Read, write
- scripts.sh:
   - *Owner*: Read, write, execute
   - *Group*: Read, write, execute
   - *User*: Read, write, execute
```

---

### Task 4: Modify Permissions 

1. Make `script.sh` executable → run it with `./script.sh`
```
chmod +x scripts.sh
ls -l
```
2. Set `devops.txt` to read-only (remove write for all)
```
chmod 444 devops.txt
```
3. Set `notes.txt` to `640` (owner: rw, group: r, others: none)
```
chmod 640 notes.txt
```
4. Create directory `project/` with permissions `755`
```
mkdir project/
chmod 755 project/
```

**Verify:** `ls -l` after each change

---

### Task 5: Test Permissions 

1. Try writing to a read-only file - what happens?
- While trying to write to a read-only file, the following message is displayed - -bash: devops.txt: Permission denied
2. Try executing a file without execute permission
- Without the execute permission, the following message is displayed - -bash: ./scripts.sh: Permission denied
3. Document the error messages
- -bash: devops.txt: Permission denied
- -bash: ./scripts.sh: Permission denied

---

## Files Created
- Devops.txt
- notes.txt
- scripts.sh

## Permission Changes
- devops.txt: 
   - *Before*: -rw-r--r--
   - *After*: -rwxrw-r-- 
- notes.txt: 
   - *Before*: -rw-r--r--
   - *After*: -rwxrw-rw-
- scripts.sh: 
   - *Before*: -rw-r--r--
   - *After*: -rwxrwxrwx

## What I Learned
- How to read from and write to files
- How to modify permissions of the file