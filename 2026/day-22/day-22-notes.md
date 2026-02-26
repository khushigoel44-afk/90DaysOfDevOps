### Task 1: Install and Configure Git
1. Verify Git is installed on your machine
```bash
git --version
```
```bash
git version 2.43.0
```
2. Set up your Git identity — name and email
```bash
git config --global user.name Khushi
git config --global user.gmail Khushi2200@gmail.com
```
3. Verify your configuration
```bash
git config --list
```

---

### Task 2: Create Your Git Project
1. Create a new folder called `devops-git-practice`
```bash 
mkdir devops-git-practice
```
2. Initialize it as a Git repository
```bash
git init
```
3. Check the status — read and understand what Git is telling you
```bash
git status
```
4. Explore the hidden `.git/` directory — look at what's inside
```bash
cd .git/
ls -l // Look for various files and folders inside .git/ folder.


```

---

### Task 3: Create Your Git Commands Reference 
(FILE ADDED ALONGSIDE)

---

### Task 4: Stage and Commit
1. Stage your file
2. Check what's staged
3. Commit with a meaningful message
4. View your commit history
```bash
## COMMIT HISTORY

commit 66f0d76b68fd7d7c94535dc6a97cddef3a75fb6f (HEAD -> master)
Author: Khushi <KhushiGoel2200@gmail.com>
Date:   Thu Feb 26 05:14:19 2026 +0000

    Added all the Git Commands used so far

commit 0fa2c6f2d2515d4179330db7ed3ea41971822bc5
Author: Khushi <KhushiGoel2200@gmail.com>
Date:   Thu Feb 26 05:03:14 2026 +0000

    Added some More Commands Used so far!

commit 779bc4e71543c2443c03e72222d8bebfaa63c1a8
Author: Khushi <KhushiGoel2200@gmail.com>
Date:   Thu Feb 26 04:55:47 2026 +0000

    Added Some Viewing Commands

commit fea186c2d34039066f3643da531400422cd0c6e3
Author: Khushi <KhushiGoel2200@gmail.com>
Date:   Thu Feb 26 04:51:44 2026 +0000

    Added Some Basic Git Commands
```

---

### Task 5: Make More Changes and Build History 
(ADDED THE COMMIT HISTORY IN TASK 4 SECTION)

---

### Task 6: Understand the Git Workflow
1. What is the difference between `git add` and `git commit`?
  - "git add"
    -  "Stages" the file from the "Untracked" Stage.
    - Passes every change from local directory to the staging area.
    - There is no permanent record of the histor yet.
  - "git commit"
    -  Takes everything from the Staging Area and wraps it up in a commit.
    -  The changes are stored in the history.
---
2. What does the **staging area** do? Why doesn't Git just commit directly?
  - "Staging Area"
    - It acts like a Buffer b/w my actual work and the chnages which i want to save in my git history.
    - It acts like an area where the draft can be stored so that i have the choice/control to handle whatever i want to push to the git history.
    - It gives me a chance as to whether i want the chnages to move to the permanent git history or not.
  - "Why Git doesn't commit directly"
    - To maintain the authenticity of the changes and to ensure that only the meaningful changes are present in the git history.
    - Helps in keeping the git history clean and away from all the chaos.
---
3. What information does `git log` show you?
  - "git log"
    - It displays the commit history with the most recent being at the top and the rest following it in the top-down manner.
  - "git log --oneline"
    - It displays the commit history in a single line making it readable and easy to understand the changes.
---
4. What is the `.git/` folder and what happens if you delete it?
  - "./git"
    - It is the Brain and Soul of the my project.
    - It has got every single detail of my project.
    - It is the actual git repo that has got all the project's data.
  - "If ./git gets deleted"
    - If the ./git gets deleted than every detail associated with the project will be lost/deleted.
    - The git repo will be lost and the folder will be a simple folder without any git reference to it.
---
5. What is the difference between a **working directory**, **staging area**, and **repository**?
  - "working directory":
    - This is the actual file/folder that i am working upon.
    - If it gets deleted than the changes cannot be retrieved.
    - Chnages made here are not saved.
  - "staging area":
    - Acts like a Buffer b/w the working directory and the permanent git history.
    - Here the changes can be saved as a draft without keeping it in the permanent git history.
  - "repository": (.git Folder)
    - "git commit" is the command used to save the chnages from the staged to the git history.
    - Any changes made after this can be easily tracked and compared.

---

