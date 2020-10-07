# 常用的vim操作

## 代码快速注释与反注释
```vim
# 注释
:1,10s/^/#/g

# 反注释
:1,10s/^#//g
```
## 基本配置
"显示行号
set number

"语法高亮
syntax on

"在底部显示，当前处于命令模式还是插入模式
set showmode

"支持使用鼠标
set mouse=a

"使用 utf-8 编码
set encoding=utf-8  

"按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

"在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4

"光标所在的当前行高亮
set cursorline

"设置行宽，即一行显示多少个字符
set textwidth=80

"在状态栏显示光标的当前位置（位于哪一行哪一列）
set  ruler

"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

"搜索时，高亮显示匹配结果
set hlsearch

"输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

"不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
set nobackup

"不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
set noswapfile

"出错时，发出视觉提示，通常是屏幕闪烁
set visualbell


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


## .vimrc
```vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin

```


