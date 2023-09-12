#!/bin/bash

sudo apt-get update

sudo apt install python3-pip

pip3 install django==3.2.13 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

pip3 show django
