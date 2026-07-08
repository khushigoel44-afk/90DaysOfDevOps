## Challenge Tasks

### Task 1: Prepare (DONE)
1. Use the app you Dockerized on Day 36 (or any simple Dockerfile)
2. Add the Dockerfile to your `github-actions-practice` repo (or create a minimal one)
3. Make sure `DOCKER_USERNAME` and `DOCKER_TOKEN` secrets are set from Day 44

---

### Task 2: Build the Docker Image in CI (DONE)
Create `.github/workflows/docker-publish.yml` that:
1. Triggers on push to `main`
2. Checks out the code
3. Builds the Docker image and tags it

**Verify:** Check the build step logs — does the image build successfully?
```bash
Yes, the image build successfully!
```

---

### Task 3: Push to Docker Hub
Add steps to:
1. Log in to Docker Hub using your secrets
2. Tag the image as `username/repo:latest` and also `username/repo:sha-<short-commit-hash>`
```bash
short_sha=$(echo "${{ github.sha }}" | cut -c1-7)
```
3. Push both tags

**Verify:** Go to Docker Hub — is your image there with both tags?
```bash
Yes, images with both the tags are available on dockerhub!
```

---

### Task 4: Only Push on Main (DONE)
Add a condition so the push step only runs on the `main` branch — not on feature branches or PRs.

Test it: push to a feature branch and verify the image is built but NOT pushed.

---

### Task 5: Add a Status Badge (DONE)
1. Get the badge URL for your `docker-publish` workflow from the Actions tab
2. Add it to your `README.md`
3. Push — the badge should show green

---

### Task 6: Pull and Run It
1. On your local machine (or a cloud server), pull the image you just pushed
2. Run it
3. Confirm it works
```bash
YES, it does work perfectly fine!
```

Write in your notes: What is the full journey from `git push` to a running container?
```bash
1. developer pushes code to github
2. The workflow runs if the push was to the main branch
3. the latest image is build
4. latest image is pushed to dockerhub
5. a user pulls the latest image to their local 
6. run a container for the pulled image
7. attach a port
8. Open the port and the website is live
```

---

## Hints
- Docker login: `uses: docker/login-action@v3`
- Build and push: `uses: docker/build-push-action@v5`
- Short SHA: `${{ github.sha }}` (use `cut` or `slice` to get first 7 chars)
- Badge URL format: `https://github.com/<user>/<repo>/actions/workflows/<file>.yml/badge.svg`

---

## Documentation
Create `day-45-docker-cicd.md` with:
- Your complete workflow YAML
- Docker Hub link to your image
- Screenshot of the pipeline run
- The full journey described in Task 6


