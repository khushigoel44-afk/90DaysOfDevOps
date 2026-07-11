## Challenge Tasks

### Task 1: Pull Request Event Types (DONE)
Create `.github/workflows/pr-lifecycle.yml` that triggers on `pull_request` with **specific activity types**:
1. Trigger on: `opened`, `synchronize`, `reopened`, `closed`
2. Add steps that:
   - Print which event type fired: `${{ github.event.action }}`
   - Print the PR title: `${{ github.event.pull_request.title }}`
   - Print the PR author: `${{ github.event.pull_request.user.login }}`
   - Print the source branch and target branch
3. Add a conditional step that only runs when the PR is **merged** (closed + merged = true)

Test it: create a PR, push an update to it, then merge it. Watch the workflow fire each time with a different event type.

---

### Task 2: PR Validation Workflow (DONE)
Create `.github/workflows/pr-checks.yml` — a real-world PR gate:
1. Trigger on `pull_request` to `main`
2. Add a job `file-size-check` that:
   - Checks out the code
   - Fails if any file in the PR is larger than 1 MB
3. Add a job `branch-name-check` that:
   - Reads the branch name from `${{ github.head_ref }}`
   - Fails if it doesn't follow the pattern `feature/*`, `fix/*`, or `docs/*`
4. Add a job `pr-body-check` that:
   - Reads the PR body: `${{ github.event.pull_request.body }}`
   - Warns (but doesn't fail) if the PR description is empty

**Verify:** Open a PR from a badly named branch — does the check fail?

---

### Task 3: Scheduled Workflows (Cron Deep Dive) (DONE)
Create `.github/workflows/scheduled-tasks.yml`:
1. Add a `schedule` trigger with cron: `'30 2 * * 1'` (every Monday at 2:30 AM UTC)
2. Add **another** cron entry: `'0 */6 * * *'` (every 6 hours)
3. In the job, print which schedule triggered using `${{ github.event.schedule }}`
4. Add a step that acts as a **health check** — curl a URL and check the response code

Write in your notes:
- The cron expression for: every weekday at 9 AM IST
```bash
- cron: '0 9 * * 1-5'
```
- The cron expression for: first day of every month at midnight
```bash
- cron: '0 0 1 * *'
```
- Why GitHub says scheduled workflows may be delayed or skipped on inactive repos
```bash
Github follows automatic hibernation policy for the repos which are inactive for about 60 days without any code push, new commits or a pull request, where it automatically disables the cron workflow and a manual reactivation is required for the cron workflow to work again. 
```

**Important:** Also add `workflow_dispatch` so you can test it manually without waiting for the schedule.

---

### Task 4: Path & Branch Filters
Create `.github/workflows/smart-triggers.yml`:
1. Trigger on push but **only** when files in `src/` or `app/` change:
   ```yaml
   on:
     push:
       paths:
         - 'src/**'
         - 'app/**'
   ```
2. Add `paths-ignore` in a second workflow that skips runs when only docs change:
   ```yaml
   paths-ignore:
     - '*.md'
     - 'docs/**'
   ```
3. Add branch filters to only trigger on `main` and `release/*` branches
4. Test it: push a change to a `.md` file — does the workflow skip?
```bash
NO, the smart-trigger.yml filw will skip bcz the file modified is not mentioned in the paths of the said file.
The skip_documentation.yml file will skip as well bcz the modified file is mentioned within the path-ignore section of the said file.
```

Write in your notes: When would you use `paths` vs `paths-ignore`?
```bash
1. "paths": It is used when we want to run the workflow when some certain files with specific extensions are modified rather than having the workflow run for all the files modified.
2. "paths-ignore": It is used when we want to run the workflow in all the cases except when the chnage is made to some file which holds no importance with respect to the workflows like the modification to the README.md file. Any modification made to such files will not trigger the workflow.

NOTE: If a single push has a mix of the paths and paths-ignore extension, then github will override the paths-ignore. This is done to ensure that the user's code never leaves out any crucial test.
```

---

### Task 5: `workflow_run` — Chain Workflows Together
Create two workflows:
1. `.github/workflows/tests.yml` — runs tests on every push
2. `.github/workflows/deploy-after-tests.yml` — triggers **only after** `tests.yml` completes successfully:
   ```yaml
   on:
     workflow_run:
       workflows: ["Run Tests"]
       types: [completed]
   ```
3. In the deploy workflow, add a conditional:
   - Only proceed if the triggering workflow **succeeded** (`${{ github.event.workflow_run.conclusion == 'success' }}`)
   - Print a warning and exit if it failed

**Verify:** Push a commit — does the test workflow run first, then trigger the deploy workflow?
```bash
YES, The test workflow ran first and than triggered the deploy workflow!
```

---

### Task 6: `repository_dispatch` — External Event Triggers
1. Create `.github/workflows/external-trigger.yml` with trigger `repository_dispatch`
2. Set it to respond to event type: `deploy-request`
3. Print the client payload: `${{ github.event.client_payload.environment }}`
4. Trigger it using `curl` or `gh`:
   ```bash
   gh api repos/<owner>/<repo>/dispatches \
     -f event_type=deploy-request \
     -f client_payload='{"environment":"production"}'
   ```

Write in your notes: When would an external system (like a Slack bot or monitoring tool) trigger a pipeline?
```bash
1. When i want to trigger a workflow directly from the slack such that a signal is sent to the workflow directly without having to open github explicitely.

```

---

## Hints
- PR merge check: `if: github.event.pull_request.merged == true`
- Cron syntax: `minute hour day-of-month month day-of-week`
- Scheduled workflows only run on the **default branch**
- `workflow_run` gives you access to the triggering workflow's conclusion and artifacts
- `repository_dispatch` requires a personal access token with `repo` scope
- Path filters use glob patterns — `**` matches nested directories

---

## Documentation
Create `day-47-advanced-triggers.md` with:
- Explanation of `workflow_run` vs `workflow_call` in your own words
```bash
1. *workflow_run*:It is a chain reaction. One workflow runs and it's completion acts like a trigger for the other workflow to start executing. 
It is not a part of the current workflow rather it is a completely seperate file waiting for it's turn to start once the current workflow completes it's execution.
2. *workflow_call*: It is a reusable template. If there are 10 projects and each one requires the same setup steps than instaed of writing the same code over and over again, we can create a reusable workflow that can be called using workflow_call and can be used in the 10 projects without having to write the code over and over again.
```

---

