#!/bin/bash
# 最好先安装zsh并修改插件选项
# 如果家目录没有app文件夹
cd ~ && makdir app
cd ~/app

# 安装htop
wget -qO- wget http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz | tar xvz -C .
mkdir htop
cd htop-2.2.0/
./configure --prefix=$HOME/app/htop
make && make install
cd ~/app
rm -rf htop-2.2.0


# 安装axel
wget -c https://github.91chifun.workers.dev/https://github.com//axel-download-accelerator/axel/releases/download/v2.17.10/axel-2.17.10.tar.gz
x axel-2.17.10.tar.gz
mkdir axel
cd axel-2.17.10
./configure --prefix=$HOME/app/axel
make && make install
cd ~/app
rm -rf axel-2.17.10

# 安装ag
git clone https://hub.fastgit.org/ggreer/the_silver_searcher.git
mkdir ag
cd the_silver_searcher
./build.sh
./configure --prefix=$HOME/app/ag
make && make install
cd ~/app
rm -rf the_silver_searcher

# 安装duf
wget -c https://github.91chifun.workers.dev/https://github.com//muesli/duf/releases/download/v0.6.2/duf_0.6.2_linux_x86_64.tar.gz
x duf_0.6.2_linux_x86_64.tar.gz
mv duf_0.6.2_linux_x86_64 duf

# bat
wget -c https://github.91chifun.workers.dev/https://github.com//sharkdp/bat/releases/download/v0.18.0/bat-v0.18.0-i686-unknown-linux-gnu.tar.gz
x bat-v0.18.0-i686-unknown-linux-gnu.tar.gz
mv bat-v0.18.0-i686-unknown-linux-gnu bat

# 安装exa



