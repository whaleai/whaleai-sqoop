# whaleai-hadoop  

## 提供hadoop自动化部署方案,WhaleAI专注人工智能/大数据
##  **♡[Fork](https://github.com/wangxiaoleiAI/whaleai-sqoop)** **☆[Star](https://github.com/wangxiaoleiAI/whaleai-sqoop)**

##  MORE ?   **[whaleai](https://github.com/wangxiaoleiAI/whaleai-sqoop)**

## Installation

1.下载sqoop安装源码
```
git clone https://github.com/wangxiaoleiAI/whaleai-sqoop.git
```
2.下载sqoop2压缩文件并放置在目录中，修改whaleai-sqoop中```SQOOP_VERSION```字段（默认1.99.7-bin-hadoop200）;

3.安装，执行脚本 . whaleai-sqoop.sh -i ;
  验证，是否成功输入```jps``` 如下SqoopJettyServer，即安装启动成功。

```
xiaolei@wang:~/Projects/whaleai/whaleai-sqoop$ jps
3984 Jps
3925 SqoopJettyServer
```
## Document
- Debian/ubuntu 16.04  17.04
- hadoop2 版本　hadoop-2.7.3 hadoop-2.8.0 稳定支持
- hadoop3 alpha 不稳定支持
- Sqoop2


USAGE:  ```. whaleai-sqoop.sh [options]```

OPTIONS:
```
  -i, --install　        伪分布式安装部署hadoop3

  -r, --remove           卸载hadoop3

  -h, --help             Show this message.
```
## EXAMPLES:
- sqoop2 install:

```
. whaleai-sqoop.sh -i　

. whaleai-sqoop.sh --install
```


- sqoop2 remove:

```
. whaleai-sqoop.sh -r
. whaleai-sqoop.sh --remove
```
