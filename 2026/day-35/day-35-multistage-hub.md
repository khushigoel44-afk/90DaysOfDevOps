## Challenge Tasks

### Task 1: The Problem with Large Images
1. Write a simple Go, Java, or Node.js app (even a "Hello World" is fine)
2. Create a Dockerfile that builds and runs it in a **single stage**
```bash
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY Hello.java .
RUN javac Hello.java
EXPOSE 8080
CMD ["java","Hello"]
```
3. Build the image and check its **size**
```bash
# Build the Docker image
docker build -it java_image .

# Run the Container from the images]
docker run -it -p 8080:8080 java_image
```

Note down the size — you'll compare it later.
```bash
 DISK-SIZE: 682MB          
 CONTENT-SIZE: 212MB
```

---

### Task 2: Multi-Stage Build
1. Rewrite the Dockerfile using **multi-stage build**:
   - Stage 1: Build the app (install dependencies, compile)
   - Stage 2: Copy only the built artifact into a minimal base image (`alpine`, `distroless`, or `scratch`)
```bash
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY Hello.java .
RUN javac Hello.java

FROM gcr.io/distroless/java21-debian13
WORKDIR /app
COPY --from=builder /app/Hello*.class ./
EXPOSE 8082
ENTRYPOINT ["java"]
CMD ["Hello"]
```
2. Build the image and check its size again
```bash
# Build the image
docker build -t multi_stage_image_java .

# Run the container
docker run -itd -p 8080:8082 multi_stage_image_java:latest
```
3. Compare the two sizes
```bash
Full size Base Image:
- DISK-SIZE: 682MB          
- CONTENT-SIZE: 212MB
Multi-Stage Base Image:
- DISK USAGE: 261MB         
- CONTENT SIZE: 63.5MB
```

Write in your notes: Why is the multi-stage image so much smaller?
```bash
Full Image: This includes the larger image consisting of the JDK (Java Development Kit) + the compilers and the documentation along with the source code
Multi-Stage-Image: This includes the smaller (Distroless Image) which doesn't have the heavy dependencies like the compiler and the JDK (Java Development Kit) making it much smaller than the Full image created!
```

---

### Task 3: Push to Docker Hub
1. Create a free account on [Docker Hub](https://hub.docker.com) (if you don't have one)
2. Log in from your terminal
```bash
docker login
```
3. Tag your image properly: `yourusername/image-name:tag`
```bash
docker tag <local_image><Dockerhub_username/repo_name>:<tag (eg-latest)>
```
4. Push it to Docker Hub
```bash
docker push <Dockerhub_username/repo_name>:<tag>
```
5. Pull it on a different machine (or after removing locally) to verify
```bash
docker run -it -p 8080:8080 <Dockerhub_username/repo_name>:<tag>

# Since the image wasn't present locally (I removed it from my local), the image was pulled from Dockerhub and was live on the port 8080!
```

---

### Task 4: Docker Hub Repository
1. Go to Docker Hub and check your pushed image
2. Add a **description** to the repository
3. Explore the **tags** tab — understand how versioning works
```bash
There are 3 types of tage available:--
1. latest tag: The Default tag in Docker which always points to the latest reference of the image that has been pushed.
2. immutable tag: This tag mainly uses the versions like 1.0.0, 1.0.0-alpine, or even the build date (27-01-26). The tag shouldn't change and should remain the same, such that the Deployments are always identical.
3. Image Digest (SHA256): Every single tag points to a specific cryptographic image that points to the ultimate digest. Even if the developer overwrites the code with the latest tag, the digest will remain distinct.
```
4. Pull a specific tag vs `latest` — what happens?
```bash
Latest tag: This tag looks for the latest reference of the image that is available on Dockerhub. Even if the reference is broken or incorrectly pushed by the developer, the image will be pulled. Thus, offering no stability and security.
Specific tag: This tag looks for the specific version of the image as specified in the commnad. even if the developer changes the code and pushed new references of the image, the image present in the local will not change whatsoever. 
```

---

### Task 5: Image Best Practices
Apply these to one of your images and rebuild:
1. Use a **minimal base image** (alpine vs ubuntu — compare sizes)
2. **Don't run as root** — add a non-root USER in your Dockerfile
```bash
USER: noroot
```
3. Combine `RUN` commands to **reduce layers**
```bash
Since i have used a Distroless image which lacks a shell by default, the direct RUN addgroup type commands will fail to run!
```
4. Use **specific tags** for base images (not `latest`)
```bash
docker build -t non-root-user-image-java:1.0.0 .
```

Check the size before and after.
```bash
BEFORE:
- DISK USAGE: 261MB   | CONTENT SIZE: 63.5MB
AFTER:
- DISK USAGE:  261MB  | CONTENT SIZE: 63.5MB

The size is exactly the same as we have used the exact same Distroless image in both the cases and by deafult, the distroless image works at noroot!
```

---

## Hints
- Multi-stage: use `FROM ... AS builder` then `COPY --from=builder`
- Login: `docker login`
- Tag: `docker tag local-image:tag username/repo:tag`
- Push: `docker push username/repo:tag`
- Non-root user: `RUN adduser` + `USER`

