#! /bin/bash
# Author:wangxiaolei 王小雷
# Blog: http://blog.csdn.net/dream_an
# Github: https://github.com/wangxiaoleiai
# Date: 201707
# Organization: https://github.com/whaleai

SQOOP_VERSION=1.99.7-bin-hadoop200
SQOOP_HOME=/opt/sqoop-$SQOOP_VERSION
install()
{
begin_time=$(date +%s)
source whaleai-config.sh
source /etc/profile
if [[ ! -f sqoop-$SQOOP_VERSION.tar.gz ]]; then
  echo "目标文件不存在,请将　sqoop-$SQOOP_VERSION.tar.gz　下载并放置本文件中
5 秒后自动退出......"
  sleep 5
  exit 0
fi

if [[  -d $SQOOP_HOME ]]; then
  #statements
  echo "需要移除sqoop残余文件
请执行 . whaleai-sqoop.sh -r
8　秒后自动退出
"
  sleep 8
  exit 0

fi

if [[ ! -d $HADOOP_HOME ]]; then
  #statements
  echo "请先正确部署hadoop
推荐: https://github.com/whaleai/whaleai-hadoop
再执行 . whaleai-sqoop.sh -r
8　秒后自动退出
"
  sleep 8
  exit 0

fi

#解压
echo "sqoop-$SQOOP_VERSION　伪分布式正在自动安装部署...
"
tar -zxf sqoop-$SQOOP_VERSION.tar.gz
echo "
sqoop-$SQOOP_VERSION　>>解压完成
"
sudo mv  sqoop-$SQOOP_VERSION /opt/
#配置sqoop的配置文件
user=`whoami`
sed -i "s|/etc/hadoop/conf/|$HADOOP_HOME/etc/hadoop|" $SQOOP_HOME/conf/sqoop.properties
put_config --file $HADOOP_HOME/etc/hadoop/mapred-site.xml --property mapreduce.jobhistory.address --value "localhost:10020"
put_config --file $HADOOP_HOME/etc/hadoop/core-site.xml --property hadoop.proxyuser.$user.hosts --value "*"
put_config --file $HADOOP_HOME/etc/hadoop/core-site.xml --property hadoop.proxyuser.$user.groups --value "*"

echo "
sqoop-$SQOOP_VERSION　>>xml文件配置完成
"
#创建变量文件
echo "${Author} ${SqoopEnv}">sqoop-$SQOOP_VERSION.sh
sudo mv  sqoop-$SQOOP_VERSION.sh /etc/profile.d
source /etc/profile
cd $SQOOP_HOME
echo "
sqoop-$SQOOP_VERSION　>>变量配置完成
 "
echo "
sqoop-$SQOOP_VERSION　>> 元数据库初始中...
"
sqoop2-tool upgrade
echo "
sqoop-$SQOOP_VERSION　>> 初始完成
"
sqoop2-tool verify
echo "
sqoop-$SQOOP_VERSION　>> 验证成功
 "

sqoop2-server start
cd -
echo "sqoop-$SQOOP_VERSION　>>服务启动完成"

echo "sqoop-$SQOOP_VERSION　>>开启成功...服务已经启动...

sqoop2-server stop

sqoop2-shell

耗时 : $(($(date +%s) - $begin_time)) S

"

#
}

remove()
{
echo "sqoop-$SQOOP_VERSION　正在卸载..."
cd $SQOOP_HOME

sqoop2-server stop
cd -
sudo rm -rf $SQOOP_HOME
sudo rm -rf /tmp/sqoop*

sudo rm -rf /etc/profile.d/sqoop-$SQOOP_VERSION.sh

source /etc/profile
echo "sqoop-$SQOOP_VERSION　卸载完成

使用　. whaleai-sqoop -i　进行安装
"
}

help()
{
cat << EOF
已支持版本　sqoop-1.3.1
This script installs sqoop  with basic data, log, and pid directories.

USAGE:  . whaleai-sqoop/whaleai-sqoop.sh [options]
OPTIONS:
   -i, --install　        伪分布式安装部署sqoop

   -r, --remove           卸载sqoop

   -h, --help             Show this message.

EXAMPLES:
sqoop2 install:

  . whaleai-sqoop.sh -i　
  . whaleai-sqoop.sh --install

sqoop2 remove:

  . whaleai-sqoop.sh -r
  . whaleai-sqoop.sh --remove

EOF
}

while true;

do
  case "$1" in

    -i|--install)
      install
			break
      ;;
    -r|--remove)
      remove
			break
      ;;
    *)
			help
      break
      ;;
  esac
done
