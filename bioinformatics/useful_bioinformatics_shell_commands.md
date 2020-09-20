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










