## Challenge Tasks

### Task 1: Multi-Job Workflow
Create `.github/workflows/multi-job.yml` with 3 jobs:
- `build` — prints "Building the app"
```bash
 - name: prints "Building the app"
   run: echo "Building the app"
```
- `test` — prints "Running tests"
```bash
needs: [build]
 - name: prints "Running tests"
   run: echo "Running tests"
```
- `deploy` — prints "Deploying"
```bash
needs: [test]
 - name: prints "Deploying"
   run: echo "Deploying"
```

Make `test` run only **after** `build` succeeds.
Make `deploy` run only **after** `test` succeeds.

**Verify:** Check the workflow graph in the Actions tab — does it show the dependency chain?
```bash
(YES, THE DEPENDENCY GRAPH IS DISPLAYED ON GITHUB!)
(SCREENSHOT ATTACHED)
```

---

### Task 2: Environment Variables (DONE)
In a new workflow, use environment variables at 3 levels:
1. **Workflow level** — `APP_NAME: myapp`
2. **Job level** — `ENVIRONMENT: staging`
3. **Step level** — `VERSION: 1.0.0`

Print all three in a single step and verify each is accessible.

Then use a **GitHub context variable** — print the commit SHA and the actor (who triggered the run).

---

### Task 3: Job Outputs
1. Create a job that **sets an output** — e.g., today's date as a string
```bash
date_info:
    outputs:
        current-date: ${{ steps.date-step.outputs.today }}
```
2. Create a second job that **reads that output** and prints it
```bash
print-date:
    - name: Print the output
      run: echo "The data is ${{ needs.date_info(#output_job_name).outputs.current-date(#variable_from_output_job) }}" 
```
3. Pass the value using `outputs:` and `needs.<job>.outputs.<name>`

Write in your notes: Why would you pass outputs between jobs?
```bash
Jobs in github actions run in seperate, individual virtual environents bcz of which one job doesn't have access to the date, variables and the file system of another job. In order to bridge this gap, outputs are used.
```

---

### Task 4: Conditionals (DONE)
In a workflow, add:
1. A step that only runs when the branch is `main`
2. A step that only runs when the previous step **failed**
3. A job that only runs on **push** events, not on pull requests
4. A step with `continue-on-error: true` — what does this do?
```bash
Whenever a job in Github actions fail then all the jobs/steps following it will not run and the overall status will be red (failed).

With continue-on-error: true: ---
The jobs will continue to run ever after some error is detected during the workflow and the overall status of the workflow will be Success.
```

---

### Task 5: Putting It Together (DONE)
Create `.github/workflows/smart-pipeline.yml` that:
1. Triggers on push to any branch
2. Has a `lint` job and a `test` job running in parallel
3. Has a `summary` job that runs after both, prints whether it's a `main` branch push or a feature branch push, and prints the commit message
```bash
run: echo "current Branch is ${{ github.ref_name }}"
run: echo "Commit Message is ${{ github.event.head_commit.message }}"
```

---

## Hints
- Job dependency: `needs: [job-name]`
- Set output: `echo "date=$(date)" >> $GITHUB_OUTPUT`
- Read output: `${{ needs.job-name.outputs.date }}`
- Conditionals: `if: github.ref == 'refs/heads/main'`
- Commit message: `${{ github.event.commits[0].message }}`

---


