**Environment basics**
```bash
uname -a
```
```bash
cat /etc/os-release
```

**Filesystem sanity**
```bash
mkdir /tmp/runbook-demo
```
```bash
cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
```

**CPU / Memory**
```bash
free -h 
# Checks for the RAM
```
```bash
ps -o pid,pcpu,pmem,comm -C dockerd
# dockerd is consuming minimum CPU 
```

**Disk / IO**
```bash
df -h /var/lib/docker
# Verify the docker partition
```
```bash
du -sh /var/log/docker 2>/dev/null || echo "No specific docker log dir"
# Checks for log accumulation
```

**Network**
```bash
sudo ss -tulpn | grep dockerd
# Checks for port conflicts
```
```bash
ping -c 3 google.com
# Services can pull the images if needed
```

**Logs**
```bash
sudo journalctl -u docker -n 50
# Scanning for "ERROR" keywords
```
```bash
tail -n 20 /var/log/syslog | grep -i docker
# No Hardware level regarding Docker Daemon
```

If This Worsens:--
- If this worsens (next steps)
  - Restart: If this worsens than perform the Restart.
  ```bash
  sudo systemctl restart docker
  ```