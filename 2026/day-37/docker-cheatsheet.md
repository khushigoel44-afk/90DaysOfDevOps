## Build Your Docker Cheat Sheet
- **Container commands** — run, ps, stop, rm, exec, logs
```bash
  1. docker run -itd -p <container_port: Host_port> <image_name>
      - used to create a container from the image
  2. docker ps
      -  Lists all the running container
  3. docker stop <container_id>
      - Used to stop some container using the container ID
  4. docker rm <container_id>
      - Remove the container using the container ID
  5. docker exec -it <Container_id> bash
      - Used to enter the container using the container ID
  6. docker logs
      -  Used to view the logs of the container
```
- **Image commands** — build, pull, push, tag, ls, rm
```bash
  1. docker build -t <image_name> .
      -  Used to build an image from Dockerfile (present within the same working directory)
  2. docker pull <dockerhub_username/dockerhub_username>:<tag
      -  Used to pull some pre-existing image from DockerHub
  3. docker push <dockerhub_username/dockerhub_username>:<tag
      -  Used to push the Image to DockerHub so that others can also access it.
  4. docker tag <Local_image_name><dockerhub_username/dockerhub_username>:<tag>
      - Used to push the image to DockerHub
  5. ls
      - It is mainly used to verify if the files are actually copied in the destination folder or not. 
  6. docker rm <Image_ID>
      - Used to remove some image using the image ID
```
- **Volume commands** — create, ls, inspect, rm
```bash
  1. docker volume create <volume_name>
      - Used to create a new docker volume
  2. docker volume ls
      - will list all the docker volumes present irrespective of the driver
  3. docker inspect
      - docker inspect <volume_name>
  4. docker rm
      - docker volume rm <volume_name>
```
- **Network commands** — create, ls, inspect, connect
```bash
  1. docker network create <network_name>
      - Used to create a new docker network to establish connection among containers.
  2. docker network ls
      - Used to list all the networks available
  3. docker network inspect <network_name>
      - Used to inspect the network by their name
  4. docker network connect <network_name> <container_ID>
      - Used to connect the network to some container
```
- **Compose commands** — up, down, ps, logs, build
```bash
  1. docker compose up
      - Used to start the container with just a single command
  2. docker compose down:
      - Used to Remove all the containers, secrets and the configurations created during docker compose up from the docker compose file
      - The data (docker volumes) and the images are safe and are not removed
  3. docker compose ps:
      - Used to list all the running containers associated with the current docker compose file 
  4. docker compose logs:
      - displays the output from all the containers in the single terminal
  5. docker compose build:
      - Useds to signal docker to rebuild the image to get the latest changes added
```
- **Cleanup commands** — prune, system df
```bash
  1. docker image prune
      - Used to remove all the images at once
  2. docker container prune
      - Used to remove all the containers at once
  3. docker stop $(docker ps -q)
      - Used to stop all the working containers at once
  2. docker system df
      - Used to identify how much space is taken by docker from the hard disk
```
- **Dockerfile instructions** — FROM, RUN, COPY, WORKDIR, EXPOSE, CMD, ENTRYPOINT
```bash
  1. FROM
      - Used to specify the base image into the Dockerfile
```
```bash
  2. RUN
      - Used mainly during the image building stage.
      - Used to install dependencies, libraries and the source code.
      - The changes made here i permenantly baked into the docker image layer.
```
```bash
  3. COPY
      - Used to copy the code, dependencies and source code into the working directory of the container
```
```bash
  4. WORKDIR
      - This is the working directory of the container
```
```bash
  5. EXPOSE
      - This does not change the file system. Used only to specify what port to expose for the application to run
```
```bash
  6. CMD
      - This is the default command that will run when the container starts up during runtime.
      - This is easily overwritten by any command given by the user.
      - For instnce, if CMD ["echo","hello"] runs than it will print "hello" but if the user writes docker run -it my_image echo "Bye" than docker will print "Bye" instead of that of CMD!
```
```bash
  7. ENTRYPOINT
      - This is the command that will run when the container starts up.
      - This will not be overwritten by whatever is written in the RUN Command, rather The content of ENTRYPOINT will have the RUN commands appended into it. 
      - For instance, If CMD has ["echo","Hello"] and ENTRYPOINT ["There"], this will return "There Hello" as the output!
```

