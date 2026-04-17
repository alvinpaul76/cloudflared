# Getting Started

This guide will walk you through setting up Cloudflare Tunnel step by step. Follow each step carefully, and you'll have your tunnel running in no time!

## Step 1: Get the Project Files

First, you need to download this project to your computer or server.

### Option A: Using Git (Recommended)

If you have Git installed, run these commands in your terminal:

```bash
# Clone the repository
git clone <repository-url>
cd cloudflared
```

### Option B: Download Manually

If you don't have Git or prefer not to use it:

1. Download the project files as a ZIP file
2. Extract the ZIP file to your desired location
3. Open a terminal and navigate to the extracted folder

## Step 2: Create Your Cloudflare Tunnel

Now you need to create a tunnel in your Cloudflare account.

1. **Log in to Cloudflare**
   - Go to [https://dash.cloudflare.com](https://dash.cloudflare.com)
   - Sign in with your account

2. **Select your domain**
   - Click on the domain you want to use

3. **Go to Zero Trust**
   - In the left sidebar, click on "Zero Trust"
   - Then click on "Networks" and select "Tunnels"

4. **Create a new tunnel**
   - Click the "Create Tunnel" button
   - Choose a name for your tunnel (e.g., "my-server-tunnel")
   - Click "Next"

5. **Choose your setup method**
   - Select "Docker" as the installation method
   - Cloudflare will show you a command with a token
   - **Copy this token** - you'll need it in the next step

## Step 3: Configure the Environment

Now you'll set up the configuration file for your tunnel.

1. **Copy the sample environment file**
   ```bash
   cp .env.sample .env
   ```

2. **Edit the .env file**
   - Open the `.env` file in a text editor
   - Replace `your-tunnel-token-here` with the token you copied from Cloudflare
   - The line should look something like:
     ```
     CLOUDFLARED_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
     ```

3. **Set the storage folder (optional)**
   - The `DEFAULT_STORAGE_FOLDER` determines where configuration files are stored
   - The default is `/storage/cloudflare`
   - You can change this if you want to store files elsewhere

4. **Save the file**

## Step 4: Create Required Directories

This project includes a script that automatically creates all the directories you need.

1. **Make the script executable**
   ```bash
   sudo chmod +x create_volumes.sh
   ```

2. **Run the script**
   ```bash
   sudo ./create_volumes.sh
   ```

   This script will:
   - Create the necessary directories for storing configuration
   - Set the correct permissions
   - Verify everything is ready

   You should see checkmarks (✓) indicating successful completion.

## Step 5: Start the Tunnel

Now you're ready to start your Cloudflare Tunnel!

### Using Docker Compose (Recommended)

```bash
docker-compose up -d
```

This command:
- Starts the Cloudflare Tunnel container
- Runs it in the background (`-d` flag)
- Configures it to restart automatically if it stops

### Verify It's Running

Check that the container is running:

```bash
docker ps
```

You should see a container named `cloudflared` in the list with a status of "Up".

## Step 6: Configure Your Services in Cloudflare

Now that your tunnel is running, you need to tell Cloudflare which services to route through it.

1. **Go back to Cloudflare Dashboard**
   - Navigate to your tunnel in Zero Trust > Networks > Tunnels

2. **Add a public hostname**
   - Click on your tunnel
   - Go to the "Public Hostnames" tab
   - Click "Add a public hostname"

3. **Configure the hostname**
   - **Subdomain:** Choose a subdomain (e.g., `odoo`, `app`, or `www`)
   - **Domain:** Select your domain
   - **Service:** Choose the type of service you're exposing
   - **Service address:** This depends on what you're hosting:
     - For Odoo: `odoo:8069` (if using the Odoo Docker setup)
     - For a web server: `localhost:80` or your service's address
     - For SSH: Select "SSH" from the service type dropdown

4. **Save the configuration**

5. **Repeat** for each service you want to expose

## Step 7: Test Your Setup

Try accessing your service through the tunnel!

1. **Open a web browser**
2. **Go to your new URL** (e.g., `https://odoo.yourdomain.com`)
3. **If everything is working**, you should see your service

If it doesn't work immediately:
- Wait a few minutes for DNS to propagate
- Check the troubleshooting section for common issues

## What Just Happened?

Congratulations! You now have:
- A running Cloudflare Tunnel
- A secure connection to Cloudflare's network
- The ability to access your services through Cloudflare
- No open ports on your router or firewall
- Automatic SSL/HTTPS encryption

## Alternative Setup Methods

If Docker Compose doesn't work for you, there are other ways to run the tunnel:

### Using the Docker Run Script

```bash
chmod +x start-cloudflared-container.sh
export CLOUDFLARED_TOKEN=your-tunnel-token-here
./start-cloudflared-container.sh
```

### Running Directly (Without Docker)

```bash
chmod +x start-cloudflared.sh
export CLOUDFLARED_TOKEN=your-tunnel-token-here
./start-cloudflared.sh
```

*Note: These methods are less recommended for production use.*

## Next Steps

- Learn how to [configure](04-configuration.md) your tunnel for different services
- Check out [common tasks](05-common-tasks.md) for day-to-day management
- If something isn't working, see the [troubleshooting guide](06-troubleshooting.md)
