## Challenge Tasks

### Task 1: What is Docker?
Research and write short notes on:
- What is a container and why do we need them?
  - "Container"
    - It is a lightweight package that contains everything including -
      - The Code
      - The runtime (Python, Node js)
      - The libraries
      - All the Needed Tools etc..
  - It looks the same from outside irrespective of the data within it.
  - "Why Container is Needed?"
    - The problem of "This works on my machine but not on your machine" type of the problem through Containerization.
    - It solves the problems like - 
      - Environmental Consistency: If in a Team, Person A works on Windows, Person B on Mac than about 40% of the time will get wasted in trying to figure out the problem of Mismatch, Which can otherwise be solved by Containers.
      - Security: If a Hacker breaks into the Container, than he will not have the access to your full server rather he will be trapped in a "SandBox" like Container. 
      - Isolation: If App A requires Python and App B requires Java than it will be a nightmare to install both the applications. Therefore, Containers are used which ensures that everything is done in an isolated manner and each application doesn't know about the other one.
- Containers vs Virtual Machines — what's the real difference?
  - "Container" : 
      - Shares the Host's Operating System.
      - No Extra RAM is Needed.
  - "Virtual Machine(VM)" : 
      - Takes requires a Guest Operating System.
      - Extra RAM is used as a Part of Host's OS is used. 
- What is the Docker architecture? (daemon, client, images, containers, registry)
  The Docker Architecture is mainly composed of 3 Parts:--
  - Docker Client: 
    - It is that part with which the user interacts.
    - It itself doesn't do any Heavy Lifting.
    - It simply passes the commands to the Host/ Docker Engine.
  - Docker Engine:
    - It is where the main Action takes place. It is composed of - 
      - Docker Daemon: 
        - It is responsible for all the Background processing.
        - It waits for the API Requests.
        - Manages the images, containers etc.
      - Images:
        - They are the Blueprint that are used to create Containers.
      - Containers:
        - They are the live, running instances of Images.
  - Docker Registry:
    - It is like a place allocated to store all the images.
    - Images can be "pulled" from the Registry by the Host.
    - Images can be "Pushed" to the registry so that other people can also use them.
    - Most common registry is "Docker Hub".


---

### Task 2: Install Docker (DONE)

---

### Task 3: Run Real Containers 
1. Run an **Nginx** container and access it in your browser
```bash
docker run -d -p 80:80 nginx
// Access in the Browser (DONE)
// <host's port(used with localhost)>:<container's port>
```
2. Run an **Ubuntu** container in interactive mode — explore it like a mini Linux machine
```bash
docker run -itd ubuntu
docker exec -it <Container_id> bash
# with -t: only the terminal will be attached and no commands will run then 
# with -it: the terminal will be attached and the commands will also run
```
3. List all running containers
```bash
docker ps
```
4. List all containers (including stopped ones)
```bash
docker ps -a
```
5. Stop and remove a container
```bash
docker stop <Container_id> && docker rm <Container_id>
```

---

### Task 4: Explore
1. Run a container in **detached mode** — what's different?
```bash
docker run -d nginx
# -d (Detached Mode)
# with: The active/ working process will be pushed to the background such that the terminal is not displayed. 
# Without: All the background processing is also displayed. The terminal is displayed. Ctrl+C is needed very often.
```
2. Give a container a custom **name**
```bash
docker run -itd --name MyUbuntu ubuntu
```
3. Map a **port** from the container to your host
```bash
docker run -d -p 80:80 nginx
```
4. Check **logs** of a running container
```bash
docker logs <Container_Id> // To view what is happening in the Background of the <Container_Id>
```
5. Run a command **inside** a running container
```bash
ls // will list all the files/folders within the ubuntu Container.
```

---



