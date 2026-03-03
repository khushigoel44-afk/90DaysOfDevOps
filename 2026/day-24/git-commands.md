### GIT COMMANDS CHEATSHEET!! ###

**Setup & Config**
- mkdir <Git-Folder>
  - Creates a Normal Folder

- cd <Git-Folder>
  - Go inside the Created Folder

- git init
  - Converts the Normal Folder into a Git Folder

- git status
  - Displays msg "On Branch Master" and "No Commits Added" type msgs.

- git config --global user.name Khushi
  - Conveys your Name to the System

- git config --global user.gmail KhushiGoel2200@gmail.com
  - Conveys your Gmail to the System

  **Basic Workflow**
- git add
  - Stages <File>
  - Converts the file from Unstaged to Staged section i.e. file is ready to get commited

- git commit -m "<Comments To be displayed>"
  - To Keep the file tracked
  - To keep track of the changes in the file/folder with the help of <comments> added.

- git rm --cached <file_name>
  - To unstage the file

- git branch
  - Specifies the branch that i am working upon.

- git branch -D <Existing_branch>
  - Removes the existence of the <Existing_branch>

- git push origin <branch>
  - Push the changes to the <branch> so that even if the file gets deleted, it can still be retrieved from the history.

- git pull origin <branch>
  - Pull the changes from the forked repo to my local.

- git remote -v
  - specifies the https links for the push and pull repos.
  - "origin" is a keyword used to specify these two push and pull locations.
  - Instead of using the full links - "origin" is used.

  **Viewing Changes**
- git status
  - Displays whether the File/Folder is--
    - Untracked
    - Staged
    - Tracked

- git log
  - Displays the Commit History
  - List of all the Commits that happened so far

- git log --oneline
  - Displays the git commit history in a single line.
  - Readibility increases in case several commits were made.

- git log --oneline --graph
  - Displays the git commit history including the branch merges.

- git branch <New_Branch>
  - Creates a new branch explicitely.

- git switch <New_Branch>
  - Switch to a new branch.

- git switch -
  - Move back to the previous branch

- git checkout -b <New_branch>
  - New Branch <New_branch> is created and we switch to it from our current working branch.

- git checkout <Existing_branch>
  - Switch to an <Existing_branch> from the current working branch.

- git merge dev
  - Merge the commits to dev branch

- git rebase dev
  - To merge all the new changes of dev branch on top of main

- git reflog
  - Displays all the commits without any merges. (Basically displays the history in an expanded manner).

- git merge --squash dev
- git commit -m "<Commit comment>"
  - Will mske the commits consice to increase the readibility.

-git stash
  - Will hide the unfinished content of the pwd. Helps in switching the branch, even with incomplete work.

-git cherry-pick <commit_ID>
  - will merge the commit with <commit_ID> only rather than merging the whole commit history.
