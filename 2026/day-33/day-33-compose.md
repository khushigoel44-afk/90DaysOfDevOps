## Challenge Tasks

### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
```bash
docker-compose --version
# This will display the version of docker-compose if it is installed else it will generate an error!
```
2. Verify the version
```bash
docker-compose --version
```

---

### Task 2: Your First Compose File
1. Create a folder `compose-basics`
```bash
mkdir compose-basics
```
2. Write a `docker-compose.yml` that runs a single **Nginx** container with port mapping
```bash
# docker-compose.yml file
services:
    application:
        image: nginx:latest
        ports:
            - "8080:80" 
```
3. Start it with `docker compose up`
```bash
On running this command, live logs are displayed
```
4. Access it in your browser
```bash
localhost:8080
```
5. Stop it with `docker compose down`
```bash
docker compose down 
```

---

### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs:
- A **WordPress** container
- A **MySQL** container

They should:
- Be on the same network (Compose does this automatically)
- MySQL should have a named volume for data persistence
- WordPress should connect to MySQL using the service name

Start it, access WordPress in your browser, and set it up.

**Verify:** Stop and restart with `docker compose down` and `docker compose up` — is your WordPress data still there?

```bash
# docker-compose.yml file

services:
    wordpress:
        image: wordpress:latest
        depends_on: db 
        ports:
            - "8080:80"
        environment:
            WORDPRESS_DB_HOST: db:3306
            WORDPRESS_DB_USER: wordpress_user
            WORDPRESS_DB_PASSWORD: ${WORDPRESS_PASSWORD}
            WORDPRESS_DB_NAME: wordpress
        volumes:
            - myvol:/var/www/html
    db:
        images: mysql:latest
        environment:
            MYSQL_ROOT_PASSWORD: ${MYSQL_PASSWORD}
            MYSQL_DATABASE: wordpress
            MYSQL_USER: wordpress_user
            MYSQL_PASSWORD: test123@
        volumes:
            - mydb:/var/lib/mysql
volumes:
    mydb:
    myvol:

# .env file
MYSQL_PASSWORD=test123@
WORDPRESS_PASSWORD=test123@
```

---

### Task 4: Compose Commands
Practice and document these:
1. Start services in **detached mode**
```bash
docker compose up --d
```
2. View running services
```bash
docker compose ps
```
3. View **logs** of all services
```bash
docker compose logs
```
4. View logs of a **specific** service
```bash
docker compose logs <service_name>
# docker compose logs db 
```
5. **Stop** services without removing
```bash
docker compose stop
```
6. **Remove** everything (containers, networks)
```bash
docker compose down 
```
7. **Rebuild** images if you make a change
```bash
docker compose up -d --build
```

---

### Task 5: Environment Variables
1. Add environment variables directly in your `docker-compose.yml`
```bash
services:
    db:
        environment:
            MYSQL_ROOT_PASSWORD: ${mysql_pass}
```
2. Create a `.env` file and reference variables from it in your compose file
```bash
# .env file
mysql_pass=test123@

```
3. Verify the variables are being picked up
```bash
docker compose config 
# Safely validates how .env is parsing the passwords!
# the environment variable will be picked up from the .env file automatically!
```

---

## Hints
- Start: `docker compose up -d`
- Stop: `docker compose down`
- Logs: `docker compose logs -f`
- Compose creates a default network for all services automatically
- Service names in compose are the DNS names containers use to talk to each other

