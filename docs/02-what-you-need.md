# What You Need

## Before You Start

To use this Cloudflare Tunnel setup, you'll need a few things. Don't worry - we'll explain each one and why it's needed.

## Essential Requirements

### 1. A Cloudflare Account

**What is it?**
Cloudflare is a company that provides security and performance services for websites. You'll need a free account with them.

**Why do you need it?**
Cloudflare Tunnel is their service, and you need an account to create and manage tunnels.

**How to get it:**
- Go to [https://dash.cloudflare.com/sign-up](https://dash.cloudflare.com/sign-up)
- Sign up for a free account (no credit card required)
- Verify your email address

### 2. A Domain Name

**What is it?**
A domain name is your website's address on the internet (like `example.com` or `mybusiness.com`).

**Why do you need it?**
You need a domain name to use Cloudflare's services. The tunnel will connect your domain to your server.

**How to get it:**
- You can buy a domain from any domain registrar (GoDaddy, Namecheap, Google Domains, etc.)
- Or you can use a domain you already own
- The domain doesn't need to be hosted with Cloudflare initially (we'll help you set that up)

### 3. Docker Installed

**What is it?**
Docker is a tool that lets you run applications in containers - like lightweight, portable virtual machines.

**Why do you need it?**
This project uses Docker to run Cloudflare Tunnel in a clean, isolated environment.

**How to check if you have it:**
Open your terminal and type:
```bash
docker --version
```

If you see a version number, you have Docker installed. If you see an error, you need to install it.

**How to install it:**
- **Ubuntu/Debian:** Follow the official Docker installation guide
- **Mac:** Download Docker Desktop from [docker.com](https://www.docker.com/products/docker-desktop)
- **Windows:** Download Docker Desktop from [docker.com](https://www.docker.com/products/docker-desktop)

### 4. Docker Compose Installed

**What is it?**
Docker Compose is a tool for defining and running multi-container Docker applications.

**Why do you need it?**
This project uses Docker Compose to manage the Cloudflare Tunnel container easily.

**How to check if you have it:**
Open your terminal and type:
```bash
docker-compose --version
```

If you see a version number, you have Docker Compose installed.

**How to install it:**
- Docker Compose is usually included with Docker Desktop on Mac and Windows
- On Linux, you may need to install it separately following the official guide

### 5. A Server or Computer to Run This On

**What is it?**
Any computer or server where you want to run Cloudflare Tunnel.

**Why do you need it?**
The tunnel needs to run on a machine that has access to the services you want to expose.

**Requirements:**
- Can be a local computer, a VPS (Virtual Private Server), or a dedicated server
- Needs to be always on if you want the tunnel to be always available
- Should have Docker and Docker Compose installed
- Needs internet access

### 6. Administrator/Sudo Access

**What is it?**
The ability to run commands with administrator privileges on your system.

**Why do you need it?**
Some setup steps require creating directories and managing system resources.

**How to check:**
On Linux/Mac, you can use `sudo` before commands that need elevated privileges.

### 7. Basic Command Line Knowledge

**What is it?**
The ability to use a terminal or command prompt to run commands.

**Why do you need it?**
This setup involves running a few commands in the terminal.

**Don't worry if you're new to this:**
- We provide exact commands for you to copy and paste
- You don't need to be an expert
- We'll guide you through each step

## Optional but Recommended

### Git

**What is it?**
A version control system for tracking changes in files.

**Why it's helpful:**
Makes it easy to download and update this project.

**How to check:**
```bash
git --version
```

**How to install:**
- Most systems come with Git pre-installed
- If not, follow the official Git installation guide for your operating system

## What You DON'T Need

- **No router configuration** - You don't need to set up port forwarding
- **No static IP address** - Cloudflare handles this for you
- **No complex networking knowledge** - We handle the technical details
- **No SSL certificates** - Cloudflare provides this automatically
- **No expensive hardware** - Works on standard computers and servers

## Quick Checklist

Before proceeding to the setup guide, make sure you have:

- [ ] Cloudflare account (free)
- [ ] A domain name
- [ ] Docker installed
- [ ] Docker Compose installed
- [ ] A server/computer to run this on
- [ ] Administrator/sudo access
- [ ] Basic ability to use the terminal

## Next Steps

Once you have everything ready, head over to [Getting Started](03-getting-started.md) to begin the setup process.
