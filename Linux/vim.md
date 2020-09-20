# 常用的vim操作

## 代码快速注释与反注释
```vim
# 注释
:1,10s/^/#/g

# 反注释
:1,10s/^#//g
```
## 安装插件
### 一般操作步骤
```bash
# 安装vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 修改.vimrc文件
vim ~/.vimrc
Plugin 'VundleVim/Vundle.vim'

# 命令行安装插件
vim +PluginInstall +qall
```
### 移除不需要的插件
+ 编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行，
+ 保存退出当前的vim，
+ 重新打开vim，输入命令BundleClean

### 其他常用命令
+ 更新插件BundleUpdate
+ 列出所有插件BundleList
+ 查找插件BundleSearch


## vim主题更改
Vi/Vim手工自行安装配色方案的主要步骤包括：

1. 确认当前用户目录下存在~/.vim/colors目录，没有则新建，安装的Vim配色方案对应.vim文件需放在该目录下
2. 下载或编辑某个配色方案的.vim文件，保存到~/.vim/colors目录下
3. 修改Vim配置文件~/.vimrc，增加配置项colorscheme molokai并保存 (假设下载了一个叫molokai的配色方案文件molokai.vim)
```bash
git clone https://github.com/morhetz/gruvbox
```







