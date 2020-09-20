# 基本操作之conda


```bash
# 下载
wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.07-Linux-x86_64.sh

# 安装
bash Anaconda3-2020.07-Linux-x86_64.sh

# 配置
echo export PATH=/home/xum/anaconda3/bin:$PATH >> .bashrc

# 设置镜像，同时添加bioconda仓库，涉及的配置文件为 ~/.condarc
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
conda config --set show_channel_urls yes

# 新建一个专用环境（环境名字自己选定即可）
# 其中 -n 代表 name，env_name 是需要创建的环境名称，list of packages 则是列出在新环境中需要安装的工具包。
conda create -n env_name  list of packages

# 激活该环境
source activate bx_exp

# 进行后续实验，实验结束后，退出环境：
source deactivate bx_exp

# 如果不需要这个环境了，可以删除该环境
conda env remove -n new_env

# 显示所有的环境：
conda env list

# 可以指定安装包的版本
conda install numpy=1.10

# 查看所有package
conda list

# 更新包
conda update pack_name

# 更新全部包
conda update --all

# 移除一个包
conda remove package_name
```



























