## Challenge Tasks

### Task 1: The Problem
Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:
1. What can go wrong?
```bash
1. merge conflicts
2. workflow triggers conflict: The one who will be pushing the code will have the workflow running according to him.
3. If a developer A changes the settings of the server manually and forgets to tell others then next time someone pushes the code, the server will fail and the code will break.
4. If a developer A and developer B delpoys the code at the same time than there is a high possibilty that the code of developer A is accidently overwritten by that od developer B.
5. If a bug hits than it is nearly impossible to detect what code pushed by who failed the production and what file is currently running.
```
2. What does "it works on my machine" mean and why is it a real problem?
```bash
This is actually a real problem as:
  - The developer has the code but how will the client have access to that code!
  - After deploying on some common deployment platform, the client has the code but there is still tech version mismatch.
  - Multiple people are working together on a project but have different OS, about 40% of their time will be spent in trying to figure out how to overcome the OS mismatch.
```
3. How many times a day can a team safely deploy manually?
```bash
It is suggested to to deploy only once manually as manual deployment requires intense human concentration. Overstraining will lead to fatigue. Therefore, it is suggested to deploy a project manually only once per day.
```

---

### Task 2: CI vs CD
Research and write short definitions (2-3 lines each):
1. **Continuous Integration** 
```bash
- what happens: The Developer pushes the code, then the builds and the tests will be done automatically. 

- how often: Multiple times a day. Usually when the developer pushes the code or creates a pull request.

- what it catches: Syntax errors, failed builds, failed tests, defective lint tests etc.
```
2. **Continuous Delivery** 
```bash
- how it's different from CI: CI focuses mainly on building and testing the code but Continuous Delivery focuses on taking to code to live production.

- what "delivery" means: All the code pushed is automatically compiled, packaged and deployed into the testing stage. It only requires a *Human click* to move to the production stage.
```
3. **Continuous Deployment** 
```bash 
- how it differs from Delivery: It is different bcz in delivery there is no need for any human intervention as that in C deployment. Everything is done automatically once the code passes the CI pipeline tests.

- when teams use it: It is used by mature engineering teams having high end automated CI pipelines and production grade projects.
```

Write one real-world example for each.
```bash
CI: If a developer adds a new feature like login page to the app. The automated tests will run. If there is some crash with the password/credentials, the code will not be merged and the test will fail.

CD (Delivery): The developers of the bank app updates the transaction algorithm. The pipeline builds, tests and deploys successfully, the developer then schedule the release of the update for midnight by clicking on the "APPROVE" button.

CD (Deployment): If any E-Commerce application like Amazon or Netflix have any UI feature updated and all the tests work successfully than the changes made to the UI will be made directly available to the millions of audience within minutes without any human intervention (manual clicks). 
```

---

### Task 3: Pipeline Anatomy
A pipeline has these parts — write what each one does:
- **Trigger** — what starts the pipeline
```bash
It is an event that starts the pipeline and tell it to run. Examples include, pushing the code to a branch, opening the pull request etc.
```
- **Stage** — a logical phase (build, test, deploy)
```bash
It is a phase in the deployment lifecycle that groups the related work together. Pipelines run the stages sequentially like if the TEST stage hasen't completed yet, the DEPLOY stage won't start running until then.
```
- **Job** — a unit of work inside a stage
```bash
These are the collection of sequential steps bound to a specific environment. Jobs belonging to the same stage run at the same time (like the frontend test job and the backend test job will run at the same time if they belong to the same stage!)  
```
- **Step** — a single command or action inside a job
```bash
It is the smallest, individual building block of code inside a job. It is a single execution unit like running a single shell command, calling a build-in plugin or creating environment varibles.
```
- **Runner** — the machine that executes the job
```bash
These are the physical servers, virtual machines or the dokcer containers that host and execute the pipeline. 
It listens for the incomming jobs from the pipeline platforms like GitHub or GitLabs, run the commands and report back the logs.
```
- **Artifact** — output produced by a job
```bash
These are the files or the collection of files that are generated from the pipelines and are stored for the future reference. 
Common examples include - compiled binary files, zip packages and the code lint logs.
```

---

### Task 4: Draw a Pipeline
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Include at least 3 stages. Hand-drawn and photographed is perfectly fine.

```bash
(PHOTO ATTACHED IN THE MAIN REPO)
```
---

### Task 5: Explore in the Wild
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
2. Find their `.github/workflows/` folder
3. Open one workflow YAML file
4. Write in your notes:
   - What triggers it?
   ```bash
    1. On pushing the code to main branch
    2. On opening a Pull Request 
   ```
   - How many jobs does it have?
   ```bash
    It has only a single job that is to build the image 
   ```
   - What does it do? (best guess)
   ```bash
    1.  It checkouts the code
    2. Setup nodejs (nodejs based application)
    3. Install dependencies
    4. Build the application image
   ```

---

## Hints
- CI/CD is a practice, not just a tool
- GitHub Actions, Jenkins, GitLab CI, CircleCI — all are tools that implement CI/CD
- A pipeline failing is not a problem — it's CI/CD doing its job

---

