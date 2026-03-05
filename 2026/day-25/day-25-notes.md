## Challenge Tasks

### Task 1: Git Reset — Hands-On
1. Make 3 commits in your practice repo (commit A, B, C)
2. Use `git reset --soft` to go back one commit — what happens to the changes?
   - On running "git reset --soft HEAD~1", The HEAD of the commit history goes back by 1 commit.
   - The file is now in the staging area.
3. Re-commit, then use `git reset --mixed` to go back one commit — what happens now?
   - On running "git reset --mixed HEAD~1", the HEAD moves back by 1 commit.
   - The file is now in the Unstaged Area.
   - Used when - 
     - commit needs to be split into 2.
     - You realise that you have made a mistake in the file and need to recommit.
4. Re-commit, then use `git reset --hard` to go back one commit — what happens this time?
   - On using "git reset --hard HEAD~1", the HEAD goes back by 1 commit.
   - The staging area is cleared of any commits that were made.
   - The data from the file is physically deleted from your system, i.e. the changes that were commited are now lost along with the physical evidence of it from your system.
5. Answer in your notes:
   - What is the difference between `--soft`, `--mixed`, and `--hard`?
      - "--soft": 
        - Head moves back by 1 commit (HEAD~1)
        - The file moves to the staging area.
        - Used - when some error in the commit msg is detected.
      - "--mixed":
        - Head moves back by 1 commit (HEAD~1)
        - File moves back to the unstaged area.
        - used - When the commit needs to be divided into 2 parts.
      - "--hard":
        - Head moves back by 1 commit (HEAD~1)
        - File is physically deleted from your system.
        - used - When you realise that the work done was not needed and instead of deleting it, we use --hard.
   - Which one is destructive and why?
      - "--hard" is destructive, as it responsible for removing the file physically from your system.
      - If by mistake "--hard" is used on an important file than it will be gone forever. There is no way by which the file can be retrieved.
   - Should you ever use `git reset` on commits that are already pushed?
      - No, Once the commit is pushed it is not advised to use "git reset" as it will lead to massive conflicts.
      - "git reset" is only for the local machine and should not be used if the code is already on github.
      - If you do so then - 
        - Once you reset a commit, you will then have to force push the commit back which will be very difficult.
        - If you are in a team, then the work of the other members will also get messy leading to massive conflicts.
        - Professional Alternative is to use *"git revert"*.

---

### Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)
2. Revert commit Y (the middle one) — what happens?
3. Check `git log` — is commit Y still in the history?
   - Yes, Commit Y is still in the history.
4. Answer in your notes:
   - How is `git revert` different from `git reset`?
      - "git reset":
        - It's like a time machine that can erase past mistakes.
        - It messes with the history, solving which turns out to be nightmare.
        - The length of log decreases.
      - "git revert":
        - It simply Creates a new commit storing the content without the mistake that you wanted to delete.
        - It is the professional way of dealing with the mistakes.
        - It doesn't mess up the history.
        - The length of log increases.
   - Why is revert considered **safer** than reset for shared branches?
      - "revert" prevents the history from getting messed up.
      - It is also easy while working in a team otherwise it will turn out to be nightmare for the other team members.
      - It is the professional way of dealin with mistakes.
   - When would you use revert vs reset?
      - "revert": While i am working in a team and there is something that i commited by mistake.
      - "reset": While i am on my local machine and have commited something that i wasn't supposed to.

---

### Task 3: Reset vs Revert — Summary
Create a comparison in your notes:

| | `git reset` | `git revert` |
|---|---|---|
| What it does | Erases the mistake | Crosses the mistake |
| Removes commit from history? | Yes | No |
| Safe for shared/pushed branches? | No | Yes |
| When to use | While working on local. | While working on github in a team. |

---

### Task 4: Branching Strategies
Research the following branching strategies and document each in your notes with:
- How it works (short description)
- A simple diagram or flow (text-based is fine)
- When/where it's used
- Pros and cons

1. **GitFlow** — develop, feature, release, hotfix branches
  - Not everything can be pushed to the main branch and so there is a certain flow that needs to be followed - 
    - main: It is the master branch used for the production work.
    - develop: It is the branch integration for all the features.
    - feature/: It is a temporary branch for testing out the features.
    - release: It is mainly used for Bug Fixing.
    - hotfix/: It is used for quick patch production without waiting for the next release.

  - Flow: Feature --> Devlop --> release --> main & Develop

  - Used: When there is a scheduled time set for the release of the product (a bank having a set schedule to release the new version of their app every month)

  - Pros:
     - It is organised and predictable.
     - Used when multiple versions of the project need to be managed.
     - Clearly states - "Work in progress" and "Finished product".

  - Cons:
     - It is quite tedious for the modern, fast working teams.
     - "Merging" can turn out to be nightmare.
     - slows down deployment.
---
2. **GitHub Flow** — simple, single main branch + feature branches
  - It is an easy and agile version of the gitflow used above.
  - There is only a single master branch - main. Rest all are other branches are a part of the main branch.

  - Used: All the modern startups and open-source work are done using the github flow.

  - Flow: main --> Feature-branch --> pull-request --> code review(Feature-branch) --> merge into main --> deploy

  - Pros: 
    - It is easy to understand and work upon.
    - No "main" and "develop" branch confusion.
    - Encourages Continuous Delivery (CD)

  - Cons: 
    - Not feasible if multiple versions of the software are being monitored.
    - main can become unstable if the testing process isn't perfect.
---
3. **Trunk-Based Development** — everyone commits to main, short-lived branches
  - Everyone commits to the main branch only.
  - Might have temporary feature branches which are eliminated within 24 hours.

  - used: Companies like Google, Netflix, Microsoft use this Trunk based technique as they have a lot of Automation work.

  - Flow: Local Changes --> Small/frequent commits --> main branch

  - Pros: 
    - It is the fastest speed
    - Eliminates the conflicts created by merges.

  - Cons: 
    - Even a single bad commit can disrupt the workflow of the company.
    - Not for beginners. Requires senior level discipline.
    - Requires "Feature-flags" - merged code but "turned off" to hide unfinished work.
---
4. Answer:
   - Which strategy would you use for a startup shipping fast?
     - Trunk-based Development
   - Which strategy would you use for a large team with scheduled releases?
     - GitFlow
   - Which one does your favorite open-source project use? (check any repo on GitHub)
     - Github Flow

---

### Task 5: Git Commands Reference Update
- (DONE)

---


