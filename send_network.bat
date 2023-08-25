@echo off

set gateway_ip=网关的IP地址
set gateway_user=用户名
set gateway_password=密码
set linux_script_path=/path/to/linux/script.sh

echo Copying script to gateway...
scp "%linux_script_path%" %gateway_user%@%gateway_ip%:C:\temp\

echo Running script on gateway...
ssh %gateway_user%@%gateway_ip% "bash /mnt/c/temp/script.sh %lan1_ip%"

echo Script execution completed.
