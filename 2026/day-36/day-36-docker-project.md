## Challenge Tasks

### Task 1: Pick Your App
```bash
Cloned a simple Open-source application from Github which is also a part of GSSoC 2026 - TourEase.
```


---

### Task 2: Write the Dockerfile
```bash
Tested the application locally, the application works well. 
Included all the dependencies as well.
```

---

### Task 3: Add Docker Compose
```bash
On running,

docker compose up

Everything works well. 
All the features have been included as well.
```

---

### Task 4: Ship It
1. Tag your app image
```bash
docker tag <local_image_name><dockerhub_username/dockerhub_repo_name>:<tag>
```
2. Push it to Docker Hub
```bash
docker push <dockerhub_username/dockerhub_repo_name>:<tag>
```
3. Share the Docker Hub link
```bash
FRONTEND: https://hub.docker.com/repository/docker/khushigoel/tourease_frontend/general
BACKEND: https://hub.docker.com/repository/docker/khushigoel/tourease_backend/general
```
4. Write a `README.md` in your project with:
```bash
Since the project was an open source project, the README.md file was already present. 
I just updated the Docker Setup and all the prerequisits needed for the setup.
```

---

### Task 5: Test the Whole Flow
1. Remove all local images and containers
```bash
docker container prune
docker image prune
```
2. Pull from Docker Hub and run using only your compose file
```bash
docker run -itd -p 7000:80 <dockerhub_username/dockerhub_repo_name>
```
3. Does it work fresh? If not — fix it until it does
```bash
Works well!
```

---

## Documentation
Create `day-36-docker-project.md` with:
- What app you chose and why
```bash
It was an Open source project that was assigned to me under GSSoC 2026 and therefore i choose this. 
```
- Your Dockerfile (with comments explaining each line)
```bash
**./backend/Dockerfile**

FROM node:24-bookworm AS builder
WORKDIR /app
COPY package*.json .
RUN npm install

FROM node:24-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
USER node
EXPOSE 3000
CMD ["npm","start"]

**./frontend/Dockerfile**

FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder ./app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

```
- Challenges you faced and how you solved them
```bash
Some of the Challenges i faced were:
1. Getting all the API Keys as mentioned in the ./backend/env.example. There were so many API Keys which i needed to fetch that it took significant amount of my time.
2. In the ./backend/Dockerfile, while copying all the node_modules from the /app/node_modules to ./node_modules, i made a minor mistake of using node_module without the 's' at the end bcz of which the production was failing repetedly. I realised the problem quite late but the issue was resolved at the end.
```
- Final image size
```bash
tourease_backend:
DISK USAGE: 416MB | CONTENT SIZE: 83.5MB        
tourease_frontend:
DISK USAGE: 116MB | CONTENT SIZE: 37.4MB  
``` 
- Docker Hub link
```bash
FRONTEND: https://hub.docker.com/repository/docker/khushigoel/tourease_frontend/general
BACKEND: https://hub.docker.com/repository/docker/khushigoel/tourease_backend/general
```

---

