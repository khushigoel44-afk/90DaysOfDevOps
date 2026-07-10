## Challenge Tasks

### Task 1: Understand `workflow_call`
Before writing any code, research and answer in your notes:
1. What is a **reusable workflow**?
```bash
- A workflow that can call another workflow.
- It is used to reduce the steps by centralising the standard CI/CD steps.
- Editing a single file will have the logic updated for all the calling repos.
```
2. What is the `workflow_call` trigger?
```bash
- It is a keyword used with the `on` configuration in the workflow.
- This specifies that the workflow is reusable and is open to external calls.
- This defines the input, output and the secrets that the caller must provide.
```
3. How is calling a reusable workflow different from using a regular action (`uses:`)?
```bash
1. Resuable Workflows:--
    - It uses it's own "run-on" matrix.
    - It runs the entire jobs
    - It's execution makes the Github UI distinct and visually appealing.
2. Regular Actions:--
    - It uses the runner's environment.
    - It runs steps inside a single job.
    - No change in the UI is detected.
```
4. Where must a reusable workflow file live?
```bash
- The reusable workflow file lives inside the .github/workflows folder
- The caller must access it using the @branch, @tag and @sha
- Public repos workflow are accessible to everyone but the private repos are accessible only to the repos within the same organistation or repos of the same account (depending upon the settings).
```

---

### Task 2: Create Your First Reusable Workflow (DONE)
Create `.github/workflows/reusable-build.yml`:
1. Set the trigger to `workflow_call`
2. Add an `inputs:` section with:
   - `app_name` (string, required)
   - `environment` (string, required, default: `staging`)
3. Add a `secrets:` section with:
   - `docker_token` (required)
4. Create a job that:
   - Checks out the code
   - Prints `Building <app_name> for <environment>`
   - Prints `Docker token is set: true` (never print the actual secret)

**Verify:** This file alone won't run — it needs a caller. That's next.

---

### Task 3: Create a Caller Workflow
Create `.github/workflows/call-build.yml`:
1. Trigger on push to `main`
2. Add a job that uses your reusable workflow:
   ```yaml
   jobs:
     build:
       uses: ./.github/workflows/reusable-build.yml
       with:
         app_name: "my-web-app"
         environment: "production"
       secrets:
         docker_token: ${{ secrets.DOCKER_TOKEN }}
   ```
3. Push to `main` and watch it run

**Verify:** In the Actions tab, do you see the caller triggering the reusable workflow? Click into the job — can you see the inputs printed?
```bash
YES, the reusable workflow is triggered and the inputs are printed!
```

---

### Task 4: Add Outputs to the Reusable Workflow
Extend `reusable-build.yml`:
1. Add an `outputs:` section that exposes a `build_version` value
2. Inside the job, generate a version string (e.g., `v1.0-<short-sha>`) and set it as output
3. In your caller workflow, add a second job that:
   - Depends on the build job (`needs:`)
   - Reads and prints the `build_version` output

**Verify:** Does the second job print the version from the reusable workflow?
```bash
YES, the version from the reusable workflow is printed correctly.
```

---

### Task 5: Create a Composite Action
Create a **custom composite action** in your repo at `.github/actions/setup-and-greet/action.yml`:
1. Define inputs: `name` and `language` (default: `en`)
2. Add steps that:
   - Print a greeting in the specified language
   - Print the current date and runner OS
   - Set an output called `greeted` with value `true`
3. Use the composite action in a new workflow with `uses: ./.github/actions/setup-and-greet`

**Verify:** Does your custom action run and print the greeting?
```bash
YES, The custom action prints the greetings.
```

---

### Task 6: Reusable Workflow vs Composite Action
Fill this in your notes:

| | Reusable Workflow | Composite Action |
|---|---|---|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | YES | NO |
| Can contain multiple steps? | YES | YES |
| Lives where? | .github/workflows | .github/actions/my-action |
| Can accept secrets directly? | YES | NO |
| Best for | Standardising the CI/CD Pipelines for the complete build-test-deploy setup across multiple repos | doing repetitive tasks or actions like install node, install dependencies etc into a single reusable step |

---

## Hints
- Reusable workflows must be in `.github/workflows/` directory
- Caller syntax: `uses: ./.github/workflows/file.yml` (same repo) or `uses: org/repo/.github/workflows/file.yml@main` (cross-repo)
- Composite action: `action.yml` with `runs: using: "composite"`
- Reusable workflow outputs: `on: workflow_call: outputs: name: value: ${{ jobs.job-id.outputs.name }}`
- A reusable workflow can be called by at most 20 unique caller workflows in a single run

---



