### Part 1: Launch Cloud Instance & SSH Access
- *Created a launch instance on AWS - New-instance-server*
- *Connected via SSH*

### Part 2: Install Docker & Nginx
- **Install Nginx** - sudo apt install nginx
- **Install Docker** - sudo apt install docker.io
- **Verify if it's working** - sudo systemctl status nginx //Error if not working!

### Part 3: Security Group Configuration
- Using the http:// "private-key-ip" at port 80.
- *The welcome page of nginx* was displayed (Screenshot attached!).

### Part 4: Extract Nginx Logs
- *View the logs*: journalctl -u nginx
- *Save the logs to a file*: systemctl status nginx > report.txt
- *Download to my local*: scp -i "private-key-name" ubuntu@<54.284.19.86>:~/report.txt ./


## Commands Used
- *sudo apt install nginx*: To install nginx
- *sudo apt install docker.io*: To install docker
- *sudo systemctl status nginx*: To verify whether nginx is working or not.
- *systemctl start nginx*: To start nginx
- *systemctl stop nginx*: To stop nginx
- *journalctl -u nginx*: To view the logs
- *systemctl status nginx > report.txt*: To save the logs to the file report.txt
- *scp -i "private-key-name" ubuntu@<54.284.19.86>:/report.txt ./*: To copy the file "report.txt" to local.
- *cat report.txt*: To read the content of the file without opening it in the editor mode.


## Challenges Faced
- **Challenge-1** - *Forgot how to land on nginx welcome page*: Had seen in the live class how Shubham Bhaiya did it but when started doing myself, i couldn't recall. 
- **Solution** - *Tried exploring the Security section of the instance*: Instead of directly using gemini, I tried a few commands and explored the security section a bit. After some time i was able to recall the things of the live class and was eventually able to overcome my problem.

- **Challenge-2** - *Didn't know how to transfer the report file to my local*: I briefly read the readme.md file bcz of which i missed the part where the command to do the same was mentioned.
- **Solution** - *Realised quite late that the command was already mentioned in the readme.md file*: Took help from gemini to determine which command would work. After some 10-20 min struggle, was able to resolve it on my own. Although I took help from gemini but ultimately resolved the issue myself. 


## What I Learned
- *How to connect SSH to my server*
- *How to read logs and append them in the .txt file*
- *How to get the logs .txt file to the local*
- *How to resolve issues without totally rellying upon gemini/chatgpt*
- *Resolving issues/errors is not that bad and it can be fun as well*.