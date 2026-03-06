## Challenge Tasks

### Task 1: DNS – How Names Become IPs
1. Explain in 3–4 lines: what happens when you type `google.com` in a browser?
   - The browser requests the site's IP Address through the DNS Server. 
   - A stable Networking Connection is established with Google's Server via TCP.
   - The Server than sends back the data - HTML, CSS, JavaScript
   - The browser than receives the data and displays the required web page.

2. What are these record types? Write one line each:
   - `A`: Maps the domain name directly into the IPv4 address.
   - `AAAA`: Maps the domain name directly into the IPv6 address.
   - `CNAME`: It is an "alias" that maps to another domain name rather than an IP Address. 
   - `MX`: It manages the mail servers responsible for managing the mails received for the domain.
   - `NS`: List the name servers that are the source of your DNS info for your domain.
3. Run: `dig google.com` — identify the A record and TTL from the output
   - `A`: 172.217.26.14
   - `TTL` (Time to live): 257 

---

### Task 2: IP Addressing
1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)
   - IPv4 is a type of IP address that is 32 bits long.
   - It is a unique numerical label assigned to every device connected over the network.
   - Think of it as a digital home address that allows data to find it's way upto your device.
2. Difference between **public** and **private** IPs — give one example of each
   - Public IP is like a street address where the mailman drops off the package.
   - Private IP is like a specific room where you live.
   - Public IP: 
     - It is a unique number assigned to every device conected over the network.
     - It helps you to identify yourself over the internet.
     - It is unique and no 2 devices can have the same IP address at the same time.
     - Who gave it to me: Provided by the ISP (Internet Service Provider).
     - Who can see it: Whichever website i visit can see my Public IP.
     - Exmaple: 8.8.8.8 (One of google's public DNS).
     - Can be checked by : 
     ```bash
     curl ifconfig.me
     ```

   - Private IP:
     - It is used only in your local devices (within your local network or the office wifi).
     - It allows you to talk to the peripheral devices without sending any data to the internet.
     - Who gave it to me: My private Router
     - Who can see it: All the devices connected to the same network.
     - Example: 192.168.1.15 (A very common home network address)
     - Can be checked by :
     ```bash
     hostname -I
     ```
3. What are the private IP ranges?
   - `10.x.x.x` : Large Corporate Companies/ Data centers like AWS or AZURE.
   - `172.16.x.x – 172.31.x.x` : Used by Mid-sized Companies and university campuses. 
   - `192.168.x.x` : Used by the home routers/ local networks.
4. Run: `ip addr show` — identify which of your IPs are private
```bash
# In the etho section, look for inet.
# the numbers following inet are the private ip.
# 172.x.x.x/20 - /20 means the number of devices that can be connected with the network.
```

---

### Task 3: CIDR & Subnetting
1. What does `/24` mean in `192.168.1.0/24`?
   - `/24` is the CIDR (Classless Inter-Domain Routing).
   - It tells the git, internet and the router which part of the IP Address is specific to the network and which part is available for the devices.
   - IPv4 can have 32 bits of data that is 8 bits each. 
   - for `/24`, it is going to be 24/8= 3 octets (numbers with a dot in between).
   - now the last 8 bits are left.
   - the first 3 octets of the IP Address are going to be the same for all the devices connected over the network.
   - as for the last 8 bits left - there can be 2^8=256 addresses (the devices that can be connected over the network).
   - The subnet mask - `255.255.255.0` meaning - 256 can have 8 ones (11111111). 
   - As for the 255's in a row there will be 24 1 ones.
2. How many usable hosts in a :--
   - The very first and the very last address cannot be used, therefore the usable ports are always 2 less, some of them are as follows:-
   - `/24`: 2^8 = 256 hosts (usable:254)
   - `/16`: 2^16 = 65,536 hosts (usable:65,534)
   - `/28`: 2^4 = 16 hosts (usable:14)
3. Explain in your own words: why do we subnet?
   - It is very difficult to have a network consisting of 60,000 devices all in a single room.
   - With subnets, the devices are allocated a room (like /24) so that whenever the devices "shout" for each other than only the devices within that group (254 for /24) will hear it and respond.
   - Why is it needed in Devops:--
     - Performance: --
       - In a network, devices shout at each other. With subnets, only the devices of the room will be able to hear. Thus creating an easy environment.
     - Security: --
       - We don't want the private and the public data to be present in the same room. Therefore, the private subnet has got the private data and the public subnet has got the public data.
     - Organisation: --
       - Just like companies have seperate departments (like HR, Tech, Finance), there are departments in subnets as well.
       - Subnet A - Wifi for office
       - Subnet B - Security cameras
       - Subnet C - Production Servers
       This makes troubleshooting much easier when you know exactly where the IP address is stored. 
4. Quick exercise — fill in:

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|-----------|--------------|
| /24  | 255.255.255.0           | 256         | 254            |
| /16  | 255.255.0.0           | 65,536         | 65,534            |
| /28  | 255.255.255.240           | 16         | 14            |

---

### Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?
   - Port: --
     - If the IP Address gets the data from the server, than the port tells the data where exactly it is supposed to go.
     - It is a 16 bit number that identifies a specific process.
     - when the computer receives data, it looks at the header for the port number - where it is supposed to go exactly.
     - If the packet is addressed to port 80 - unencrypted web services (nginx)
   - Why do we need them??
     - It is needed to perform multiple things in your computer at the same time.
     - Imagine you are using your computer :-
       - Zoom for audio/video calls.
       - https for web services
       - downloading a file
      - If there were no ports than the incomming data won't know where it is supposed to go and there will be data mixup as a single device will use only a single IP address of your device.
2. Document these common ports:

| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | Nginx   |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MySQL-DB|
| 6379 | Redis   |
| 27017| MongoDB |

3. Run `ss -tulpn` — match at least 2 listening ports to their services
- Port 53: DNS 
  - Handles the IP addresses for the various Domain names like google
- Port 80: Nginx
  - `0.0.0.0`: Anyone who knows your IP address can access the data that you have hosted on this port.
---

### Task 5: Putting It Together
Answer in 2–3 lines each:
- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
   - It triggers the DNS resolution to turn `myapp.com` into the IP address. 
   - It then attempt a TCP connection using an alternative https - 8080 instead of the standard port 80.
   - Finally it uses the private/public IP to find the server door at 8080 port.
- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?
   - Check if the private IP `10.0.1.50` is reachable.
   - If the port - 3306 for MySQL is working or not.
   - Check the firewall, if myapp is allowed to enter or not.

---

## What I Learnt
- CIDR and how it works
- Ports and some examples
- Subnets and their importance