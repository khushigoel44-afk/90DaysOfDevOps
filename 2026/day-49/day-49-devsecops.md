## Task
You can build and deploy automatically. But what if your Docker image has a known vulnerability? What if someone accidentally commits a password? Today you learn **DevSecOps** — adding simple, automated security checks to your pipeline so problems are caught **before** they reach production.

Don't worry — this isn't a security course. You're just adding a few smart steps to the pipeline you already built.

---

## Expected Output
- Security scanning added to your `github-actions-capstone` repo (from Day 48)
- A markdown file: `day-49-devsecops.md`
- Screenshot of a security scan running in your pipeline

---

## What is DevSecOps?

Think of it like this:

**Without DevSecOps:**
> You build the app → deploy it → a security team finds a vulnerability weeks later → you scramble to fix it

**With DevSecOps:**
> You open a PR → the pipeline automatically checks for vulnerabilities → you fix it before it ever gets merged

**That's it.** DevSecOps = adding security checks to the pipeline you already have. Not a separate process — just a few extra steps.

---

## Key Principles (Keep These in Mind)

1. **Catch problems early** — A vulnerability found in a PR takes 5 minutes to fix. The same vulnerability found in production takes days.

2. **Automate the checks** — Don't rely on someone remembering to check. Let the pipeline do it every time.

3. **Block on critical issues** — If a scan finds a serious vulnerability, the pipeline should fail — just like a failing test.

4. **Never put secrets in code** — Use GitHub Secrets (you learned this on Day 44). No `.env` files, no hardcoded API keys.

5. **Give only the access needed** — Your workflow doesn't need write access to everything. Limit permissions.

---

## Challenge Tasks

### Task 1: Scan Your Docker Image for Vulnerabilities (DONE)
Your Docker image might use a base image with known security issues. Let's find out.

Add this step to your main branch pipeline (after Docker build, before deploy):
```yaml
- name: Scan Docker Image for Vulnerabilities
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'your-username/your-app:latest'
    format: 'table'
    exit-code: '1'
    severity: 'CRITICAL,HIGH'
```

What this does:
- `trivy` scans your Docker image for known CVEs (Common Vulnerabilities and Exposures)
- `format: 'table'` prints a readable table in the logs
- `exit-code: '1'` means **fail the pipeline** if CRITICAL or HIGH vulnerabilities are found
- If it passes, your image is clean — proceed to push and deploy

Push and check the Actions tab. Read the scan output.

**Verify:** Can you see the vulnerability table in the logs? Did it pass or fail?
```bash
YES, the vulnerablilties were present. The step failed when vulnerblilties were detected!
```

Write in your notes: What CVEs (if any) were found? What base image are you using?
```bash
For both the Frontend and the Backend, a package mismatch was detected.
For backend, i am using python image.
```

---

### Task 2: Enable GitHub's Built-in Secret Scanning (DONE)
GitHub can automatically detect if someone pushes a secret (API key, token, password) to your repo.

1. Go to your repo → Settings → **Code security and analysis**
2. Enable **Secret scanning**
3. If available, also enable **Push protection** — this blocks the push entirely if a secret is detected

That's it — no workflow changes needed. GitHub does this automatically.

Write in your notes:
- What is the difference between secret scanning and push protection?
```bash
  -  Secret_Scanning: This feature will scan the pushed code for any secrets, passwords and any compromised file that has already been pushed to the remote GitHub. It scans the code after it has been pushed to GitHub and generates an alert if any credential is compromised with. Now there is a need to rotate or revoke the commit immediately.
  - Push_Protection: This feature will scan the code before pushing the code to remote. If any compromised credential is detected than the code push is rejected entirely and there is no code (containing the compromised credential) in the remote. Therefore, there is no need to revoke or remove the commit immediately.
```
- What happens if GitHub detects a leaked AWS key in your repo?
```bash
  -  Since GitHub is a legal partner of AWS in Secret scanning program, therefore it immediately sends an alert to AWS along with the leaded key.
  -  AWS restricts the key's permissions which will override all the permissions given by the owner and the key will be under quarantine.
  -  AWS will then send notification to the key's owner through their AWS account regarding the leaked key.
  -  It will then notify the repo owner along with the commit id and the leaked key so that the repo administrator knows which key was leaked and at which commit.
  -  The repo owner can then delete the key from the AWS console and IAM and generate a new one for further activities.
  -  Therefore, no code should be pushed to gihtub without enabling the Push Protection from the repo's settings.
```

