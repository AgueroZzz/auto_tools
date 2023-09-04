#!/bin/bash

# 提示用户输入eth0接口的地址
read -p "请输入eth0接口的IP地址（例如：192.168.1.100/24）： " eth0_address

# 提示用户输入eth1接口的地址，如果没有输入，则默认为127.0.0.1
read -p "请输入eth1接口的IP地址（默认为127.0.0.1，按 Enter 键跳过）： " eth1_address

# 如果用户没有输入eth1的地址，则将其设置为默认值
if [ -z "$eth1_address" ]; then
  eth1_address="127.0.0.1/24"
fi

# 定义要写入配置文件的内容
config_content="network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - $eth0_address
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
      optional: true
    eth1:
      dhcp4: no
      addresses:
        - $eth1_address
      optional: true
"

# 将配置内容写入文件
echo "$config_content" | sudo tee /etc/netplan/01-netcfg.yaml > /dev/null

# 应用配置更改
sudo netplan apply

# 重启网络服务
sudo systemctl restart systemd-networkd

# 重启网关
sudo reboot
