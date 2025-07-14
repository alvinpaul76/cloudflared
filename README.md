# Cloudflared Docker Setup

This repository contains a Docker-based setup for running Cloudflare Tunnel (cloudflared) in a containerized environment.

## Prerequisites

- Docker
- Docker Compose
- A Cloudflare account with Tunnel configured

## Configuration

The project uses the following configuration files:

- `docker-compose.yml`: Defines the container setup and volume mapping
- `.env`: Contains the Cloudflare Tunnel token (use `.env.sample` as a template)
- `start-cloudflared.sh`: Script for running cloudflared directly (without Docker)
- `start-cloudflared-container.sh`: Script for running cloudflared in a Docker container
- `cloudflared-docker-ssh`: Helper script for SSH access via the cloudflared container

## Setup Instructions

### Option 1: Using Docker Compose (Recommended)

1. Create a Cloudflare Tunnel and get your tunnel token
2. Copy the `.env.sample` file to `.env` and add your tunnel token:
   ```
   CLOUDFLARED_TOKEN=your-tunnel-token
   ```

3. Ensure the volume directory exists:
   ```bash
   mkdir -p /storage/cloudflare/cloudflared
   ```

4. Start the service using Docker Compose:
   ```bash
   docker-compose up -d
   ```

### Option 2: Using Docker Run Script

You can also use the provided script to run cloudflared in a Docker container:

```bash
chmod +x start-cloudflared-container.sh
./start-cloudflared-container.sh
```

### Option 3: Running Directly (Without Docker)

To run cloudflared directly on your host machine:

```bash
chmod +x start-cloudflared.sh
./start-cloudflared.sh
```

## SSH Access via Cloudflare Tunnel

This setup includes a helper script for SSH access via Cloudflare Tunnel:

```bash
chmod +x cloudflared-docker-ssh
./cloudflared-docker-ssh hostname
```

Replace `hostname` with the hostname you want to connect to via SSH.

## Features

- Uses official Cloudflare tunnel Docker image
- Automatic container restart unless stopped manually
- Persistent volume mapping for configuration
- No auto-update to ensure stability
- SSH access via Cloudflare Tunnel

## Directory Structure

```
.
├── docker-compose.yml           # Docker Compose configuration
├── .env                         # Environment variables (created from .env.sample)
├── .env.sample                  # Template for environment variables
├── README.md                    # This documentation
├── start-cloudflared.sh         # Script to run cloudflared directly
├── start-cloudflared-container.sh # Script to run cloudflared in Docker
├── cloudflared-docker-ssh       # Helper script for SSH access
└── cloudflared.log              # Log file for cloudflared
```

## Security Notes

⚠️ **IMPORTANT SECURITY WARNINGS:**

1. Keep your tunnel token secure and never commit it to version control. The `.env` file should be added to `.gitignore`.

2. **WARNING:** The provided scripts (`start-cloudflared.sh` and `start-cloudflared-container.sh`) contain hardcoded tunnel tokens. Before using these scripts, replace the tokens with your own or preferably use environment variables instead of hardcoded values.

## Maintenance

The container is configured to restart automatically unless explicitly stopped. To update to a new version of cloudflared, you'll need to manually pull the latest image and restart the container:

```bash
docker-compose pull
docker-compose up -d
```

## Troubleshooting

If you encounter issues with the tunnel connection, check the logs:

```bash
# For Docker Compose setup
docker logs cloudflared

# For direct execution
cat cloudflared.log
```
