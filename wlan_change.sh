#!/bin/bash

# 获取传入的lan1 IP地址
lan1_ip=$1 

lan2_ip=$2
# 配置lan1 IP地址 
sudo ifconfig eth0 $lan1_ip

sudo inconfig eth1 $lan2_ip

# 打印lan1 IP地址信息
ifconfig eth0 | grep 'inet addr'

# 打印lan2 IP地址信息
ifconfig eth1 | grep 'inet addr'
