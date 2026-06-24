## Challenge Tasks

### Task 1: Build Your Own App Stack
Create a `docker-compose.yml` for a 3-service stack:
- A **web app** (use Python Flask, Node.js, or any language you know)
- A **database** (Postgres or MySQL)
- A **cache** (Redis)

Write a simple Dockerfile for the web app. The app doesn't need to be complex — even a "Hello World" that connects to the database is enough.


---

### Task 2: depends_on & Healthchecks
1. Add `depends_on` to your compose file so the app starts **after** the database
2. Add a **healthcheck** on the database service
3. Use `depends_on` with `condition: service_healthy` so the app waits for the database to be truly ready, not just started

**Test:** Bring everything down and up — does the app wait for the DB?

---

### Task 3: Restart Policies
1. Add `restart: always` to your database service
2. Manually kill the database container — does it come back?
```bash
This will bring back the container even after it has been killed!
```
3. Try `restart: on-failure` — how is it different?
```bash
This will continue restarting even after the container crashes (Code Not 0).
This will stop restarting if the job of the container is finished (Code 0)
```
4. Write in your notes: When would you use each restart policy?
```bash
There is majorly 4 Restart Policies:-
- restart: no
    - The container won't restart even if it crashes. 
    - This is mainly useful when the maintainer wants to check the logs as to why the container failed!
- restart: always
    - This will always restart the container even if it crashes. 
    - This will restart even if the job is done (Code 0)
- restart: on-failure
    - This will restart the container if it crashes and will continue to restart until it actually works.
    - Get triggered on Code Not 0.
- restart: unless-stopped
    - This will continue to restart the container until it is stopped explicitely by the maintainer using the stop command.
```

---

### Task 4: Custom Dockerfiles in Compose
1. Instead of using a pre-built image for your app, use `build:` in your compose file to build from a Dockerfile
```bash
# docker-compose.yml

services: 
    myapp:
        build: . # States that the Dockerfile is present within the same working directory!
```
2. Make a code change in your app
3. Rebuild and restart with one command
```bash
docker compose up -d --build # This will rebuidl the image with just a single command!
```

---

### Task 5: Named Networks & Volumes
1. Define **explicit networks** in your compose file instead of relying on the default
```bash
services:
    myapp:
        networks:
            - db_net
            - redis_net
    db:
        network:
            - db_net
    redis:
        network:
            - redis_net

networks:
    db_net:
    redis_net:
```
2. Define **named volumes** for database data
```bash
services:
    myapp:
        volumes:
            - myvol:/val/www/html

volumes:
    myvol:
```
3. Add **labels** to your services for better organization
```bash
labels:
    project.owner: "<some_value>"
```

---

### Task 6: Scaling (Bonus)
1. Try scaling your web app to 3 replicas using `docker compose up --scale`
```bash
docker compose up -d --scale web_app=3
```
2. What happens? What breaks?
```bash
Since 3 replicas are to be made, the 1st one successfully grabs the Port 7000 but the other 2 cannot share the same port 7000 with the 1st replica!
Therefore, the error msg like - "Port is already allocated" or "Port is already in Use" is displayed.
```
3. Write in your notes: Why doesn't simple scaling work with port mapping?
```bash
This is so bcz only one container can have access to a port. Port sharing is not possible!
```

---

## Hints
- Build from Dockerfile: `build: ./app`
- Healthcheck: `healthcheck:` with `test`, `interval`, `timeout`
- Rebuild: `docker compose up --build`
- Scale: `docker compose up --scale web=3`

---

