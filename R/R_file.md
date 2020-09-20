# R文件相关操作

## R操作CSV 文件
CSV（Comma-Separated Values，CSV，有时也称为字符分隔值，因为分隔字符也可以不是逗号） 是一种非常流行的表格存储文件格式，这种格式适合储存中型或小型数据规模的数据。由于大多数软件支持这个文件格式，所以常用于数据的储存与交互。

CSV 本质是文本，它的文件格式极度简单：数据一行一行的用文本保存起来而已，每条记录被分隔符分隔为字段，每条记录都有同样的字段序列。

+ 注意：包含非英文字符的文本要注意保存的编码，由于很多计算机普遍使用 UTF-8 编码，所以我是用 UTF-8 进行保存的。
+ 注意： CSV 文件最后一行需要保留一个空行，不然执行程序会有警告信息。

### 读取 CSV 文件
 read.csv() 函数来读取 CSV 文件的数据,read.csv() 函数返回的是数据框，我们可以很方便的对数据进行统计处理，以下实例我们查看行数和列数:
```R
# 如果不设置 encoding 属性，read.csv 函数将默认以操作系统默认的文字编码进行读取，如果你使用的是 Windows 中文版系统且没有设置过系统的默认编码，那系统的默认编码应该是 GBK。所以大家请尽可能地统一文字编码以防出错。
data <- read.csv("sites.csv", encoding="UTF-8")

id   name            url likes
1  1 Google www.google.com   111
2  2 Runoob www.runoob.com   222
3  3 Taobao www.taobao.com   333

print(is.data.frame(data))  # 查看是否是数据框
print(ncol(data))  # 列数
print(nrow(data))  # 行数

# likes 最大的数据
like <- max(data$likes)

# 指定查找条件，类似 SQL where 子句一样查询数据，需要用到到函数是 subset()。
# likes 为 222 的数据
# 注意：条件语句等于使用 ==
retval <- subset(data, likes == 222)

# 多个条件使用 & 分隔符，以下实例查找 likes 大于 1 name 为 Runoob 的数据：
retval <- subset(data, likes > 1 & name=="Runoob")
```

## 保存为 CSV 文件
```
# 写入新的文件
write.csv(retval,"runoob.csv",sep = ";")
```
























