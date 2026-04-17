# Troubleshooting Guide

Having trouble? Don't worry - most issues have simple solutions. This guide will help you diagnose and fix common problems.

## Quick Diagnostic Steps

Before diving into specific issues, try these quick checks:

### 1. Is the Tunnel Running?

```bash
docker ps
```

**Expected:** You should see `cloudflared` in the list with status "Up"

**If not:** Start the tunnel with `docker-compose up -d`

### 2. Check the Logs

```bash
docker logs cloudflared
```

**What to look for:**
- Error messages (usually in red or marked "ERROR")
- Connection failures
- Authentication errors

### 3. Verify Your Token

```bash
cat .env | grep CLOUDFLARED_TOKEN
```

**Expected:** Should show a long token string (not "your-tunnel-token-here")

**If not:** Update your .env file with the correct token

## Common Problems and Solutions

### Problem: "502 Bad Gateway" Error

**Symptoms:**
- You see "502 Bad Gateway" when trying to access your service
- The tunnel is running but services aren't accessible

**Causes:**
- Service isn't running
- Service address is incorrect
- Service isn't on the same network

**Solutions:**

1. **Check if your service is running:**
   ```bash
   docker ps
   ```
   Look for your service container (e.g., Odoo)

2. **Verify the service address in Cloudflare Dashboard:**
   - Go to your tunnel
   - Click "Public Hostnames"
   - Check the service address matches your actual service
   - For Docker services: use `service-name:port` (e.g., `odoo:8069`)
   - For local services: use `localhost:port` or `host.docker.internal:port`

3. **Check if services are on the same network:**
   ```bash
   docker network inspect shared-network
   ```
   Both containers should be listed

### Problem: Tunnel Won't Start

**Symptoms:**
- Container exits immediately
- Docker shows status "Exited" instead of "Up"

**Causes:**
- Invalid token
- Missing directories
- Permission issues

**Solutions:**

1. **Check your token:**
   ```bash
   docker logs cloudflared
   ```
   Look for authentication errors

2. **Recreate directories:**
   ```bash
   sudo ./create_volumes.sh
   ```

3. **Check permissions:**
   ```bash
   ls -la /storage/cloudflare
   ```
   Directories should be accessible

### Problem: Can't Access Service After Configuration

**Symptoms:**
- You configured a service in Cloudflare Dashboard
- But the URL doesn't work

**Causes:**
- DNS propagation delay
- Browser cache
- Service not actually running

**Solutions:**

1. **Wait a few minutes** - DNS can take 5-10 minutes to propagate

2. **Clear your browser cache** or try incognito mode

3. **Check if the service is actually running:**
   ```bash
   docker ps
   ```

4. **Test with curl:**
   ```bash
   curl https://your-service.yourdomain.com
   ```

### Problem: SSH Access Not Working

**Symptoms:**
- SSH command hangs or fails
- Can't connect to server through tunnel

**Causes:**
- SSH not configured in Cloudflare
- Wrong hostname
- SSH service not running on server

**Solutions:**

1. **Verify SSH is configured in Cloudflare Dashboard:**
   - Go to your tunnel
   - Check "Public Hostnames"
   - Ensure SSH service type is configured

2. **Check SSH hostname:**
   ```bash
   ./cloudflared-docker-ssh ssh.yourdomain.com
   ```
   Use the exact hostname from Cloudflare Dashboard

3. **Verify SSH is running on your server:**
   ```bash
   sudo systemctl status ssh
   ```

### Problem: Container Keeps Restarting

**Symptoms:**
- Container status shows "Restarting"
- Logs show repeated start/stop cycles

**Causes:**
- Configuration error
- Resource limitations
- Network issues

**Solutions:**

1. **Check logs for errors:**
   ```bash
   docker logs cloudflared
   ```

2. **Check system resources:**
   ```bash
   docker stats
   ```
   Ensure you have enough CPU and memory

3. **Try a clean restart:**
   ```bash
   docker-compose down
   docker-compose up -d
   ```

### Problem: "Permission Denied" When Running Scripts

**Symptoms:**
- Can't run create_volumes.sh or other scripts
- Error says "Permission denied"

**Causes:**
- Script not executable
- Need sudo privileges

**Solutions:**

1. **Make script executable:**
   ```bash
   chmod +x create_volumes.sh
   ```

2. **Run with sudo:**
   ```bash
   sudo ./create_volumes.sh
   ```

### Problem: Changes Not Taking Effect

**Symptoms:**
- You changed configuration but nothing changed
- Old settings still in effect

**Causes:**
- Need to restart container
- DNS caching
- Cloudflare caching

**Solutions:**

1. **Restart the tunnel:**
   ```bash
   docker-compose restart
   ```

2. **Clear DNS cache** (see "Quick Diagnostic Steps")

3. **Wait for propagation** - some changes take time

## Error Messages and Their Meanings

### "Invalid tunnel token"

**Meaning:** Your token is incorrect or expired

**Solution:**
- Get a new token from Cloudflare Dashboard
- Update your .env file
- Restart the tunnel

### "Failed to connect to origin"

**Meaning:** Can't reach your service

**Solution:**
- Check if your service is running
- Verify the service address
- Check network connectivity

### "Connection refused"

**Meaning:** Service exists but isn't accepting connections

**Solution:**
- Check if service is actually running
- Verify the port number
- Check service logs

### "DNS resolution failed"

**Meaning:** Can't resolve the hostname

**Solution:**
- Check your domain is configured in Cloudflare
- Wait for DNS propagation
- Verify DNS settings

## Getting More Help

### Check Cloudflare Status

Sometimes Cloudflare itself has issues:
- Visit [https://www.cloudflarestatus.com](https://www.cloudflarestatus.com)
- Check if there are ongoing outages

### Enable Debug Logging

For more detailed information:

1. **Stop the tunnel:**
   ```bash
   docker-compose stop
   ```

2. **Edit docker-compose.yml** to add debug flag to the command

3. **Start the tunnel:**
   ```bash
   docker-compose up -d
   ```

4. **Check detailed logs:**
   ```bash
   docker logs cloudflared
   ```

### Reset Everything

If nothing else works, do a complete reset:

```bash
# Stop everything
docker-compose down

# Remove volumes (WARNING: This deletes configuration)
docker volume rm cloudflared_cloudflared

# Recreate directories
sudo ./create_volumes.sh

# Start fresh
docker-compose up -d
```

**Note:** You'll need to reconfigure your public hostnames in Cloudflare Dashboard.

## When to Contact Support

Contact support if:
- You've tried all solutions and the problem persists
- You see error messages you don't understand
- The tunnel was working but suddenly stopped
- You suspect a security issue

## Prevention Tips

### Regular Maintenance

- Check logs weekly for early warning signs
- Keep your token updated
- Monitor resource usage
- Test your services regularly

### Best Practices

- Don't make too many changes at once
- Test changes in a staging environment first
- Keep backups of your configuration
- Document any custom changes you make

## Next Steps

- Check the [FAQ](07-faq.md) for common questions
- Review [common tasks](05-common-tasks.md) for regular maintenance
