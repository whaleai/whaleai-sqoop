# whaleai-sqoop
> ## 提供sqoop自动化部署方案　WhaleAI 专注人工智能/大数据　


 > 已支持版本 sqoop2

 This script installs sqoop  with basic data, log, and pid directories.

 > USAGE: ``` . whaleai-sqoop.sh [options]```

 ```
 OPTIONS:
    -i, --install　        伪分布式安装部署sqoop

    -r, --remove           卸载sqoop

    -h, --help             Show this message.
 ```

 EXAMPLES:
   如何安装？sqoop install:
 ```
 		 . whaleai-sqoop.sh -i　

 		 Or . install-sqoop.sh --install
 ```
   如何卸载？sqoop remove:

 ```
 		 . whaleai-sqoop.sh -r

 		 Or . install-sqoop.sh --remove
 ```
