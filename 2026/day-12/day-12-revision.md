## Mini Self-Check 

- **1) Which 3 commands save you the most time right now, and why?**
```bash
ls -l 
```
Quickly checks file permissions and ownership
```bash
systemctl status <service>
```
 Instantly shows service health and recent logs
```bash
journalctl -u <service> -n 50 
```
Fast error inspection without opening log files
- **2) How do you check if a service is healthy? List the exact 2–3 commands you’d run first.** 
```bash
systemctl status <service>
```
```bash
ps aux | grep <service>
```
```bash
journalctl -u <service> -n 50
```
- **3) How do you safely change ownership and permissions without breaking access? Give one example command.**
```bash
sudo chown user:user file.txt && chmod 644 file.txt
```
- **4) What will you focus on improving in the next 3 days?**
   - Faster log reading and error identification

   - Better understanding of CPU and memory usage

   - Practicing troubleshooting with real services (cron, ssh, docker)