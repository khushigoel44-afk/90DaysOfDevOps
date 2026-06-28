## Self-Assessment Checklist
Mark yourself honestly — **can do**, **shaky**, or **haven't done**:

- [✓] Run a container from Docker Hub (interactive + detached)
- [✓] List, stop, remove containers and images
- [✓] Explain image layers and how caching works
- [✓] Write a Dockerfile from scratch with FROM, RUN, COPY, WORKDIR, CMD
- [✓] Explain CMD vs ENTRYPOINT
- [✓] Build and tag a custom image
- [✓] Create and use named volumes
- [✓] Use bind mounts
- [✓] Create custom networks and connect containers
- [✓] Write a docker-compose.yml for a multi-container app
- [✓] Use environment variables and .env files in Compose
- [✓] Write a multi-stage Dockerfile
- [✓] Push an image to Docker Hub
- [✓] Use healthchecks and depends_on

---

## Quick-Fire Questions
Answer from memory, then verify:
1. What is the difference between an image and a container?
```bash
Image: It is like a Blueprint that is used to create multiple containers.
A Dockerfile is needed to create an image. 
An image can be pulled from or pushed to DockerHub whenever needed.

Container: It is a running instance of an image. 
It is the place where all the appliactions actaully run.
It has got all the code, dependencies and source code needed to run an application.
```
2. What happens to data inside a container when you remove it?
```bash
When the container is removed/deleted, then the data stored within it also lost, if it is not attached to the databse of the local machine. 
if the database of the conatainer is connected to the persisting data of the local machine's filesystem than even if the container is deleted, it's data can still be retrieved through docker volumes.
This can all be achieved through docker volume or bind mount.
```
3. How do two containers on the same custom network communicate?
```bash
They can comunicate with the help of docker networks. 
if no network is provided, than by default the network used is of Driver: bridge.
There is a catch:
  - On the driver: bridge, the containers cannot communicate with each other with their container names as by deafult as there is no build-in DNS system available for the bridge drivers.
  - The containers can only communicate through their IP Address here
  - On the Customised Network: The containers can communicate with each other through the IP Addresses as well as their container names. There is a build-in DNS system available for the customised networks.
```
4. What does `docker compose down -v` do differently from `docker compose down`?
```bash
docker compose down:
  - This will remove all the images and the containers created 
  - This will not touch the docker volume as in the data is actually safe. 
  - This is done with the help of docker volumes and bind mount.

docker compose down -v:
  - this will also remove all the images and the containers created 
  - This will also remove the data associated with the containers. 
  - All the data associated with the container will be lost.
```
5. Why are multi-stage builds useful?
```bash
  - The multi-stage builds are useful bcz it is ensured that the size of the base image used is considerably small as compared to full sized Dockerfiles.
  - It also makes sure that the extra files are not added to the container thus keeping the container clean.
  - It ensures *security* by enabling only the necessary files into the container.
  - Since some of the tech stacks like Node js can have images that can easlity exceed 800MB mark, therefore, multi-stage Dockerfile is much needed in these cases.
```
6. What is the difference between `COPY` and `ADD`?
```bash
COPY: It is mainly used to copy the content from one source location to another destination (docker images). 

ADD: It is mainly used to add some content which is not preexisting by providing the URL. Docker will automatically get the files from the URL and will transfer the files to the destination (docker images). 
Also if a local compressed archieve is provided (like a .tar or a .zip file) than it will automatically fetch the data from the compressed file and transfer the data to the destination (docker images)
```
7. What does `-p 8080:80` mean?
```bash
This specifies that the application inside the container is available on the port 80. As for the local machine, the port 8080 is used to communicate with the contaoner's application
The website will be live on localhost:8080
```
8. How do you check how much disk space Docker is using?
```bash
docker system df
```

---

