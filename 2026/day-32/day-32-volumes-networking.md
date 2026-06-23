## Challenge Tasks

### Task 1: The Problem
1. Run a Postgres or MySQL container
```bash
docker run -itd mysql
```
2. Create some data inside it (a table, a few rows — anything)
```bash
CREATE TABLE users (name VARCHAR(50), email VARCHAR(50));
SELECT * FROM users
# New data has been created. 
```
3. Stop and remove the container
```bash
docker stop <container_id> && docker rm <container_id>
```
4. Run a new one — is your data still there?
```bash
No, the data is completely lost now!
```

Write what happened and why.
```bash
The container is *Ephemeral* by nature. One the container was deleted, all the data within it also got lost and now there is no way to retrieve it back without using docker volumes. 
We just have to attach the database of the container to the database of my local machine such that even if the container is deleted, the data will still be present on my system for future reference.
```

---

### Task 2: Named Volumes
1. Create a named volume
```bash
docker volume create myvol 
```
2. Run the same database container, but this time **attach the volume** to it
```bash
docker run -d -v myvol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test123@ mysql
```
3. Add some data, stop and remove the container
```bash
# Added a table through exec 
docker stop <container_id> && docker rm <container_id>
```
4. Run a brand new container with the **same volume**
```bash
docker run -d -v myvol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test123@ mysql
```
5. Is the data still there?
```bash
Yes, the data is perceived now as we have attached the same volume from the same previous container.
```

**Verify:** `docker volume ls`, `docker volume inspect`

---

### Task 3: Bind Mounts
1. Create a folder on your host machine with an `index.html` file
```bash
touch index.html
```
2. Run an Nginx container and **bind mount** your folder to the Nginx web directory
```bash
docker run -d -v "$(pwd)":/usr/share/nginx/html -p 8080:80 nginx:alpine
```
3. Access the page in your browser
```bash
localhost:8080
```
4. Edit the `index.html` on your host — refresh the browser
```bash
The changes made to the index.html file were disaplyed!
```

Write in your notes: What is the difference between a named volume and a bind mount?
```bash
- docker volume indiates that a new volume needs to be created explicitely, such that the volume can be bound to any container and the data will persist even after the container is deleted.
- This is used with the tools like MySQL and Postgres where we want the data to remain even after the container is dead.
- on the other hand, bind mount is like providing the pwd to the inner folder of nginx server, such that the content of index.html will be live on the proposed port. 
- Mainly used when we want the live changes from our code to be displayed on the port without having to explicitely rebuild the image.
```

---

### Task 4: Docker Networking Basics
1. List all Docker networks on your machine
```bash
docker networks ls
```
2. Inspect the default `bridge` network
```bash
docker inspect bridge
```
3. Run two containers on the default bridge — can they ping each other by **name**?
```bash
No, two containers running side by side conected on the same network - bridge, cannot ping each other through their names. 
This is so bcz the default bridge network does not have a build-in DNS server. 

docker run -it container_a
docker run -it container_b

# On trying to ping container_b thriugh container_a
docker exec -it container_a ping container_b

# This will return an error!
```
4. Run two containers on the default bridge — can they ping each other by **IP**?
```bash
Yes, the 2 containers running side by side connected on the same network - bridge, can ping each other through their IP Addresses. 
This is so bcz the containers connected through default bridge network are provided an internal IP Address with which they can ping each other. 

# Find the IPAddress of Container_b
docker inspect -f {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} <container_id>

# Ping container_b through container_a
docker exec -it <container_a_name> ping <IP_Container_b>

# This will work fine!
```

---

### Task 5: Custom Networks
1. Create a custom bridge network called `my-app-net`
```bash
docker network create my-app-net
```
2. Run two containers on `my-app-net`
```bash
docker run -it --name container_1 --network my-app-net nginx 
```
3. Can they ping each other by **name** now?
```bash
docker run -it --network my-app-net container_a 
docker run -it --network my-app-net container_b

# Try to ping container_b from container_a
docker exec -it container_a ping container_b

# This will work fine!
```
4. Write in your notes: Why does custom networking allow name-based communication but the default bridge doesn't?
```bash
- Default-bridge: In this case, there is no build-in DNS server bcz of which the containers are not able to communicate with each other through the names.
- custom-named bridge: In this case, an internal DNS server is established which allows the containers to communicate with each other.
```

---

### Task 6: Put It Together
1. Create a custom network
```bash
docker network create my-app-net
```
2. Run a **database container** (MySQL/Postgres) on that network with a volume for data
```bash
docker run -itd --network my-app-net -v myvol:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=test123@ mysql
```
3. Run an **app container** (use any image) on the same network
```bash
docker run -itd --network my-app-net ubuntu
```
4. Verify the app container can reach the database by container name
```bash
docker exec -it <app_container_name> ping <database_name>

# This works fine!
```

---