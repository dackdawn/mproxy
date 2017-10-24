#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "==============================="
echo "       一键搭nginx+mproxy       "
echo "        3 秒后将自动开始  "
echo "         By:蜡笔小新     "
echo "==妖火网==：yaohuo.me"
echo " "
echo "==============================="
sleep 3.5
yum install tar
yum install -y gcc gcc-c++ readline-devel pcre-devel openssl-devel tcl perl
sleep 0.2
cd /etc
wget https://raw.githubusercontent.com/dackdawn/mproxy/master/nginx
mv nginx .nginx
wget https://raw.githubusercontent.com/dackdawn/mproxy/master/nginx.conf
sleep 0.2
cd
sleep 0.2
wget https://raw.githubusercontent.com/dackdawn/mproxy/master/nginx-1.9.9.tar.gz
tar zxvf nginx-1.9.9.tar.gz
cd nginx-1.9.9
./configure
make && make install
echo "    "
echo "          开始配置启动服务...."
echo "    "
sleep 2
cp -f /etc/.nginx /etc/rc.d/init.d/nginx
chmod 775 /etc/rc.d/init.d/nginx
chkconfig  --level 012345 nginx on
service nginx start
echo "    "
echo "          开始配置nginx文件...."
echo "    "
sleep 2
rm -f /usr/local/nginx/conf/nginx.conf
sleep 0.2
cp -f /etc/nginx.conf /usr/local/nginx/conf/
service nginx restart
sleep 2
cd
wget https://raw.githubusercontent.com/dackdawn/mproxy/master/mproxy
mv mproxy .mproxy
sleep 0.5
mv .mproxy mproxy
chmod 777 mproxy
sleep 0.5
./mproxy -l 8080 -d
echo "  "
echo "          出现三个OK 则搭建成功！！！"
echo "  "
sleep 2
rm -f nginx-1.9.9.tar.gz
rm -f /etc/.nginx
rm -f /etc/nginx.conf
rm -f ngmproxy.sh
