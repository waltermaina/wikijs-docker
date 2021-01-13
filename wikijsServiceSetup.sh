#!/bin/bash
#-------------------------------------------------------------------------------
#   Copyright (c) DOIDO Technologies
#
#   Author   : waltermaina76@gmail.com
#   Version  : 1.0.0
#   Location : github
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# This script is used to create docker-compose and wikijs service
# systemd is used.
#-------------------------------------------------------------------------------

# Get current working directory
cwd=$(pwd)

# Create A Unit File
sudo echo "[Unit]
Description=Docker Compose WIKIJS Service
Requires=docker.service
After=docker.service network.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$cwd
ExecStart=/usr/local/bin/docker-compose up -d
ExecStop=/usr/local/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/Wikijs.service

# The permission on the unit file needs to be set to 644
sudo chmod 644 /lib/systemd/system/Wikijs.service

# Configure systemd
#sudo systemctl daemon-reload
sudo systemctl enable Wikijs.service

# Start the service
#sudo systemctl start Wikijs.service
echo "Done Creating Wikijs Service."

