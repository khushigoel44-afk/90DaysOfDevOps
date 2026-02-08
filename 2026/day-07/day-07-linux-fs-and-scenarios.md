### Part 1: Linux File System Hierarchy
**Core Directories (Must Know):**
- *`/` (root)* - The starting point of everything
   - Top level of the File System.
   - Every File or Folder branches out of this.
   - If you are at '/', you are at the base of the tree.
   - *File/Folder*: docker, etc, home and many more.
   - I would use it to determine which file/folder is stored where.
- *`/home`* - User home directories
   - It is the personal space for the users.
   - Every personal project or file should be kept here.
   - It's always /home/ubuntu for the hands-on purpose.
   - *File/Folder*: lyubov only.
   - I would use it to store all my personal files/folders.
- *`/root`* - Root user's home directory
   - It is the Home for "Administrator (Superuser)".
   - Kept away from the users bcz of the security purpose.
   - "Sudo" commands are needed just to read these files.
   - *File/Folder*:.bashrc, .ssh/ and many more.
   - I would use it to store any sensitive data which should be unaccessible to the regular user.
- *`/etc`* - Configuration files
   - The "Brain" of the server.
   - It has the *configuration Files*.
   - It has files needed to bring out some change in the nginx settings or manage user passwords.
   - *File/Folder*:PackageKit, NetworkManager etc.
   - I would use it to edit nginx settings and to keep track of the user passwords.
- *`/var/log`* - Log files (very important for DevOps!)
   - It's like the "History Book".
   - It has log files of the operating system.
   - It is needed to determine as to why a service crashed.
   - *File/Folder*:alternative.log, syslog and many more.
   - I would use it to determine the reason as to why a certain service crashed as well as the reason behind it.
- *`/tmp`* - Temporary files
   - It stores temporary data within it.
   - On reboot, these files get deleted.
   - *File/Folder*:snap-private-tmp etc.
   - I would use it to store some data temporarily such that it wouln't matter even if the data gets deleted once the system undergoes reboot.

**Additional Directories (Good to Know):**
- *`/bin`* - Essential command binaries
   - It has all the standard executable commands needed to run the syatem.
   - *File/Folder*:cp, mkdir, ls etc..
   - I would use it to run the everyday commands like cp, mkdir, ls etc..
- *`/usr/bin`* - User command binaries
   - It has all the user-installed commands.
   - /bin has all the essential tools.
   - /usr/bin has all the user applications like python3, git etc..
   - *File/Folder*:touch, ip etc..
   - I would use it to run the self-installed applications like python, git etc..
- *`/opt`* - Optional/third-party applications
   - It stores all the Third-party applications which do not follow the linux file system.
   - For instance, Google Cloud SDK stores all it's files in one place here.
   - *File/Folder*:containered/ 
   - I would use it to access and store the third party applications like the google cloud SDK.


### Part 2: Scenario-Based Practice (40 minutes)

**Scenario 1: Service Not Starting** 
```
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.
```

**My Solution**
**Step 1:** Check service status
```bash
sudo systemctl status myapp
```
**Why this command?** It shows if the service is active, failed, or stopped

**Step 2:** View detailed service logs
```bash
sudo journalctl -u myapp -e
```
**Why this command?** To look for the last log and what went wrong in it.

**Step 3:** Check if there is a typo error
```bash
sudo nginx -t
```
**Why this command?** To know if there is a typo error in the file bcz of which the service is not running.

**Step 4:** To Check if the port is stolen or not.
```bash
sudo ss -tunlp | grep:80
```
**Why this command?** To check if the port 80 for nginx is stolen or not.

**What I learned:** Always check status first, then investigate based on what you see.

```
```

**Scenario 2: High CPU Usage** 
```
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?
```

**My Solution**

**Step 1:** Check service status (using top)
```bash
top
```
**Why this command?** It shows the top working programs/applications.

**Step 2:** Check service status (using htop)
```bash
htop
```
**Why this command?** It shows the top working programs/applications more easily as compared to top.

**Step 3:** Check the top processes that are taking up the memory
```bash
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 5
```
**Why this command?** It shows the top 5 applications that are taking up maximum attention of the CPU.

**What I learned?** Look for the applications that are taking up most of the CPU's attention to resolve the issue.

```
```

**Scenario 3: Finding Service Logs** 
```
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?
```

**Step 1:** Check the status
```bash
sudo systemctl status docker
```
**Why this command?** It shows whether the docker is/was working or not.

**Step 2:** Check the records
```bash
sudo journalctl -n docker
```
**Why this command?** It shows all the recorded logs.

**Step 3:** Check the records in real-time.
```bash
journalctl docker -t
```
**Why this command?** It keeps track of the latest logs and displays them as well without the need of any external commands.

**Step 4:** Limit the records
```bash
journalctl -u docker -n 50
```
**Why this command?** It will print only the top 50 logs.

**What I learned?** How to extract file logs from the syatem in multiple ways.

```
```

**Scenario 4: File Permissions Issue** 
```
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"

What commands would you use to fix this?
```

**Step 1:** Check the current permissions
```bash
ls -l /home/user/backup.sh 
```
**Why this command?** Displays the file that is not getting executed. Look for (x) permission.

**Step 2:** Add execute Permission
```bash
chmod +x /home/user/backup.sh 
```
**Why this command?** On adding the execute permission, the file will not throw an error on execution.

**Step 3:** Run the file again to cross-verify
```bash
./backup.sh
```
**Why this command?** Checks whether the chnages made were worth-it or not.

**What I learned?** Execute Permisson is important in order to execute a file, even if it is present in the home directory.
