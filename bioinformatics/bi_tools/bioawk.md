# <center>bioawk基本操作</center>

BioAwk是Heng Li的得意之作之一。其创作的背景是在经历一系列的网上讨论之后，人们抱怨没有生物信息学专门使用的'awk'，他决定采用awk的来源并修改它，以添加以下功能：

将FASTA / FASTQ文件看作单行来处理
为已知数据格式添加了新的内部变量。
添加了许多与生物信息学相关的功能，例如revcomp，以产生反向互补序列。

```bash
bioawk -c help
#屏幕会打印出
bed:
    1:chrom 2:start 3:end 4:name 5:score 6:strand 7:thickstart 8:thickend 9:rgb 10:blockcount 11:blocksizes 12:blockstarts 
sam:
    1:qname 2:flag 3:rname 4:pos 5:mapq 6:cigar 7:rnext 8:pnext 9:tlen 10:seq 11:qual 
vcf:
    1:chrom 2:pos 3:id 4:ref 5:alt 6:qual 7:filter 8:info 
gff:
    1:seqname 2:source 3:feature 4:start 5:end 6:score 7:filter 8:strand 9:group 10:attribute 
fastx:
    1:name 2:seq 3:qual 4:comment
```

简单看看它支持的option：
```
usage: bioawk [-F fs] [-v var=value] [-c fmt] [-tH] [-f progfile | 'prog'] [file ...]
-F： 输入记录列和列之间的分隔符，和awk相同
-t将输入输出的分隔符设置为tab
-c 设置输入文件或想解析的文件的格式
-v 设置自定义的变量
-H 保留输出结果的header（例如sam file）
然后所有awk的option都可以在bioawk中使用
```
## 实例

### 处理FASTA文件 
一旦读取输入文件，FASTA的序列的标头将会存储为$name变量，序列将会是$seq变量。
```bash
# 截取每一段序列的长度：
bioawk -c fastx '{ print $name, length($seq) }' input.fasta

# 测量fasta序列文件中gc含量：
bioawk -c fastx '{ print $name, gc($seq) }' input.fasta

# 获取所有序列的反向互补链序列：
bioawk -c fastx '{ print ">"$name;print revcomp($seq) }' input.fasta

# 在一个包含有多序列的fasta文件中，提取出长度大于100bp的序列（这个功能我用最多）：
bioawk -c fastx 'length($seq) > 100{ print ">"$name; print $seq }'  input.fasta

# 修改序列ID，增加前缀或者后缀：
bioawk -c fastx '{ print ">PREFIX"$name; $seq }' input.fasta
bioawk -c fastx '{ print ">"$name"|SUFFIX"; $seq }' input.fasta

# 基于另一个含有fasta id的文件，提取其所对应的序列(这个也很常用）：
# for large scale use cdbyank instead
bioawk -cfastx 'BEGIN{while((getline k <"IDs.txt")>0)i[k]=1}{if(i[$name])print ">"$name"\n"$seq}' input.fasta

# 轉換fasta成tabular的格式
bioawk -t -c fastx '{ print $name, $seq }' input.fasta

# 選取特定id的序列
bioawk -cfastx 'BEGIN{while((getline k <"IDs.txt")>0)i[k]=1}{if(i[$name])print ">"$name"\n"$seq}' input.fasta
```

### 处理fastq文件
处理fastq文件是 bioawk输入依然是-c fastx，它会自动识别你是fastq还是fasta格式，然后找出其对应的$name $seq $qual $comment变量，很好很强大，有没有。
```bash
# 计算fastq序列的行数：
bioawk -t -c fastx 'END {print NR}' input.fastq
#当bioawk探测出来你这是fastq文件后，它会将总行数算出来然后除去4，找到相应的序列行数。

# 将fastq格式转为fasta格式：
bioawk -c fastx '{print ">"$name; print $seq}' input.fastq

#计算fastq中碱基的平均质量分数：
bioawk -c fastx '{print ">"$name; print meanqual($qual)}' input.fastq

# 过滤掉短于10bp的reads（快速简单过滤fastq文件的好办法）：
bioawk -cfastx 'length($seq) > 10 {print "@"$name"\n"$seq"\n+\n"$qual}' input.fastq
```

### 处理BED file
```bash
# 计算bed file中，所对应feature的长度，例如基因的长度:
bioawk -c bed '{ print $end - $start }' test.bed
```

### 处理SAM file
```bash
# 提取出比对不上的reads.
bioawk -c sam 'and($flag,4)' input.sam

# 提取比对得上的reads：
bioawk -c sam -H '!and($flag,4)' input.sam

# 基于sam file，创建fasta文件：
bioawk -c sam '{ s=$seq; if(and($flag, 16)) {s=revcomp($seq) } print ">"$qname"\n"s}' input.sam > output.fasta
```

### 处理VCF文件
```bash
# 输出你想要那组samples（这里是foo和bar）所对应的基因型：
grep -v "^##" in.vcf | bioawk -tc hdr '{print $foo,$bar}'
```



[生信小工具：awk的升级版bioawk](https://www.jianshu.com/p/e4765b44783a)
