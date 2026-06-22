### Task 1: Your First Dockerfile
1. Create a folder called `my-first-image`
```bash
mkdir my-first-image
```
2. Inside it, create a `Dockerfile` that: 
   - Uses `ubuntu` as the base image
   - Installs `curl`
   - Sets a default command to print `"Hello from my custom image!"`
3. Build the image and tag it `my-ubuntu:v1`
```bash
docker build -t my-ubuntu:v1 .
```
4. Run a container from your image
```bash
docker run -it my-ubuntu:v1 
docker run -it my-ubuntu:v1 bash  # open the bash terminal 
curl --version # installed version of curl is displayed here 
```

**Verify:** The message prints on `docker run` (YES)

---

### Task 2: Dockerfile Instructions (DONE)

---

### Task 3: CMD vs ENTRYPOINT
1. Create an image with `CMD ["echo", "hello"]` — run it, then run it with a custom command. What happens?
```bash
The CMD is default commands that gets overriden by the run command. Whatever is written in run command will run and will override that of CMD.
This happens during the runtime, as is given below:
```
```bash
docker run -it myapp # this will run what is present in the CMD
docker run -it myapp run "My docker app" # this will display what is given in the "run" - My docker app

```
```
2. Create an image with `ENTRYPOINT ["echo"]` — run it, then run it with additional arguments. What happens?
```bash
The ENTRYPOINT is not a default command and doesn't get overridden by the run command. The run Command is actaully appended after the ENTRYPOINT.
```
3. Write in your notes: When would you use CMD vs ENTRYPOINT?
```bash
CMD:
  - When i want to provide the default argumnets, such that the content is overridden by the RUN commands.

ENTRYPOINT:
  - When i want the container to behave like a CLI and to do the task that has been assigned.
```

---

### Task 4: Build a Simple Web App Image (DONE)

---

### Task 5: .dockerignore
(DONE)

---

### Task 6: Build Optimization
1. Build an image, then change one line and rebuild — notice how Docker uses **cache**
2. Reorder your Dockerfile so that frequently changing lines come **last**
3. Write in your notes: Why does layer order matter for build speed?
```bash
- Layering is important bcz whenever any change is made than the layers below it are broken and cannot be taken from cached data. Therefore, in order to save time, the layering of docker is of significance. 
- If proper layering is not maintained than whenever any change is made to any layer, all the layers below it (even though they could have been placed above to avoid rebuilding thus saving time and can be taken from cached data) needs to be rebuild. 
```

---

