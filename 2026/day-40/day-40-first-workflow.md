## Challenge Tasks

### Task 1: Set Up 
```bash
(DONE)
```
---

### Task 2: Hello Workflow
**Verify:** Is it green? Click into the job and read every step.
```bash
YES, it's green, up and running perfectly!
```

---

### Task 3: Understand the Anatomy
Look at your workflow file and write in your notes what each key does:
- `on:` Acts as the trigger event which awakens the pipeline.
- `jobs:` It is the sequence of steps that will run at the same time if they belong to the same stage.
- `runs-on:` specifies the runner on which the jobs will run.
- `steps:` Building blocks of the job. It performs simple, individual tasks at a time.
- `uses:` Includes the actions that needs to be performed.
- `run:` Used to run shell commands directly inside the runner's console at the runtime.
- `name:` (on a step): Not mandatory. Used just to increase the Readibility of the entire workflow.

---

### Task 4: Add More Steps
Update `hello.yml` to also:
1. Print the current date and time
```bash
- name: Current date
  run: date

- name: Current Time
  run: echo "$CURRENT_TIME={{date +'%H:%M:%S'}}" >> GITHUB_ENV

- name: Display Time
  run: echo "${{ env.CURRENT_TIME }}" 
```
2. Print the name of the branch that triggered the run (hint: GitHub provides this as a variable)
```bash
- name: Print the name of the branch
  run: "$github_ref_name"
```
3. List the files in the repo
```bash
- name: List all the files
  run: ls -la
```
4. Print the runner's operating system
```bash
- name: Print the runner's operating syatem
  run: "${{ runner.os }}"
```

Push again — watch the new run.
```bash
(PUSH WORKED SUCCESSFULLY!)
```

---

### Task 5: Break It On Purpose
1. Add a step that runs a command that will **fail** (e.g., `exit 1` or a misspelled command)
2. Push and observe what happens in the Actions tab
3. Fix it and push again

Write in your notes: What does a failed pipeline look like? How do you read the error?
```bash
A failed pipeline will give a RED Signal signinying the workflow failed!
On opening the job in the actions tab, go to the failed step and open it. Observe the step that is failing the test. The error will give away what went wrong in what part of the code.

I wrote:
- name: Print the branch
  run: echo "${{ github.ref_name }}" ## This synatx is wrong!
Corrected Version:
- name: Print the branch
  run: echo "$github.ref_name" ## This synatx is correct!
```

---

## Hints
- Workflow files live in `.github/workflows/` and must end in `.yml`
- `uses: actions/checkout@v4` checks out your code onto the runner
- `run:` executes shell commands
- GitHub provides built-in variables like `${{ github.ref_name }}` for branch name
- Every push triggers a new run — check the Actions tab


---

