## Challenge Tasks

### Task 1: GitHub Secrets (DONE)
1. Go to your repo → Settings → Secrets and Variables → Actions
2. Create a secret called `MY_SECRET_MESSAGE`
3. Create a workflow that reads it and prints: `The secret is set: true` (never print the actual value)
4. Try to print `${{ secrets.MY_SECRET_MESSAGE }}` directly — what does GitHub show?
```bash
Instead of print the secret code, github prints asterik (***)
```

Write in your notes: Why should you never print secrets in CI logs?
```bash
We should never print secrets in the CI logs bcz:
1. CI logs are accessible to a large number of audience including the developer, tester and even to the audience as well in case of open-source projects.
2. If the credentials are exposed then anyone can gain unauthorised access to the database, cloud infrastructure and the production environment.
```

---

### Task 2: Use Secrets as Environment Variables (DONE)
1. Pass a secret to a step as an environment variable
2. Use it in a shell command without ever hardcoding it
```bash
env:
    USERNAME: ${{ secrets.USERNAME }}
    PASSWORD: ${{ secrets.PASSWORD }}
run: docker login -u "$USERNAME" --password "$PASSWORD"
```
3. Add `DOCKER_USERNAME` and `DOCKER_TOKEN` as secrets (you'll need these on Day 45)

---

### Task 3: Upload Artifacts (DONE)
1. Create a step that generates a file — e.g., a test report or a log file
2. Use `actions/upload-artifact` to save it
3. After the workflow runs, download the artifact from the Actions tab

**Verify:** Can you see and download it from GitHub?
```bash
Yes, in the Actions section, the url of the artifacts is available in the last step of the job. 
On clicking the url, the artifacts gets downloaded automatically.
```

---

### Task 4: Download Artifacts Between Jobs
1. Job 1: generate a file and upload it as an artifact
2. Job 2: download the artifact from Job 1 and use it (print its contents)

Write in your notes: When would you use artifacts in a real pipeline?
```bash
The runners are ephemeral in nature therefore the artifacts are used to store the actual outputs before the virtual machine is lost.
```

---

### Task 5: Run Real Tests in CI (DONE)
Take any script from your earlier days (Python or Shell) and run it in CI:
1. Add your script to the `github-actions-practice` repo
2. Write a workflow that:
   - Checks out the code
   - Installs any dependencies needed
   - Runs the script
   - Fails the pipeline if the script exits with a non-zero code
3. Intentionally break the script — verify the pipeline goes red
4. Fix it — verify it goes green again

---

### Task 6: Caching
1. Add `actions/cache` to a workflow that installs dependencies
2. Run it twice — observe the time difference
3. Write in your notes: What is being cached and where is it stored?
```bash
The downloaded raw package archieves are cached. when pip runs for the 2nd time, it takes these archieves and build the environment locally rather than installing them from the very scratch.
For pip on ubuntu, the files are stored in ~/.cache/pip. When the pip runs for the 2nd time, pip will look in the folder "~/.cache/pip"
since runners are ephemeral in nature, as soon as the job is completed the virtual machine is destroyed. Therefore, the cached data is stored in a zip folder inside github's cloud server. When pip runs for the 2nd time, the zip file is downloaded and the data is retrieved.
```

---

## Hints
- Secrets: `${{ secrets.SECRET_NAME }}`
- Upload artifact: `uses: actions/upload-artifact@v4`
- Download artifact: `uses: actions/download-artifact@v4`
- Cache: `uses: actions/cache@v4`
- GitHub masks secret values in logs automatically

---


