## Challenge Tasks

### Task 1: Understanding Branches
Answer these in your `day-23-notes.md`:
1. What is a branch in Git?
  - It is a lightweight, movable pointer in git that keeps track of the latest changes made in the project.
  - It is not a file or a folder, just a way to keep track of the working branch.
  - Just as we commit, the pointer moves to the latest change made.
  - "HEAD" always points to the current working branch so that we know which branch we are working on.
---
2. Why do we use branches instead of committing everything to `main`?
- Helps in diverting from the main lines of code.
- Add Features and resolve bugs without affecting the normal flow of code.
- When we commit, the HEAD moves forward and points to the latest commit.
- It also shows which branch will be the parent branch for the next commit.
---

4. What happens to your files when you switch branches?
- When we switch branches than the Files inside the current branch overwrite the files of the previous branch.
- If a file appears in Branch A but not in Branch B than on switching from Branch A to B, the files of Branch A will physically disappear from the folder.
- However, the previous files are not lost, they are just stored in the git's databse.
- If there are uncommited changes, than git will refuse to change the branch to made sure that the unsaved work doesn't get lost.

---

### Task 2: Branching Commands — Hands-On
In your `devops-git-practice` repo, perform the following:
1. List all branches in your repo
```bash
git branch 
```
2. Create a new branch called `feature-1`
```bash
git branch feature-1
```
3. Switch to `feature-1`
```bash
git switch feature-1
```
4. Create a new branch and switch to it in a single command — call it `feature-2`
```bash
branch checkout -b feature-1
```
5. Try using `git switch` to move between branches — how is it different from `git checkout`?
```bash
git switch features1 # Will switch HEAD to features1
git switch - # will switch back to master branch
```
  - "git switch":--
    - It only switches the branch. 
    - If a branch doesn't exist than it will simply throw an error.
  - "git checkout":--
    - It can do 3 tasks - 
      - Switch Branches
      - Restore the deleted files
      - Overwrite the folder/file content.
    - If a branch doesn't exist than it might overwrite the content of a file/folder if the name matches. 

6. Make a commit on `feature-1` that does **not** exist on `main`
(DONE)
7. Switch back to `main` — verify that the commit from `feature-1` is not there 
(DONE)
8. Delete a branch you no longer need
```bash
git branch -d Features2
```
9. Add all branching commands to your `git-commands.md` (DONE)

---

### Task 3: Push to GitHub (DONE)
6. Answer in your notes: What is the difference between `origin` and `upstream`?
- "origin": 
  - The term is used when we "clone" a project from github.
  - It is the version of our project on github.
  - when we "git push origin", we are pushing to our own account. 
- "upstream":
  - The term is used when we "fork" a project from github.
  - It is the original repo that we forked from someone else's account.
  - we can only pull/fetch from the upstream to get synced with the changes made by the original author.
---

### Task 4: Pull from GitHub (DONE)
3. Answer in your notes: What is the difference between `git fetch` and `git pull`?
  - "git fetch":
    - It mainly downloads the data like git branch, commits and all the tags.
    - The information gets stored in the local repo but doesn't merge with the code in your working branch.
    - We use this to see what the other team-mates are doing without merging the pulled data with our own code. Thus, avoiding the mess.
  - "git pull":
    - It mainly downloads the data and merges it with the files of the local code in the working repo.
    - Here the information is merged.
    - We do this only when we are absolutely sure about the pulled code and whether we want to merge it or not in the current working branch.
---

### Task 5: Clone vs Fork
1. **Clone** any public repository from GitHub to your local machine
```bash
git clone <url for the github repo>
```
2. **Fork** the same repository on GitHub, then clone your fork
```bash
*Simply click on fork on the original account on github*
git clone <url for the github repo from my git account>
```
3. Answer in your notes:
   - What is the difference between clone and fork?
     - Clone:
       - Downloading the code from my github account to my computer.
       - The code lives in the local hard-disk.
       - It is done when some changes to the code needs to be made.
     - Fork:
       - Downloading someone else's repo to your own github account.
       - Code remains on the git's server.
       - It is done when we need someone else's code or need to contribute to the existing work.
     
   - When would you clone vs fork?
     - Clone
       - If we want to continue a project on a local setup. 
     - Fork
       - If we want to get someone else's work on our own account and contribute to it.
   - After forking, how do you keep your fork in sync with the original repo?
     - By using the "sync repo" option available on the forked page on one's own github account. 

---