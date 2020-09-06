# 常用的vim操作

# 代码快速注释与反注释
```vim
# 注释
:1,10s/^/#/g

# 反注释
:1,10s/^#//g
```
## 安装插件

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
编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行，保存退出当前的vim，重新打开vim，输入命令BundleClean

### 其他常用命令
+ 更新插件BundleUpdate
+ 列出所有插件BundleList
+ 查找插件BundleSearch










