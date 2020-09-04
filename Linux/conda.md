# conda的基本操作


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
```



























