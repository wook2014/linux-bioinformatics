# <p align="center">在服务器部署*code-server*</p>

vscode可以把它理解为一个次于专门的IDE，但有胜过简单文本编辑器的一个存在，而code-server则是其server版，类似于RStudio-server.
下面简单介绍一下如何在服务器中部署code-server

## 下载安装
```bash
# 如果有超级用户权限，最好还是去官网下载安装包，自己安装，不费事。

# 非root用户首选方法是去GitHub上下载压缩包自己编译


# 非root用户简单安装方法-- conda安装
conda search code-server

conda install -c conda-forge code-server

# 运行
code-server

# 会在家目录底下的.config文件夹内生成code-server文件夹，去里面改参数
第一行改为服务器地址和自己设定的端口
第三行

```















