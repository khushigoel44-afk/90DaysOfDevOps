## Challenge Tasks

### Task 1: Git Merge — Hands-On
1. Create a new branch `feature-login` from `main`, add a couple of commits to it
```bash
git checkout -b feature-login
git add <file>
git commit -m "<Commit msg>"
git log --oneline
```
2. Switch back to `main` and merge `feature-login` into `main`
```bash
git switch main
git merge feature-login
```
3. Observe the merge — did Git do a **fast-forward** merge or a **merge commit**?
```bash
It did a Fast-Forward Merge. 
# why?
# Once the feature-login branch was created, no new change to the main branch was done. Therefore main branch just had to catch up with the feature-login branch and no new commit needs to be made.  
```
4. Now create another branch `feature-signup`, add commits to it — but also add a commit to `main` before merging 
- (DONE)
5. Merge `feature-signup` into `main` — what happens this time?
```bash
It will do Merge Commit 
# why??
# Unlike previous case, this time even the main branch had new commits after the commits were made in feature-signup branch. 
# main branch did not have to catch up to the other branch
# A new commit which wasn't in either of the branches is included - signifying the merge commit!.
```
6. Answer in your notes:
   - What is a fast-forward merge?
     - we commit to the main branch
     - we then switch to another other branch say "dev"
     - we make commits to dev branch
     - switch back to main branch but all the commits of dev are gone!
     - use - "git merge dev"
     - all the commits of dev synced with that of main branch.
     - This is fast-forward merge.
   ---
   - When does Git create a merge commit instead?
     - we commit to dev branch. 
     - switch back to main branch and make necessary commits there as well.
     - now both the branches have moved - have their own commits.
     - use - "git merge dev" in the main branch.
     - this merge is "merge commit"
     - Git will create a new commit that is not present in either of the branches and signifies only that the 2 branches have merged.
   ---
   - What is a merge conflict? (try creating one intentionally by editing the same line in both branches)
     - I have two branches - main and dev
     - In the main branch i made some changes in the New_File's line 4 and then commited the changes.
     - In the dev branch also i made some changes in the New_File's line 4 and commited the changes.
     - when i used "git merge dev" in the main branch, it caused a conflict.
     - This is the classic example of "merge conflict"
     - It is than resolved by following the steps - 
        - vim New_File
        - Making the changes to the file as per the requirement.
        - git add New_File
        - git commit 
        - git log --oneline 
        - // The branches will be merged now. This is a classic example of merge commit!.

---

### Task 2: Git Rebase — Hands-On
5. Answer in your notes:
   - What does rebase actually do to your commits?
     - for "git rebase main", it just takes main as the thread and re-creates all the latest commits of dev on top of the main branch.
   ---
   - How is the history different from a merge?
     - Unlinke merge where the history looks like a that of a bubble/diamond and the timeline of the commits is maintained, here the history is linear and without any diamonds in between. Also the timeline is not maintained.
   --- 
   - Why should you **never rebase commits that have been pushed and shared** with others?
     - *Issue 1:* --
       - My friend does commit A
       - I rebase that Commit A in my local. It becomes Commit A'.
       - Now when i push my chnages to git, it will have 2 versions of the same file - Commit A and Commit A'.
     - *Issue 2:* --
       - If someone will try to pull the changes of commit A then git will get confused as to which version of the file is asked for - A or A'.
       - Git will then try to merge the two files creating a mess/conflict.
   ---
   - When would you use rebase vs merge?
     - I would use "merge" when i want to keep track of which branch did which commit (timeline). I would use "rebase" to make sure that my commit history is kept clear and readable without any bumps/diamonds in between and only if the timeline re-creation is not a problem.


---

### Task 3: Squash Commit vs Merge Commit
6. Answer in your notes:
   - What does squash merging do?
     - It merges the many short-messy commits into a single commit so that the history becomes readable and clear. 
   ---
   - When would you use squash merge vs regular merge?
     - I would use "regular merge" when i want to have the clear history of commits made by the team members.
     - I would use "squash merge" when i feel that i have made quite some messy and several short commits which practically have zero to no impact on the overall project/file. This will combine the messy commits into a single commit.
   ---
   - What is the trade-off of squashing?
     - If there is a certain bug in the project, then it will be very difficult to find which part has caused the error.
     - If there were 3 attempts made to get to the point then with squash it is not possible to view the attempts.
     - Two people are working on the same file. I squashed all the commits then it will be very difficult for the other team member to commit the changes since the base is gone. 

---

### Task 4: Git Stash — Hands-On
8. Answer in your notes:
   - What is the difference between `git stash pop` and `git stash apply`?
    - "git stash apply":--
      - Brings back the changes when the immediate work is done.
      - It's like a "Copy" of the stash is kept for the future reference.
      - It is used in case the same thing needs to be used in multiple branches.
    - "git stash pop":-- 
      - Brings back the changes when the immediate work is done.
      - It's like "Moving" the data of the stash to the working directory.
      - The stash is immediately deleted.
   ---
   - When would you use stash in a real-world workflow?
     - "The Emergency Pull": If your 60% work is done and you feel like there is some more imp work to do then we can simply switch the branch after using stash.
     - "The Wrong Branch": If you are halfway done with your work and you realise that you are in the wrong branch. Then you can use the "stash" to immediately switch the branch.
     - "Testing "What if" Scenerio": If you want to check what the code will look like if the "change" is not present then Stash is used.

---

### Task 5: Cherry Picking
5. Answer in your notes:
   - What does cherry-pick do?
     - "Cherry-pick" is used to merge only some specific commits of some dev branch to the main branch.
     - This is used when all the commits need not to be merged.
   ---
   - When would you use cherry-pick in a real project?
     - While working on a project, you do multiple rough commits but only some professional ones or the stable ones can be merged with the main branch. In such situations cherry-pick is used.
   ---
   - What can go wrong with cherry-picking?
     - Once a specific commit is cherry-picked, then you realise that the commit before it was also needed then the situation might turn out messy.
     - In case, after Cherry-pick you realise that you wanted the entire commits merged into the main branch. Then it will be very messy to do it.

---

## Hints
- Visualize history: `git log --oneline --graph --all`
- To intentionally create a merge conflict: edit the **same line** of the **same file** on two branches
- Stash with a message: `git stash push -m "description"`
- Cherry-pick needs a commit hash — find it with `git log --oneline`

---

## Submission
1. Add your `day-24-notes.md` to `2026/day-24/`
2. Update `git-commands.md` with all new commands and commit
3. Push to your fork

