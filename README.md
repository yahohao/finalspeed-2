# Finalspeed 1.2
Finalspeed 1.2
服务器TCP双边加速软件可达到90%的物理带宽利用率


安装脚本：

rm -f install_fs.sh
wget https://raw.githubusercontent.com/yahohao/finalspeed-2/master/install_fs.sh
chmod +x install_fs.sh
./install_fs.sh 2>&1 | tee install.log

FinalSpeed Setup

一. 开放端口

service iptables start

iptables -A INPUT -p tcp --dport 你的vps端口号 -j ACCEPT

iptables -A OUTPUT -p tcp --sport 你的vps端口号 -j ACCEPT

service iptables save

二. 安装命令:

rm -f install_fs.sh

wget https://raw.githubusercontent.com/yahohao/finalspeed-2/master/install_fs.sh

chmod +x install_fs.sh

./install_fs.sh 2>&1 | tee install.log

三. 常用命令使用说明

更新：执行一键安装会自动完成更新。

卸载： sh /fs/stop.sh ; rm -rf /fs

启动： sh /fs/start.sh

停止： sh /fs/stop.sh

重新启动： sh /fs/restart.sh

运行日志： tail -f /fs/server.log

Finalspeed_autorestart
-----------------------------------------------------------------------
在无人使用时自动重启finalspeed 也许可以一定程度上减少断流情况

min_time 和 max_time 指定重启的最小和最大间隔

使用时 下载脚本到本地 并添加cron任务

echo "*/20 * * * * root /path/to/fs_restart.sh" >> /etc/crontab
