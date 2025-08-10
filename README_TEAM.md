# ClayModel Setup Guide for Team

## What This Does
This setup creates a Docker container with all ClayModel dependencies pre-installed, so you can run the `data_process.ipynb` notebook without any import errors.

## Prerequisites
- **Operating System**: Windows, macOS, or Linux
- **RAM**: At least 8GB (16GB recommended)
- **Storage**: 10GB free space
- **Internet**: Stable connection for downloading

## Step-by-Step Setup

### Step 1: Install Docker
**What this does**: Installs Docker to run the ClayModel environment in a container.

#### For Windows:
1. Go to https://www.docker.com/products/docker-desktop
2. Download "Docker Desktop for Windows"
3. Run the installer and follow the prompts
4. Restart your computer when prompted
5. Start Docker Desktop from the Start menu

#### For macOS:
1. Go to https://www.docker.com/products/docker-desktop
2. Download "Docker Desktop for Mac"
3. Drag Docker to Applications folder
4. Open Docker from Applications
5. Wait for Docker to start (whale icon in menu bar)

#### For Linux (Ubuntu/Debian):
```bash
# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io docker-compose

# Add your user to docker group
sudo usermod -aG docker $USER

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Log out and log back in for group changes to take effect
```

### Step 2: Clone the ClayModel Repository
**What this does**: Downloads the main ClayModel codebase to your computer.

```bash
# Clone the main ClayModel repository
git clone https://github.com/your-org/claymodel.git

# Navigate to the model directory
cd claymodel/model
```

### Step 3: Download Essential Docker Files
**What this does**: Downloads the Docker configuration files that will create the environment.

```bash
# Clone the Docker files repository
git clone https://github.com/YashGupta3003/CLAY-DOCKERFILES.git

# Copy the Docker files to the current directory
cp CLAY-DOCKERFILES/* .

# Make the startup script executable
chmod +x start_claymodel.sh
```

### Step 4: Start the ClayModel Environment
**What this does**: Builds and starts a Docker container with all ClayModel dependencies installed.

```bash
# Run the startup script
./start_claymodel.sh
```

**What happens during this step**:
- Docker downloads the base image (Ubuntu with CUDA)
- Installs Python 3.11 and conda
- Creates a conda environment with all dependencies
- Installs PyTorch, GeoPandas, Rasterio, and other packages
- Starts Jupyter Lab server

**Expected output**:
```
🚀 Starting ClayModel...
Starting container...
✅ ClayModel is running!
🌐 Open: http://localhost:8888
📊 Open: data_process.ipynb
```

### Step 5: Access Jupyter Lab
**What this does**: Opens the web interface where you can run the notebook.

1. Open your web browser
2. Go to: `http://localhost:8888`
3. You should see the Jupyter Lab interface

### Step 6: Open and Run the Notebook
**What this does**: Opens the data processing notebook and runs it.

1. In Jupyter Lab, navigate to `data_process.ipynb`
2. Click on the notebook to open it
3. Run the first cell to test imports:
   - Click on the first cell
   - Press `Shift + Enter` to run it
   - You should see no error messages

4. Run the entire notebook:
   - Go to `Kernel` → `Restart & Run All`
   - Wait for all cells to complete

## Troubleshooting

### Port 8888 Already in Use
```bash
# Find what's using the port
sudo lsof -i :8888

# Kill the process (replace <PID> with the actual process ID)
sudo kill -9 <PID>

# Try starting again
./start_claymodel.sh
```

### Docker Permission Error
```bash
# Add user to docker group (Linux only)
sudo usermod -aG docker $USER

# Log out and log back in, then try again
./start_claymodel.sh
```

### Import Errors in Notebook
```bash
# Rebuild the Docker container
docker-compose build --no-cache

# Start again
./start_claymodel.sh
```

## Useful Commands

```bash
# Check if container is running
docker-compose ps

# Stop the container
docker-compose down

# View container logs
docker-compose logs claymodel-jupyter

# Restart container
docker-compose restart claymodel-jupyter
```

## Success Checklist
- [ ] Docker Desktop is running
- [ ] Container starts without errors
- [ ] Jupyter Lab opens at http://localhost:8888
- [ ] `data_process.ipynb` opens without errors
- [ ] First cell runs successfully
- [ ] All imports work (no red error messages)

## What's Installed in the Container
- **Python 3.11** with conda environment
- **PyTorch 2.4.0** with CUDA support
- **GeoPandas** for geospatial data
- **Rasterio** for raster data handling
- **Stackstac** for satellite data
- **Jupyter Lab** for notebook interface
- **All ClayModel dependencies**

## Next Steps
Once the notebook is running successfully:
1. Follow the notebook instructions for data processing
2. Save your processed data to the `data/` directory
3. Share results with your team

🎉 **You're ready to process satellite imagery with ClayModel!**
