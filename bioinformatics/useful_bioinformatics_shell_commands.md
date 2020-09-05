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

* 从fasta或fastq文件中随机抽取一定数量的reads
    + [seqtk](https://github.com/xujunbi/linux-bioinformatics/blob/master/bioinformatics/bi_tools/seqtk.md)
```bash
# 安装seqtk
conda install seqtk

# 命令
$ seqtk sample
Usage:   seqtk sample [-2] [-s seed=11] <in.fq> <frac>|<number>
Options: -s INT       RNG seed [11]
         -2           2-pass mode: twice as slow but with much reduced memory
# []中的是可选参数，<> 中的是必需参数。
# [-2] 内存较小的服务器上运行时，设置此参数。
# [-s] 随机数的种子。如果是 Pair-end 数据，需要保证 read1 和 read2 的种子一致，才能抽到相同的raeds。默认是 11。
# [in.fq] 输入文件
# 可以输入要抽取的比例或 reads 条数。     
seqtk sample -s100 read1.fq 10000 > sub1.fq
```












