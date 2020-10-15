# 基本操作之awk

## 基本介绍
Awk是一种小巧的编程语言及命令行工具。（其名称得自于它的创始人Alfred Aho、Peter Weinberger 和 Brian Kernighan姓氏的首个字母）。它非常适合服务器上的日志处理，主要是因为Awk可以对文件进行操作，通常以可读文本构建行。
![](https://img.linux.net.cn/data/attachment/album/201502/09/205716uph3b7dlvzgdpykc.jpg)

## 使用方法
```bash
# awk指令是由模式、动作，或者模式和动作的组合组成。
awk '{pattern + action}' {filenames}
```
![](https://mmbiz.qpic.cn/mmbiz_png/9aPYe0E1fb0VAiaysoCX4stsnE05XCdEwib06lOxoGAOW3U74cZjJAfE6tU1fK0MYLtZ5mO9TS3icMfZqib9TNgWdw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)
![](https://mmbiz.qpic.cn/mmbiz_png/9aPYe0E1fb0VAiaysoCX4stsnE05XCdEwMibpicGPZLWuULvT7IYU4QeZFVtkI15HYcnDLzHkYFgXrEsoibaEC1iaUg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

```
awk -F '^CCATGTACC$' { print NF, $1, $NF } file
```



计算多行数值求和
```bash
awk '{sum+=$1} END {print sum}' filename
```