---

### Task 3: Scan Dependencies for Known Vulnerabilities (DONE)
If your app uses packages (pip, npm, etc.), those packages might have known vulnerabilities.

Add this to your **PR pipeline** (not the main pipeline):
```yaml
- name: Check Dependencies for Vulnerabilities
  uses: actions/dependency-review-action@v4
  with:
    fail-on-severity: critical
```

This checks any **new** dependencies added in the PR against a vulnerability database. If a dependency has a critical CVE, the PR check fails.

Test it:
1. Open a PR that adds a package to your app
2. Check the Actions tab — did the dependency review run?

**Verify:** Does the dependency review show up as a check on your PR?

---

### Task 4: Add Permissions to Your Workflows
By default, workflows get broad permissions. Lock them down.

Add this block near the top of your workflow files (after `on:`):
```yaml
permissions:
  contents: read
```

If a workflow needs to comment on PRs, add:
```yaml
permissions:
  contents: read
  pull-requests: write
```

Update at least 2 of your existing workflow files with a `permissions` block.

Write in your notes: Why is it a good practice to limit workflow permissions? What could go wrong if a compromised action has write access to your repo?
```bash
  -  If broad permissions are provided to the workflow, then an attacker can inject malicious lines of code into the pipeline and thus will have the access to run those workflows that they are not authorised to do. 
  -  The attackers can change the source code of the owner and thus have access to the workflows that they are not supposed to interfere with.
  -  If an attacker gets the write permissions to a workflow than they can force push a malicious code to the main branch without any peer-review of the pull request.
  -  Some attacker can replace the docker image with a malicious image to steal or disrupt the code workings.
```

---

### Task 5: See the Full Secure Pipeline
Look at what your pipeline does now:

```
PR opened
  → build & test
  → dependency vulnerability check     ← NEW (Day 49)
  → PR checks pass or fail

Merge to main
  → build & test
  → Docker build
  → Trivy image scan (fail on CRITICAL) ← NEW (Day 49)
  → Docker push (only if scan passes)
  → deploy

Always active
  → GitHub secret scanning              ← NEW (Day 49)
  → push protection for secrets         ← NEW (Day 49)
```

Draw this diagram in your notes. You just built a **DevSecOps pipeline** — security is now part of your automation, not an afterthought.
---
```bash
==================================================
              P R   O P E N E D
==================================================
[ PR Opened ] 
      |
[ Build & Test ]
      |
[ Dependency Vulnerability Check ] <--- SECURITY GATE
      |
[ PR Status ] 
==================================================


==================================================
           M E R G E   T O   M A I N
==================================================
[ Merge to Main ]
      |
[ Build & Test ]
      |
[ Docker Build ]
      |
[ Trivy Image Scan ]               <--- SECURITY GATE
      |
[ Docker Push ] (Only if scan passes)
      |
[ Deploy ]
==================================================


==================================================
        A L W A Y S   A C T I V E
==================================================
[ GitHub Secret Scanning ]         <--- SECURITY GUARD
[ Push Protection for Secrets ]    <--- SECURITY GUARD
==================================================
```
---

---

## Brownie Points (Optional — For the Curious)

### Pin Actions to Commit SHAs
Tags like `@v4` can be moved by the action author. For extra security, pin to the exact commit:
```yaml
# Instead of this:
uses: actions/checkout@v4

# Use this:
uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11 # v4.1.1
```
This protects against supply chain attacks where a tag is silently changed.

### Upload Scan Results to GitHub Security Tab
Add SARIF output to Trivy and upload it — your scan results will appear in the repo's **Security** tab:
```yaml
- uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'your-username/your-app:latest'
    format: 'sarif'
    output: 'trivy-results.sarif'
- uses: github/codeql-action/upload-sarif@v3
  with:
    sarif_file: 'trivy-results.sarif'
```

### Learn About OIDC (Keyless Authentication)
Instead of storing cloud credentials as long-lived secrets, GitHub Actions can use OIDC to get short-lived tokens automatically. Research: "GitHub Actions OIDC" — it's how production pipelines authenticate to AWS, GCP, and Azure without storing any keys.

---

## Hints
- Trivy action docs: look up `aquasecurity/trivy-action` on GitHub
- `exit-code: '1'` = fail the step, `exit-code: '0'` = just warn
- Dependency review only works on `pull_request` events (not on push)
- Permissions block goes at the workflow level or the job level
- GitHub secret scanning is free for public repos

---

