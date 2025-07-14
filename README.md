# Cloudflared Docker Setup

This repository contains a Docker-based setup for running Cloudflare Tunnel (cloudflared) in a containerized environment.

## Prerequisites

- Docker
- Docker Compose
- A Cloudflare account with Tunnel configured
- Sudo privileges (required for volume creation script)

## Configuration

The project uses the following configuration files:

- `docker-compose.yml`: Defines the container setup and volume mapping
- `.env`: Contains the Cloudflare Tunnel token (created from `.env.sample`)
- `.env.sample`: Template file for environment variables
- `start-cloudflared.sh`: Script for running cloudflared directly (without Docker)
- `start-cloudflared-container.sh`: Script for running cloudflared in a Docker container
- `cloudflared-docker-ssh`: Helper script for SSH access via the cloudflared container
- `create_volumes.sh`: Script to automatically create required volume directories
- `.gitignore`: Ensures sensitive files are not committed to version control

## Quick Start

For the fastest setup, use the automated volume creation script:

```bash
# Clone the repository (if not already done)
git clone <repository-url>
cd cloudflared

# Set up environment variables
cp .env.sample .env
# Edit .env file and add your Cloudflare tunnel token

# Create required directories automatically
sudo chmod +x create_volumes.sh
sudo ./create_volumes.sh

# Start the service
docker-compose up -d
```

## Detailed Setup Instructions

### Option 1: Using Docker Compose (Recommended)

1. Create a Cloudflare Tunnel and get your tunnel token
2. Copy the `.env.sample` file to `.env` and add your tunnel token:
   ```bash
   cp .env.sample .env
   # Edit .env and replace 'your-tunnel-token-here' with your actual token
   ```

3. Create the required volume directories:
   ```bash
   sudo chmod +x create_volumes.sh
   sudo ./create_volumes.sh
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
- Automated volume directory creation script
- Secure environment variable management
- Git ignore configuration for sensitive files

## Directory Structure

```
.
├── docker-compose.yml           # Docker Compose configuration
├── .env                         # Environment variables (created from .env.sample)
├── .env.sample                  # Template for environment variables
├── .gitignore                   # Git ignore file for sensitive data
├── README.md                    # This documentation
├── LICENSE                      # Project license
├── start-cloudflared.sh         # Script to run cloudflared directly
├── start-cloudflared-container.sh # Script to run cloudflared in Docker
├── cloudflared-docker-ssh       # Helper script for SSH access
├── create_volumes.sh            # Script to create required volume directories
└── cloudflared.log              # Log file for cloudflared (generated at runtime)
```

## Security Notes

⚠️ **IMPORTANT SECURITY WARNINGS:**

1. **Keep your tunnel token secure** and never commit it to version control. The `.env` file is already included in `.gitignore` to prevent accidental commits.

2. **WARNING:** The provided scripts (`start-cloudflared.sh` and `start-cloudflared-container.sh`) contain hardcoded tunnel tokens for demonstration purposes. **These should be replaced with your own tokens** or preferably use environment variables instead of hardcoded values.

3. **Volume Permissions:** The `create_volumes.sh` script sets directory permissions to 777 for Docker compatibility. In production environments, consider using more restrictive permissions and proper user mapping.

4. **Token Rotation:** Regularly rotate your Cloudflare tunnel tokens and update the `.env` file accordingly.

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

### Common Issues

1. **Permission denied when creating volumes:**
   - Ensure you run `create_volumes.sh` with sudo privileges
   - Check that the `/storage` directory is writable

2. **Container fails to start:**
   - Verify your tunnel token is correctly set in the `.env` file
   - Check that Docker has sufficient resources allocated

3. **SSH access not working:**
   - Ensure the cloudflared container is running: `docker ps`
   - Verify the hostname is correctly configured in your Cloudflare dashboard

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the terms specified in the LICENSE file.
