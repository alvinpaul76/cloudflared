# Frequently Asked Questions

Got questions? We've got answers! Here are the most common questions about Cloudflare Tunnel and this setup.

## General Questions

### What is Cloudflare Tunnel?

Cloudflare Tunnel is a service that creates a secure connection between your server and Cloudflare's network. It lets you access your services without opening ports on your router or exposing your server directly to the internet.

### Is this free?

Yes! Cloudflare Tunnel is free for personal use. You get unlimited bandwidth and can host multiple services through a single tunnel.

### Do I need a static IP address?

No! That's one of the best things about Cloudflare Tunnel - you don't need a static IP. Cloudflare handles all the networking for you.

### Can I use this with any domain?

Yes, as long as you own the domain and have it added to your Cloudflare account. You can use any domain registrar.

### Is my data secure?

Yes. All traffic through Cloudflare Tunnel is encrypted using TLS. Cloudflare also provides additional security features like DDoS protection.

## Setup Questions

### How long does setup take?

Most people can complete the setup in 15-30 minutes, including:
- Creating the Cloudflare Tunnel (5 minutes)
- Configuring the environment (5 minutes)
- Running the setup scripts (2 minutes)
- Testing everything (5-10 minutes)

### Do I need to be a technical expert?

No! This guide is designed for beginners. If you can follow step-by-step instructions and run commands in a terminal, you can set this up.

### Can I run this on my home computer?

Yes! You can run this on:
- Your home computer or laptop
- A home server (like a Raspberry Pi)
- A VPS (Virtual Private Server)
- A dedicated server

Just make sure the computer is always on if you want the tunnel to be always available.

### What if I don't have Docker?

Docker is required for this setup. If you don't have it:
- Download Docker Desktop from docker.com (free)
- Follow the installation guide for your operating system
- It usually takes 5-10 minutes to install

### Can I use this without Docker?

This specific project uses Docker, but Cloudflare Tunnel can run without Docker. However, we recommend Docker because it's easier to manage and more reliable.

## Usage Questions

### How many services can I host?

You can host multiple services through a single tunnel. Each service gets its own hostname (like `odoo.yourdomain.com`, `app.yourdomain.com`, etc.).

### Can I host multiple websites?

Yes! You can host as many websites as you want, each with its own subdomain. For example:
- `blog.yourdomain.com`
- `shop.yourdomain.com`
- `app.yourdomain.com`

### Does this work with HTTPS?

Yes! Cloudflare automatically provides SSL/TLS certificates for all your services. You don't need to configure anything - it just works.

### Can I access my services from anywhere?

Yes! Once your tunnel is set up, you can access your services from anywhere in the world, as long as you have internet access.

### What happens if my internet goes down?

If your server loses internet connection:
- The tunnel will disconnect
- Your services won't be accessible
- When internet returns, the tunnel automatically reconnects

### Can I use this for development?

Absolutely! Many developers use Cloudflare Tunnel to:
- Share work-in-progress projects with clients
- Test services on different devices
- Access local development servers remotely

## Security Questions

### Is my server exposed to the internet?

No! That's the whole point of Cloudflare Tunnel. Your server connects to Cloudflare, but the internet can't directly access your server. Only Cloudflare can reach your server through the tunnel.

### Do I need to configure my firewall?

No! Since you're not opening any ports, you don't need to configure port forwarding or firewall rules. This is much more secure than traditional hosting.

### Can I restrict who can access my services?

Yes! Cloudflare offers access controls:
- IP whitelisting/blacklisting
- Geographic restrictions
- Authentication (email, Google, etc.)
- Zero Trust access policies

### What if someone gets my tunnel token?

If your token is compromised:
- Someone could potentially access your services
- Immediately go to Cloudflare Dashboard and rotate/revoke the token
- Update your .env file with the new token
- Restart the tunnel

### Should I share my .env file?

No! Never share your .env file. It contains sensitive information. The .env file is already in .gitignore to prevent accidental sharing.

## Performance Questions

### Will this slow down my services?

Generally, no. Cloudflare has a global network with fast connections. In fact, Cloudflare can often make your services faster by:
- Caching content
- Serving from locations closer to users
- Optimizing connections

### What about bandwidth?

Cloudflare Tunnel includes unlimited bandwidth for free accounts. You don't need to worry about data limits.

### Can this handle high traffic?

Yes! Cloudflare's infrastructure is designed to handle high traffic. However, your own server's resources (CPU, memory) will still be the limiting factor.

## Maintenance Questions

### Do I need to update this regularly?

The tunnel container doesn't auto-update (for stability), but you should:
- Check for updates occasionally
- Update when needed using: `docker-compose pull && docker-compose up -d`
- This ensures you have security patches and new features

### What happens if I restart my server?

The tunnel is configured to start automatically when your server starts. It will reconnect to Cloudflare automatically.

### How do I know if something goes wrong?

Check the logs regularly:
```bash
docker logs cloudflared
```

You can also monitor your tunnel's health in the Cloudflare Dashboard.

### Can I move this to another server?

Yes! To move to another server:
1. Install Docker on the new server
2. Copy this project to the new server
3. Copy your .env file
4. Run the setup scripts
5. Start the tunnel
6. Update your DNS if needed

## Troubleshooting Questions

### Why do I see "502 Bad Gateway"?

This usually means:
- Your service isn't running
- The service address is incorrect
- The service isn't accessible from the tunnel

Check the [troubleshooting guide](06-troubleshooting.md) for detailed solutions.

### Why won't my tunnel start?

Common reasons:
- Invalid or expired token
- Missing directories
- Permission issues

Check the logs and verify your configuration.

### Why can't I access my service?

Check:
- Is the tunnel running? (`docker ps`)
- Is your service running?
- Is the service address correct in Cloudflare Dashboard?
- Have you waited for DNS propagation (5-10 minutes)?

## Advanced Questions

### Can I use this with Kubernetes?

This specific setup is for Docker, but Cloudflare Tunnel can work with Kubernetes using Cloudflare's official Kubernetes ingress controller.

### Can I use this with load balancing?

Yes! Cloudflare offers load balancing features, though these are paid features. You can set up multiple tunnels and load balance between them.

### Can I monitor usage and analytics?

Yes! Cloudflare Dashboard provides:
- Traffic analytics
- Request logs
- Security insights
- Performance metrics

### Can I automate this?

Yes! You can:
- Use scripts to automate deployment
- Integrate with CI/CD pipelines
- Use infrastructure-as-code tools
- Monitor with automated alerts

## Still Have Questions?

If your question isn't answered here:
- Check the [troubleshooting guide](06-troubleshooting.md)
- Review Cloudflare's official documentation
- Search the Cloudflare community forums
- Reach out to the project maintainers

## Additional Resources

- [Cloudflare Tunnel Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
- [Cloudflare Community](https://community.cloudflare.com/)
- [Docker Documentation](https://docs.docker.com/)
