# Configuration Guide

This guide explains how to configure your Cloudflare Tunnel for different use cases. Don't worry - we'll keep it simple!

## Understanding the Configuration Files

### The .env File

The `.env` file contains your tunnel's settings. It's like a settings menu for your tunnel.

**Important:** Never share your `.env` file with anyone. It contains sensitive information.

**What's in the .env file:**

```bash
# Your Cloudflare Tunnel token
CLOUDFLARED_TOKEN=your-actual-token-here

# Where to store configuration files
DEFAULT_STORAGE_FOLDER=/storage/cloudflare
```

### The docker-compose.yml File

This file tells Docker how to run your tunnel. You usually don't need to edit this file, but here's what it does:

- **Defines the network:** Creates a shared network for communication
- **Sets up volumes:** Maps storage locations
- **Configures the container:** Sets restart policies and environment variables

## Configuring Different Services

### Web Applications (Like Odoo)

If you're hosting a web application like Odoo:

1. **Go to Cloudflare Dashboard**
   - Navigate to your tunnel
   - Click "Public Hostnames"
   - Click "Add a public hostname"

2. **Set up the hostname**
   - **Subdomain:** `odoo` (or whatever you prefer)
   - **Domain:** Your domain name
   - **Path:** Leave empty (or `/` for root path)
   - **Service Type:** HTTP

3. **Configure the service address**
   - This depends on your setup:
   - If using Docker with shared network: `odoo:8069`
   - If running on the same machine: `localhost:8069`
   - If on a different machine: `192.168.1.100:8069` (replace with actual IP)

4. **Save** and test by visiting `https://odoo.yourdomain.com`

### Multiple Websites on One Server

You can host multiple websites through the same tunnel:

1. **Add a public hostname** for each website
2. **Use different subdomains:**
   - `app1.yourdomain.com` → `service1:80`
   - `app2.yourdomain.com` → `service2:8080`
   - `blog.yourdomain.com` → `wordpress:80`

3. **Each hostname** points to a different service on your server

### SSH Access

You can access your server remotely using SSH through the tunnel:

1. **In Cloudflare Dashboard**
   - Go to your tunnel
   - Click "Public Hostnames"
   - Click "Add a public hostname"

2. **Configure SSH**
   - **Subdomain:** `ssh` (or your choice)
   - **Domain:** Your domain
   - **Service Type:** SSH
   - **Service:** Choose your server from the list

3. **Connect via SSH**
   ```bash
   chmod +x cloudflared-docker-ssh
   ./cloudflared-docker-ssh ssh.yourdomain.com
   ```

### Local Development

If you want to access local development projects:

1. **Run your local server** (e.g., `localhost:3000`)
2. **Add a public hostname** in Cloudflare
3. **Service address:** `host.docker.internal:3000` (for Docker) or `localhost:3000`

## Advanced Configuration Options

### Custom Storage Location

If you want to store configuration files somewhere else:

1. **Edit the .env file**
   ```bash
   DEFAULT_STORAGE_FOLDER=/path/to/your/storage
   ```

2. **Re-run the volume creation script**
   ```bash
   sudo ./create_volumes.sh
   ```

### Shared Network with Other Services

This setup is designed to work with other Docker services (like Odoo):

1. **Both services** use the same Docker network
2. **They can communicate** using service names
3. **No need** for IP addresses or port configuration

The shared network is automatically configured in the `docker-compose.yml` file.

### Restart Policies

The tunnel is configured to restart automatically:
- **If it crashes:** It will restart automatically
- **If you reboot the server:** It will start automatically
- **If you stop it manually:** It stays stopped until you start it again

## Updating Your Configuration

### Changing the Tunnel Token

If you need to update your tunnel token:

1. **Get a new token** from Cloudflare Dashboard
2. **Edit the .env file** and replace the old token
3. **Restart the tunnel:**
   ```bash
   docker-compose restart
   ```

### Adding New Services

To expose additional services:

1. **Add the service** in Cloudflare Dashboard (Public Hostnames)
2. **No restart needed** - changes take effect immediately
3. **Test the new URL** in your browser

### Removing Services

To stop exposing a service:

1. **Go to Cloudflare Dashboard**
2. **Delete the public hostname** you want to remove
3. **The service is no longer accessible** through the tunnel

## Configuration Best Practices

### Security Tips

- **Never commit .env to version control** (it's already in .gitignore)
- **Rotate your tokens regularly** for added security
- **Use strong subdomain names** (avoid obvious ones like `admin` or `test`)
- **Enable additional security** in Cloudflare (like Zero Trust access rules)

### Organization Tips

- **Use descriptive subdomains** (`odoo-production`, `odoo-staging`)
- **Document your services** in a personal note
- **Keep your .env file backed up** in a secure location
- **Test changes in a staging environment first**

## Troubleshooting Configuration Issues

### Service Not Accessible

If you can't access a service:

1. **Check the service is running:**
   ```bash
   docker ps
   ```

2. **Check the tunnel is running:**
   ```bash
   docker logs cloudflared
   ```

3. **Verify the service address** in Cloudflare Dashboard
4. **Make sure the service is on the same network** (if using Docker)

### Changes Not Taking Effect

If configuration changes aren't working:

1. **Wait a few minutes** for DNS to propagate
2. **Clear your browser cache**
3. **Restart the tunnel:**
   ```bash
   docker-compose restart
   ```

## Next Steps

- Learn about [common tasks](05-common-tasks.md) for day-to-day management
- Check the [troubleshooting guide](06-troubleshooting.md) if you encounter issues
- See the [FAQ](07-faq.md) for common questions
