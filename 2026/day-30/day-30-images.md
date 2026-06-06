# Day 30 – Docker Images & Container Lifecycle

## Task
Today's goal is to **understand how images and containers actually work**.

You will:
- Learn the relationship between images and containers
- Understand image layers and caching
- Master the full container lifecycle

---

## Expected Output
- A markdown file: `day-30-images.md`
- Screenshots of key commands

---

## Challenge Tasks

### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub
```bash
docker run -d nginx # Pull nginx image from DockerHub
docker run -itd ubuntu
dokcer run -itd alpine

```
2. List all images on your machine — note the sizes
```bash
docker ps # will list all the processes in running state
docker images ls # will list all the images available on the system 
# alpine: 13.1MB 
# ubuntu: 160MB
# nginx: 241MB 
```
3. Compare `ubuntu` vs `alpine` — why is one much smaller?
```bash
Out of the two - "alpine" is much smaller occupying only 13.1MB in contrast to ubuntu occupying 160MB space
```
4. Inspect an image — what information can you see?
```bash
It provides the following info:--
 - image id
 - disk usage (compressed size when pulled from dockerhub)
 - content size (size when the image is unpacked and is in use)
 - time of creation
 - status - running or not
 - ports - port on which it is running
 - container id (if created using the specific image)
```
5. Remove an image you no longer need
```bash
docker rmi <image_id> # No container attached 
docker rm <container_id> # Container attached 
docker remi <image_id>

```

---

### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?
```bash
- images are built using the layer by layer approach.
- the info here is in the form of bottom up approach where the entry at the bottom indicates the 1st layer and the top entry represents the final image created!
```
2. Each line is a **layer**. Note how some layers show sizes and some show 0B
```bash
Some commands like :--
  - ENV
  - EXPOSE
  - CMD/ENTRYPOINT
They add 0Bytes of data. They don not add files to the filesystem and are only responsibly for the image's runtime configuration file.
```
3. Write in your notes: What are layers and why does Docker use them?
```bash
What are Layers?
  - Read-only filesystem that represents the instructions in the dockerfile.
  - Rather than creating a giant solid block of data, docker splits the image into the independent slices referred to as layers.

Why Docker Uses the Layers?
  - Layer Sharing: If 10 images are build using the same base image than rather than storing the 10 copies of the base image, dokcer uses the same base iamge through layer sharing.
  - Lightening-fast cashe: Docker does not create the image everytime the command is run, rather it only modifies that portion which has been changed thus fastening the overall process.
  - Network Bandwidth: Whenever an updated images is pulled from dockerhub, only the new portion is updated that does not include modifying the entire image. ONly the pulled section is modified. 
```

---

### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **Create** a container (without starting it)
```bash
docker create nginx 
```
2. **Start** the container
```bash
docker start <container_id>
```
3. **Pause** it and check status
```bash
docker pause <container_id> 
# (Paused) is displayed under the Status section
```
4. **Unpause** it
```bash
docker unpause <container_id>
```
5. **Stop** it
```bash
docker stop <container_id>
```
6. **Restart** it
```bash
docker restart <container_id>
```
7. **Kill** it
```bash
docker kill <container_id>
```
8. **Remove** it
```bash
docker rm <container_id>
```

Check `docker ps -a` after each step — observe the state changes.

---

### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode
```bash
docker run -d nginx
```
2. View its **logs**
```bash
docker logs <container_id>
```
3. View **real-time logs** (follow mode)
```bash
docker logs -f <container_id> # opens in the follow mode - live mode 
```
4. **Exec** into the container and look around the filesystem
```bash
docker exec -it <container_id> bash
```
5. Run a single command inside the container without entering it
```bash
docker exec -t <container_id> date # without entering the container, the date inside the container will be dispalyed!
```
6. **Inspect** the container — find its IP address, port mappings, and mounts
```bash
docker inspect --format='{{json .NetworkSettings}} {{json .Mounts}}' <container_id>
```

---

### Task 5: Cleanup
1. Stop all running containers in one command
```bash
docker stop $(docker ps -q)
```
2. Remove all stopped containers in one command
```bash
docker container prune
```
3. Remove unused images
```bash
docker image prune # removes which are not attached to a container
docker image prune -a # remove all the containers
```
4. Check how much disk space Docker is using
```bash
docker system df #Will list all the images, conatiners, volumes and cache available inside docker.
```

---
