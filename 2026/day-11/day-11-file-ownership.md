## Challenge Tasks

### Task 1: Understanding Ownership 

Document: What's the difference between owner and group?
- Owner: It refers to the person who owns the file or the directory/folder.
- group: It refers to collection of owners refering to the same file/directory.

---

### Task 2: Basic chown Operations 

1. Create file `devops-file.txt`
```bash
touch devops-file.txt
```
2. Check current owner: `ls -l devops-file.txt`
```bash
ls -l devops-file.txt
```
3. Change owner to `tokyo` (create user if needed)
```bash
sudo chown tokyo devops-file.txt
```
4. Change owner to `berlin`
```bash
sudo chown berlin devops-file.txt
```
5. Verify the changes
```bash
ls -l // All the changes made are visible.
```

**Try:**
```bash
sudo chown tokyo devops-file.txt
```

---

### Task 3: Basic chgrp Operations 

1. Create file `team-notes.txt`
```bash
touch team-notes.txt
```
2. Check current group: `ls -l team-notes.txt`
```bash
ls -l team-notes.txt
```
3. Create group: `sudo groupadd heist-team`
```bash
sudo groupadd heist-team
tail -n 5 /etc/group
```
4. Change file group to `heist-team`
```bash
sudo chgrp heist-team team-notes.txt
```
5. Verify the change
```
Group of team-notes.txt file got changed to heist-team.
```

---

### Task 4: Combined Owner & Group Change 

Using `chown` you can change both owner and group together:

1. Create file `project-config.yaml`
```bash
touch project-config.yaml
```
2. Change owner to `professor` AND group to `heist-team` (one command)
```bash
sudo chown professor:heist-team project-config.yaml
```
3. Create directory `app-logs/`
```bash
mkdir app-logs/
```
4. Change its owner to `berlin` and group to `heist-team`
```bash
sudo chown berlin:heist-team app-logs/
```

**Syntax:** `sudo chown owner:group filename`

---

### Task 5: Recursive Ownership 

1. Create directory structure:
   ```
   mkdir -p heist-project/vault
   mkdir -p heist-project/plans
   touch heist-project/vault/gold.txt
   touch heist-project/plans/strategy.conf
   ```

2. Create group `planners`
```bash
sudo groupadd planners
```

3. Change ownership of entire `heist-project/` directory:
   - Owner: `professor`
   - Group: `planners`
   - Use recursive flag (`-R`)
   ```bash
   sudo chown -R professor:planners heist-project 
   // Chnages the owner and the group of every file/folder inside the heist-project folder.
   ```

4. Verify all files and subdirectories changed
```bash
ls -lR heist-project/
```

---

### Task 6: Practice Challenge 

1. Create users: `tokyo`, `berlin`, `nairobi` (if not already created)
```bash
sudo useradd tokyo
sudo useradd berlin
sudo useradd nairobi
```
2. Create groups: `vault-team`, `tech-team`
```bash
groupadd vault-team
groupadd tech-team
```
3. Create directory: `bank-heist/`
```bash
mkdir bank-heist/
```
4. Create 3 files inside:
```bash
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
 ```

5. Set different ownership:
   - `access-codes.txt` → owner: `tokyo`, group: `vault-team`
   ```bash
   sudo chown tokyo:vault-team access-codes.txt
   ```
   - `blueprints.pdf` → owner: `berlin`, group: `tech-team`
   ```bash
   sudo chown berlin:tech-team blueprints.pdf
   ```
   - `escape-plan.txt` → owner: `nairobi`, group: `vault-team`
   ```bash
    sudo chown nairobi:vault-team escape-plan.txt
   ```

**Verify:** `ls -l bank-heist/`

## Files & Directories Created
- app-logs
- bank-heist
  - access-codes.txt
  - blueprints.pdf
  - escape-plan.txt
- heist-project
  - plans
    - strategy.conf
  - vault
    - gold.txt
- team-notes.txt
- project-config.yaml

## What I Learned
- How to Change the owner and the group of a File/Folder.
- How to do the same with the help of a Single Command.