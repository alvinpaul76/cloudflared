# Cloudflare Tunnel Setup

Welcome! This project makes it easy to set up Cloudflare Tunnel - a secure way to access your services from anywhere without opening ports on your router or exposing your server to the internet.

## 🚀 Quick Start

New here? Start with our comprehensive user guide:

**[📖 Start Here: What is Cloudflare Tunnel?](docs/01-introduction.md)**

## 📚 Complete User Documentation

We've created detailed, easy-to-follow guides to help you every step of the way. Each guide is written for beginners - no technical expertise required!

### Getting Started

1. **[What is Cloudflare Tunnel?](docs/01-introduction.md)** - Learn what this is and why you might need it
2. **[What You Need](docs/02-what-you-need.md)** - A checklist of everything you need before starting
3. **[Getting Started Guide](docs/03-getting-started.md)** - Step-by-step setup instructions

### Using Your Tunnel

4. **[Configuration Guide](docs/04-configuration.md)** - How to set up different services (websites, SSH, etc.)
5. **[Common Tasks](docs/05-common-tasks.md)** - Day-to-day management and maintenance
6. **[Troubleshooting](docs/06-troubleshooting.md)** - Solutions to common problems

### Additional Help

7. **[FAQ](docs/07-faq.md)** - Frequently asked questions and answers

## ✨ What Can You Do With This?

- **Access your services from anywhere** - No matter where you are, your services are reachable
- **No router configuration needed** - Forget about port forwarding and complex networking
- **Automatic HTTPS/SSL** - Your connections are always encrypted and secure
- **Works with Odoo** - Specifically designed to work with self-hosted Odoo instances
- **SSH access** - Securely access your server remotely
- **Multiple services** - Host multiple websites and applications through one tunnel

## 🎯 Who Is This For?

This setup is perfect for:
- Small business owners hosting their own Odoo instance
- Developers who need remote access to their projects
- Anyone who wants secure, easy remote access without technical complexity
- People who want to avoid router configuration and port forwarding

## 🔒 Why Use Cloudflare Tunnel?

**Security First**
- No open ports on your router or firewall
- All traffic is encrypted
- Your server stays hidden from the internet
- Protection against direct attacks

**Simple and Reliable**
- Easy setup with clear instructions
- Automatic restart if something goes wrong
- Always-on connection
- Minimal maintenance required

**Free to Use**
- No cost for personal use
- Unlimited bandwidth
- No need for static IP addresses

## 🛠️ Quick Setup Overview

If you're already familiar with the basics, here's the quick version:

```bash
# 1. Get the project
git clone <repository-url>
cd cloudflared

# 2. Set up your configuration
cp .env.sample .env
# Edit .env and add your Cloudflare tunnel token

# 3. Create required directories
sudo chmod +x create_volumes.sh
sudo ./create_volumes.sh

# 4. Start the tunnel
docker-compose up -d
```

**New to this?** Please follow the [Getting Started Guide](docs/03-getting-started.md) for detailed instructions with explanations.

## 📖 Documentation Structure

All documentation is organized in the `docs/` folder:

- **docs/01-introduction.md** - Overview and benefits
- **docs/02-what-you-need.md** - Prerequisites and requirements
- **docs/03-getting-started.md** - Complete setup guide
- **docs/04-configuration.md** - Configuring different services
- **docs/05-common-tasks.md** - Daily usage and maintenance
- **docs/06-troubleshooting.md** - Problem-solving guide
- **docs/07-faq.md** - Common questions and answers

## 💡 Need Help?

- **Stuck on setup?** Check the [troubleshooting guide](docs/06-troubleshooting.md)
- **Have a question?** See the [FAQ](docs/07-faq.md)
- **Want to learn more?** Start with the [introduction](docs/01-introduction.md)

## 📝 Project Files

- `docker-compose.yml` - Docker configuration
- `.env.sample` - Template for your settings
- `create_volumes.sh` - Automated setup script
- `start-cloudflared.sh` - Alternative startup method
- `start-cloudflared-container.sh` - Docker container startup
- `cloudflared-docker-ssh` - SSH access helper

## 🔐 Security Note

Your `.env` file contains sensitive information (your tunnel token). Never share it or commit it to version control. It's already included in `.gitignore` for your protection.

## 📄 License

This project is licensed under the terms specified in the LICENSE file.

---

**Ready to get started?** Begin with [What is Cloudflare Tunnel?](docs/01-introduction.md)
