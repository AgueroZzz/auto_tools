#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <lan1_ip>"
    exit 1
fi

lan1_ip="$1"

# 修改LAN1口的IP地址
sudo ifconfig lan1 "$lan1_ip" netmask 255.255.255.0

# 配置LAN2口为127.0.0.1
sudo ifconfig lan2 127.0.0.1 netmask 255.0.0.0
