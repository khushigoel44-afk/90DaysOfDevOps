## Challenge Tasks

### Task 1: Install and Authenticate
1. Install the GitHub CLI on your machine (DONE)
2. Authenticate with your GitHub account (DONE)
3. Verify you're logged in and check which account is active (DONE)
4. Answer in your notes: What authentication methods does `gh` support? 
   - Majorly There are 3 ways By which this can be done:--
      - Web Browser (OAuth): Default Web Browser is opened. You sign-up to your Github account. The browser sends an authentication code back to the terminal.
      - PAT (Personal Access Token): Generate a token manually from your github settings and paste it directly into the CLI. 
      - Environment Variables: Set up the Environment Variables like GIT_HUB or GI_HUB in your system. The CLI will automatically detect the token without any manual login.  

---

### Task 2: Working with Repositories
1. Create a **new GitHub repo** directly from the terminal — make it public with a README
```bash
gh repo create test-repo --public --add-readme
```
2. Clone a repo using `gh` instead of `git clone`
```bash
gh repo <repo-url>
```
3. View details of one of your repos from the terminal
```bash
gh repo view <repo-url>
```
4. List all your repositories
```bash
gh repo list
```
5. Open a repo in your browser directly from the terminal
```bash
gh repo view --web
```
6. Delete the test repo you created (be careful!)
```bash
gh repo delete <repo-url> --confirm
```

---

### Task 3: Issues
1. Create an issue on one of your repos from the terminal — give it a title, body, and a label
```bash
gh issue create --title "Fix the login button" --body "The login button is unresponsive on mobile phones" --label "bug"
```
2. List all open issues on that repo
```bash
gh issue list
```
3. View a specific issue by its number
```bash
gh issue view 1
```
4. Close an issue from the terminal
```bash
gh issue close 1
```
5. Answer in your notes: How could you use `gh issue` in a script or automation?
  - "gh issues" are designed to be user-friendly. They can be used in a scripts or automation in the following ways:--
    - CI/CD Integration: For Instance, if a build task fails, than an issue will be generated and it will be assigned to the developer who pushed the code.
    - Bulk Management: We can write a bash script which will loop through the CSV, and will automatically create multiple issues which is much faster than the web UI.

---

### Task 4: Pull Requests
1. Create a branch, make a change, push it, and create a **pull request** entirely from the terminal
```bash
git checkout -b feature-branch  
# create a switch to a new branch

git add . 
# stage the changes made

git commit -m "Added a New Branch" 
# Commit the changes so that they can be tracked in the future.

git push -u origin feature-branch 
# Push the changes from local to remote

gh pr create --title "Added a New Branch" --body "Added a New Branch feature-branch to test out the features" 
# created a pull request along with the title and the body
```
2. List all open PRs on a repo
```bash
gh pr list
```
3. View the details of your PR — check its status, reviewers, and checks
```bash
gh pr view --status
```
4. Merge your PR from the terminal
```bash
gh pr merge
```
5. Answer in your notes:
   - What merge methods does `gh pr merge` support?
     - Merge Commit: Here the individual commits of the feature-branch are relayed to the main branch. A seperate commit is added as well.
     - Rebase: Every commit is relayed to the main branch without any seperate commit.
     - Squash: All the commits of the feature-branch are concised into a single commit which is then pushed into the main branch. This makes the commit history look very clear and readable.
   - How would you review someone else's PR using `gh`?
     - This can be done using the following 3 commands:--
       - Checkout: Pull the code into your local and review it.
       ```bash
       gh pr checkout <number>
       ```
       - Diff: Check the difference in the code
       ```bash
       gh pr diff
       ```
       - Review: Review the code, approve it if everything feels good. Else add comments for improvement.
       ```bash
       gh pr review --approve # If the code is good
       gh pr review --comment -b "Correct the typo in line 20, looks good otherwise." # If there is any need for improvemnt.
       ```

---

### Task 5: GitHub Actions & Workflows (Preview)
1. List the workflow runs on any public repo that uses GitHub Actions
2. View the status of a specific workflow run
3. Answer in your notes: How could `gh run` and `gh workflow` be useful in a CI/CD pipeline?
  - They can be useful in the following ways:--
    - Real-Time Monitoring: 
      - ```bash
        gh run watch
        ```
      - the above command will enable the real time progress of the workflow in the terminal. This is perfect for watching a deployment finish without leaving the terminal.
    - Manual Triggers: Sometimes the job is set to "workflow_dispatch" mode which means that the workflow needs to be triggered manually for it to work.
    - Local Debugging: Instaed of making small dummy commits to the repo, check for the working of the workflow on local.

---

### Task 6: Useful `gh` Tricks
Explore and try these — add the ones you find useful to your `git-commands.md`:
1. `gh api` — make raw GitHub API calls from the terminal
```bash
gh api user
```
  - To get the raw JSON Formatted data from github's data.
2. `gh gist` — create and manage GitHub Gists
```bash
gh gist create scripts.py 
gh gist list # list down all the gists available
```
  - Create a file without creating a repo for the same.
3. `gh release` — create and manage releases
```bash
gh release create v1.0.0 --title "Version 2.5" --notes "A new version of the app has been released"
```
4. `gh alias` — create shortcuts for commands you use often
```bash
gh alias
```
  - Create an alias for the long commands which are used quite frequently.
5. `gh search repos` — search GitHub repos from the terminal
```bash
gh search repos "AI" --language:python --sort:stars
```
- To search the entire database of github and find the specific projects/repos.

---

## Submission
1. Add your `day-26-notes.md` to `2026/day-26/`
2. Update `git-commands.md` with `gh` commands — this completes your Git & GitHub reference from Days 22–26
3. Push to your fork
