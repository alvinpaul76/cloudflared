# Common Tasks

This guide covers the day-to-day tasks you might need to perform with your Cloudflare Tunnel.

## Checking if the Tunnel is Running

### Quick Status Check

```bash
docker ps
```

Look for a container named `cloudflared` with status "Up".

### Detailed Status

```bash
docker-compose ps
```

This shows more details about the container state.

## Viewing Logs

### See Recent Activity

```bash
docker logs cloudflared
```

This shows the most recent log entries from the tunnel.

### Follow Logs in Real-Time

```bash
docker logs -f cloudflared
```

This shows logs as they happen. Press `Ctrl+C` to stop watching.

### See Last 100 Lines

```bash
docker logs --tail 100 cloudflared
```

Useful when you only need to see recent activity.

## Starting and Stopping the Tunnel

### Start the Tunnel

```bash
docker-compose up -d
```

The `-d` flag runs it in the background.

### Stop the Tunnel

```bash
docker-compose stop
```

This stops the tunnel but keeps the container.

### Restart the Tunnel

```bash
docker-compose restart
```

Use this after making configuration changes.

### Stop and Remove the Container

```bash
docker-compose down
```

This stops and removes the container but keeps your configuration.

## Updating the Tunnel

### Update to the Latest Version

```bash
docker-compose pull
docker-compose up -d
```

This pulls the latest Cloudflare image and restarts the tunnel.

### Check Current Version

```bash
docker images | grep cloudflared
```

This shows which version you're currently running.

## Managing Multiple Services

### Add a New Service

1. Go to Cloudflare Dashboard
2. Navigate to your tunnel
3. Click "Public Hostnames"
4. Click "Add a public hostname"
5. Configure the new service
6. Save - no restart needed!

### Remove a Service

1. Go to Cloudflare Dashboard
2. Navigate to your tunnel
3. Click "Public Hostnames"
4. Find the service you want to remove
5. Click the delete button
6. Confirm - the service is immediately inaccessible

### List All Configured Services

1. Go to Cloudflare Dashboard
2. Navigate to your tunnel
3. Click "Public Hostnames"
4. All your configured services are listed here

## SSH Access

### Connect via SSH

```bash
chmod +x cloudflared-docker-ssh
./cloudflared-docker-ssh ssh.yourdomain.com
```

Replace `ssh.yourdomain.com` with your actual SSH hostname.

### Test SSH Connection

```bash
./cloudflared-docker-ssh ssh.yourdomain.com --echo
```

This tests the connection without actually logging in.

## Backup and Restore

### Backup Your Configuration

Your tunnel configuration is stored in two places:

1. **Cloudflare Dashboard** - All your public hostnames and settings
2. **.env file** - Your tunnel token and local settings

To backup:

1. **Copy your .env file** to a secure location:
   ```bash
   cp .env .env.backup
   ```

2. **Screenshot or note** your Cloudflare Dashboard configuration

### Restore Your Configuration

1. **Restore the .env file:**
   ```bash
   cp .env.backup .env
   ```

2. **Recreate your public hostnames** in Cloudflare Dashboard from your notes

## Performance Monitoring

### Check Tunnel Status in Cloudflare

1. Go to Cloudflare Dashboard
2. Navigate to your tunnel
3. View the "Health" tab
4. This shows connection status and metrics

### Monitor Resource Usage

```bash
docker stats cloudflared
```

This shows CPU, memory, and network usage in real-time.

## Security Tasks

### Rotate Your Tunnel Token

For better security, rotate your token periodically:

1. Go to Cloudflare Dashboard
2. Navigate to your tunnel
3. Look for token rotation options
4. Generate a new token
5. Update your .env file with the new token
6. Restart the tunnel:
   ```bash
   docker-compose restart
   ```

### Check for Unauthorized Access

1. Go to Cloudflare Dashboard
2. Navigate to Zero Trust > Logs
3. Review access logs for suspicious activity
4. Set up alerts if needed

## Troubleshooting Tasks

### Clear DNS Cache

If changes aren't taking effect:

1. **On your computer:**
   - Windows: `ipconfig /flushdns`
   - Mac: `sudo dscacheutil -flushcache`
   - Linux: `sudo systemd-resolve --flush-caches`

2. **In your browser:**
   - Clear browser cache
   - Try incognito/private mode

### Reset the Tunnel

If nothing else works:

```bash
docker-compose down
docker-compose up -d
```

This completely stops and restarts the tunnel.

## Maintenance Schedule

### Weekly Tasks

- Check tunnel status in Cloudflare Dashboard
- Review logs for any errors
- Verify all services are accessible

### Monthly Tasks

- Review and rotate security tokens if needed
- Check for Cloudflare updates
- Review access logs for suspicious activity
- Backup your .env file

### Quarterly Tasks

- Review all configured services
- Remove any unused services
- Update documentation
- Test disaster recovery procedures

## Getting Help

If you need help with any task:

1. Check the [troubleshooting guide](06-troubleshooting.md)
2. Review the [FAQ](07-faq.md)
3. Check Cloudflare's official documentation
4. Reach out to the community for support

## Next Steps

- See the [troubleshooting guide](06-troubleshooting.md) for common issues
- Check the [FAQ](07-faq.md) for answers to common questions
