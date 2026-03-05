## Quick Concepts (write 1–2 bullets each)
- **OSI layers (L1–L7) v/s TCP/IP stack (Link, Internet, Transport, Application)**

   - *OSI Layer(L1-L7):--*
       - A(Application): What app we are using
       - P(Presentation): What we see(Encryption)
       - S(Session): When >=2 people are available online to connect. 
       - T(Transport): Transmission of data from 1 person to another.       - 
       - N(Network): Data Transfer over the Internet.
       - D(Data Link): Data gets linked b/w 2 people.
       - P(Physical): Physical 

    - *TCP/IP Model:--*
       - It is the Practical implementation of the OSI Model.
       - A(Application Layer): (What we see and interact with(Encrypted) - https/http/DNS)
          - Application
          - Presentation
          - Session
       - T(Transport Layer): (Data Transfer - TCP/UDP)
          - Transport
       - N(Network Layer):(IP Address/Route)
          - Network
       - NA(Network Access Layer): 
          - D(Data Link)
          - P(Physical)

      ### OSI Model ---Practical Implementation---> TCP/IP Model




- **One real example: “`curl https://example.com` = App layer over TCP over IP”**
  - *Application Layer:* Curl uses https calls for the specific webpage of example.com from the server.
  - *Transport Layer:* The data is broken into segments. TCP allotes the `sequence number to each segment to ensure that the complete data is transfered and in the correct order.
  - *Network Layer:* The segment get wrapped in the IP Address having the Sources IP (me) and the destination IP Address as the label so that the route knows where to send it.
  - *Network Access Layer:* The data is then converted into Frames and then in the form of electrical signals, it is  transfered over the internet/wi-fi.

  ## Hands-on Checklist (run these; add 1–2 line observations)
- **Identity:** `hostname -I` (or `ip addr show`) — note your IP.
```bash
hostname -I 
# Gave the private IP Address in a single line.
```
```bash
ip addr show 
# It gives the IP Address along with some additional information.
```
```bash
curl ifconfig.me
# It gives the IP address given by the ISP to my device. If a request is made to a server than the IP address received by the server is displayed here.
```
- **Reachability:** `ping <target>` — mention latency and packet loss.
```bash
ping google.com
# 6 packets transmitted, 6 received, 0% packet loss, time 5348ms
# Which means that when ping cmd ran, it sent a simple "Are You There" msg to the google's server which in turn replied with 6 "I am here" msgs which were received. 
# 0% packet loss means that there was not even a single msg which was left unanswered by the google's server. 
# If packet loss is 10% than it means that some msgs were not answered by the server and the connection is "jittery".
```
- **Path:** `traceroute <target>` (or `tracepath`) — note any long hops/timeouts.
```bash
traceroute google.com
# It traces the path my data took to reach the google's Server. 
```
```bash
 1  Khushi.mshome.net (172.31.192.1)  1.294 ms  0.172 ms  0.124 ms
 2  192.168.1.1 (192.168.1.1)  1.676 ms  1.613 ms  1.773 ms
 3  * * *
 4  * * *
 5  * * *
 6  * * *
 7  * * *
 8  * * *
 9  bom07s28-in-f14.1e100.net (142.250.182.206)  3.948 ms  3.901 ms  3.730 ms
 # The stops in b/w the data paths is known as "HOP". 
 # Hop 1: It's my virtual host (WSL2)
 # Hop 2: It's My Wifi Router.
 # Hop 3: It's my ISP (usually displayed by ** to keep the hops under them in wraps for the security purpose.)
 # Hop 4: It's the google's Server. 
```
- **Ports:** `ss -tulpn` (or `netstat -tulpn`) — list one listening service and its port.
```bash
ss -tulpn 
# It 's listing all the active processes (either TCP or UDP) on the system. 
# LISTEN : TCP (Transmission Control Protocol)
# UNCONN : UDP (User Datagram Protocol)
```
```bash
# Active Listening Service and it's port:--
tcp LISTEN [::]:80 - nginx
```
- **Name resolution:** `dig <domain>` or `nslookup <domain>` — record the resolved IP.
```bash
nslookup google.com
# Current DNS server and the IP address of the domain - google.com
# Older and Outdated.

dig google.com
# Detailed info about the google.com domain, including the DNS server and the IP address.
# Newer and currently in use.
```
- **HTTP check:** `curl -I <http/https-url>` — note the HTTP status code.
```bash
Status Code is 200 - OK
```
- **Connections snapshot:** `netstat -an | head` — count ESTABLISHED vs LISTEN (rough).
```bash
# LISTEN:-- 
netstat -an | grep LISTEN | wc -l 
# 41
# ESTABLISHED:--
netstat -an | grep ESTABLISHED | wc -l
# 0
```

---

## Mini Task: Port Probe & Interpret
1) Identify one listening port from `ss -tulpn` (e.g., SSH on 22 or a local web app).  
```bash
ss -tulpn
# tcp LISTEN [::]:80 - nginx works on port 80.
```
2) From the same machine, test it: `nc -zv localhost <port>` (or `curl -I http://localhost:<port>`).  
```bash
curl -I http://localhost:80
```
3) Write one line: is it reachable? If not, what’s the next check? (e.g., service status, firewall).
```bash
curl -I https://localhost:80
# Reachable?? - NO 
# Why?? - nginx is unencrypted and hence require http url and not https type of url to work. 
# Solution?? - Use curl -I http://localhost:80 instead.  
```

---

## Reflection (add to your markdown)
- Which command gives you the fastest signal when something is broken?
   - ping <domain_name>
   - Fastest way to check if the server is reachable or not! 
- What layer (OSI/TCP-IP) would you inspect next if DNS fails? 
   - Applications Layer
   - Transport Layer
- If HTTP 500 shows up?
   - Application Layer
- Two follow-up checks you’d run in a real incident.
   - sudo systemctl status <service_name>
   - // To check the status - Active/ Not Active
   - journalctl -u <domain_name> -n 5
   - // Check the system logs

