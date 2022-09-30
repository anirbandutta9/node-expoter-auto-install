#!/bin/bash
################################################################################
# Script02 for installing node exporter
# Author: Anirban Dutta
#-------------------------------------------------------------------------------



wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz

tar -xvf node_exporter-1.4.0.linux-amd64.tar.gz

mv node_exporter-1.4.0.linux-amd64 node_exporter


sudo cat <<EOF > /etc/systemd/system/node_exporter.service

[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/root/node_exporter/node_exporter

[Install]
WantedBy=multi-user.target


EOF

sudo systemctl daemon-reload

sudo systemctl enable node_exporter.service

sudo systemctl start node_exporter.service
