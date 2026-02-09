## Challenge Tasks

### Task 1: Create Users

#**Create three users with home directories and passwords:**
```
adduser tokyo
adduser berlin
adduser professor
```

#**Verify:** Check `/etc/passwd` and `/home/` directory
```
grep tokyo /etc/passwd
grep berlin /etc/passwd
grep professor /etc/passwd
```

### Task 2: Create Groups 

#**Create two groups:**
```
addgroup developers
addgroup admins
```

#**Verify:** Check `/etc/group`
```
tail -n 5 /etc/group 
// Both the added groups are displayed.
```

### Task 3: Assign to Groups 

#**Assign users:**
```
usermod -aG developers tokyo
usermod -aG admins tokyo
usermod -aG developers,admins berlin
usermod -aG developers,admins professor
```

#**Verify:** Use appropriate command to check group membership
```
groups tokyo
groups berlin
groups professor
```

### Task 4: Shared Directory 
```
// Create directory
cd /opt
mkdir dev-projects

// Set group owner 
sudo chown :developers dev-projects

//Set permissions to '775'
sudo chmod 775 dev-projects

//Test by creating files
touch tokyo
touch berlin
```

**Verify:** Check permissions and test file creation
```
ls -l  //Displays the files and created - 'tokyo' and 'berlin'
```

### Task 5: Team Workspace 

```
// Create user
adduser nairobi
grep nairobi /etc/passwd // Verifies the user creation
 
// Create group
addgroup project-team 
tail -n 5 /etc/group // Verifies the group creation

// Add user to group
sudo usermod -aG project-team nairobi

//Create /opt directory
cd /opt
mkdir team-workspace

// Change owner
sudo chown :project-team team-workspace 

// Set group permissions
chmod 775 project-team

// Creating files
sudo touch nairobi
ls 
```

#What I learnt
- How to add user to group
- How to modify the permissions.
- How to modify the owner.
 
