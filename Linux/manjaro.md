# manjaro

4.换源

启动terminal，输入：

sudo pacman-mirrors -i -c China -m rank

在弹出的框中选一个最快的源，一个就好，选多了会降低速度

6.9更新，不建议使用archlinuxcn的源，因为并不一定兼容（而且已经有人遇到了问题

如果真的需要用（比如想安装mysql简单点），执行：

sudo nano /etc/pacman.conf

在末尾输入：

[archlinuxcn]
Server = http://mirrors.163.com/archlinux-cn/$arch

保存退出（Ctrl+X 输入y）接着更新系统

sudo pacman -Syyu

系统更新完毕

如果上一步添加了archlinuxcn的源：

sudo pacman -S archlinuxcn-keyring

5. 安装软件

Manjaro背靠Arch软件仓库，安装软件爽的yp，仓库又全又新，基本上遇不到依赖问题需要手动去搜该怎么安装，这也是我不愿意换回Ubuntu的一个重要原因

sudo pacman -S yay

yay是一个用Go语言写的一个AUR助手，有些时候官方仓库没有你想要的软件，就需要通过yay来安装

有了yay，以后就不用sudo pacman了

除了yay之外还有另外一个现在很流行的aur助手叫做paru（rust编写）

sudo pacman -S paru

paru相比于yay的优势在于可以用一行命令清除系统上所有不需要的包依赖项，此外在安装来在aur的包的时候会出现对应的PKGBUILD文件让你查看，具体用法可以在其github页面查看：
Morganamilo/paru​
github.com/Morganamilo/paru

5.1安装拼音输入法：

抛弃fcitx4，拥抱fcitx5吧，btw搜狗、百度、google输入法都是垃圾

安装fcitx5（输入法框架）

yay -S fcitx5-im

配置fcitx5的环境变量：

nano ~/.pam_environment

内容为：

GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
SDL_IM_MODULE DEFAULT=fcitx

安装fcitx5-rime（输入法引擎）

yay -S fcitx5-rime

安装rime-cloverpinyin（输入方案）

yay -S rime-cloverpinyin

如果出现问题可能还需要做下面这步：

yay -S base-devel





















