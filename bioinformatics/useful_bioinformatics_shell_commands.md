# 搜集一些常用的做生信shell命令

* 计算fasta文件里的序列条数
```bash
grep -c '^>' *.fasta
```

* 计算fasta文件里个序列长度的方法
```bash
# 单纯在命令行显示
awk '/^>/&&NR>1{print "";}{ printf "%s",/^>/ ? $0" ":$0 }' *.fa |awk '{print $1"\t"length($3)}'

# 将统计得到的数据存入文本 
awk '/^>/&&NR>1{print "";}{ printf "%s",/^>/ ? $0" ":$0 }' a.fa |awk '{print $1"\t"length($3)}' > count_sq_length.csv
```

* 随机选取文件的若干行(比如1000)
```bash
# 使用shuf 命令
shuf -n 1000 file1 > file2

# 使用sort 命令将文件随机排序，选择前100行
sort --random-sort file | head -n 100
sort -R file | head -5
```

+ 合并文件
```bash
cat file1.gz file2.gz file3.gz > allfiles.gz
```

+ 查看文件夹下文件的个数
```bash
# "^d"表示目录，"^-"表示文件

#查看当前目录下的文件数量（不包含子目录中的文件）
ls -l|grep "^-"| wc -l  

#查看当前目录下的文件数量（包含子目录中的文件） 注意：R，代表子目录
ls -lR|grep "^-"| wc -l

#查看当前目录下的文件夹目录个数（不包含子目录中的目录），同上述理，如果需要查看子目录的，加上R
ls -l|grep "^d"| wc -l
```







