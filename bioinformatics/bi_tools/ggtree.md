# ggtree 绘制进化树

# 基本流程
```R
# 加载R包
library("ggtree")
# 读取树文件（ggtree针对不同工具生成的树文件有不同的函数进行读取，如没有对应的函数，可以使用通用的办法读取）
tree <- read.tree("file.tree")
# 读取分组信息
group_file <- read.table("group_file.txt",header = T,row.names = 1)
# 按类分组
groupInfo <- split(row.names(group_file), group_file$Group)
# 将分组信息添加到树中
tree <- groupOTU(tree, groupInfo)
# 绘制进化树
ggtree(tree, layout="fan", ladderize = FALSE, branch.length = "none",aes(color=group)) + geom_tiplab2(size=3) + theme(legend.position = "right")
```



