# 🚀 ClayModel Quick Start Guide

## What You're Setting Up
A Docker environment to run the `data_process.ipynb` notebook for satellite imagery processing.

## Prerequisites
- **OS**: Windows, macOS, or Linux
- **RAM**: 8GB+ (16GB recommended)
- **Storage**: 10GB free space
- **Internet**: Stable connection

## Exact Steps (15 minutes total)

### Step 1: Install Docker (5 minutes)
**Purpose**: Install Docker to run the ClayModel environment.

#### Windows:
1. Go to https://www.docker.com/products/docker-desktop
2. Download "Docker Desktop for Windows"
3. Run installer → Follow prompts → Restart computer
4. Start Docker Desktop from Start menu

#### macOS:
1. Go to https://www.docker.com/products/docker-desktop
2. Download "Docker Desktop for Mac"
3. Drag to Applications → Open Docker
4. Wait for whale icon in menu bar

#### Linux:
```bash
sudo apt-get update
sudo apt-get install -y docker.io docker-compose
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
# Log out and back in
```

### Step 2: Download ClayModel (2 minutes)
**Purpose**: Get the main ClayModel codebase.

```bash
git clone https://github.com/your-org/claymodel.git
cd claymodel/model
```

### Step 3: Get Docker Files (1 minute)
**Purpose**: Download the Docker configuration files.

```bash
git clone https://github.com/YashGupta3003/CLAY-DOCKERFILES.git
cp CLAY-DOCKERFILES/* .
chmod +x start_claymodel.sh
```

### Step 4: Start Environment (5 minutes)
**Purpose**: Build and start the Docker container with all dependencies.

```bash
./start_claymodel.sh
```

**What's happening**:
- Downloading Ubuntu + CUDA base image
- Installing Python 3.11 + conda
- Installing PyTorch, GeoPandas, Rasterio, etc.
- Starting Jupyter Lab server

**Expected output**:
```
🚀 Starting ClayModel...
Starting container...
✅ ClayModel is running!
🌐 Open: http://localhost:8888
📊 Open: data_process.ipynb
```

### Step 5: Open Jupyter (1 minute)
**Purpose**: Access the web interface.

1. Open browser → Go to `http://localhost:8888`
2. You'll see Jupyter Lab interface

### Step 6: Run Notebook (1 minute)
**Purpose**: Open and test the data processing notebook.

1. Click on `data_process.ipynb`
2. Click first cell → Press `Shift + Enter`
3. Should see no error messages
4. Go to `Kernel` → `Restart & Run All`

## Quick Commands Reference

```bash
# Start environment
./start_claymodel.sh

# Stop environment
docker-compose down

# Check status
docker-compose ps

# View logs
docker-compose logs claymodel-jupyter
```

## Quick Troubleshooting

### Port 8888 in use?
```bash
sudo lsof -i :8888
sudo kill -9 <PID>
./start_claymodel.sh
```

### Permission denied?
```bash
sudo usermod -aG docker $USER
# Log out and back in
./start_claymodel.sh
```

### Import errors?
```bash
docker-compose build --no-cache
./start_claymodel.sh
```

## Success Checklist
- [ ] Docker running
- [ ] Container started successfully
- [ ] Jupyter Lab opens at http://localhost:8888
- [ ] `data_process.ipynb` opens without errors
- [ ] First cell runs successfully
- [ ] All imports work (no red errors)

## What's Installed
- Python 3.11 + conda
- PyTorch 2.4.0 (CUDA support)
- GeoPandas, Rasterio, Stackstac
- Jupyter Lab + all ClayModel dependencies

## Next Steps
1. Follow notebook instructions
2. Process your satellite data
3. Save results to `data/` directory
4. Share with team

🎉 **You're ready to process satellite imagery!**
