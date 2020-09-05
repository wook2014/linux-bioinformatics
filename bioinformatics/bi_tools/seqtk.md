# seqtk的使用

## 介绍
seqtk在生信届被誉为序列处理的瑞士军刀，其出自生信大神李恒之手，李恒是SAMtools、BWA、MAQ等著名生信软件的核心作者。seqtk基于C语言编写的软件，运行速度极快，极大的提高工作效率。seqtk日常序列的处理包括，比如：fq转换为fa，格式化序列，截取序列，随机抽取序列等。

## 安装
```bash
conda install seqtk
```

## 具体使用

### 指南
```bash
$ seqtk
Usage:   seqtk <command> <arguments>
Version: 1.3-r106

Command: seq       common transformation of FASTA/Q
         comp      get the nucleotide composition of FASTA/Q   # 获取fa的碱基的组成信息，用-r参数可以输出bed中的给定区间的序列
         sample    subsample sequences       # 随机抽取序列
         subseq    extract subsequences from FASTA/Q  # 提取name.list中指定名称的fa序列
         fqchk     fastq QC (base/quality summary) # 获取每个碱基点的分布和质量值，和fastqc质控类似，不过这里生成的是数据，而fastqc生成质控报告
         mergepe   interleave two PE FASTA/Q files # 交叉合并双端测序的序列，pe就是pair end的意思
         trimfq    trim FASTQ using the Phred algorithm

         hety      regional heterozygosity   # 区域性杂合
         gc        identify high- or low-GC regions   # 识别高低gc区域
         mutfa     point mutate FASTA at specified positions   #给定in.snp特定位置指出fa的突变
         mergefa   merge two FASTA/Q files   # 合并fastq或者fasta文件
         famask    apply a X-coded FASTA to a source FASTA     # 将X编码的fa应用到原fa
         dropse    drop unpaired from interleaved PE FASTA/Q   # 从交叉合并的fa/fq中丢弃不成对的序列
         rename    rename sequence names     # 序列重命名
         randbase  choose a random base from hets     # 从hets中随机选一个碱基
         cutN      cut sequence at long N    # 在N长度处切掉序列
         listhet   extract the position of each het   # 提取每一个het位置 

```

### 实操

```bash
# 将FASTQ 转为 FASTA:
seqtk seq -a in.fq.gz > out.fa

# 将fastq序列做反向互补分析
seqtk seq -r in.fq.gz > out.fq

# 随机抽取一定数量的序列
seqtk sample
Usage:   seqtk sample [-2] [-s seed=11] <in.fq> <frac>|<number>
Options: -s INT       RNG seed [11]
         -2           2-pass mode: twice as slow but with much reduced memory
# []中的是可选参数，<> 中的是必需参数。
# [-2] 内存较小的服务器上运行时，设置此参数。
# [-s] 随机数的种子。如果是 Pair-end 数据，需要保证 read1 和 read2 的种子一致，才能抽到相同的raeds。默认是 11。
# [in.fq] 输入文件
可直接对压缩文件进行序列随机提取
可以输入要抽取的比例或 reads 条数。
seqtk sample -s100 read1.fq 10000 > sub1.fq

# 截取序列
切除reads的前5bp，以及后10bp：
seqtk trimfq -b 5 -e 10 in.fq > out.fq

# 根据bed文件信息，将固定区域序列提取出来
seqtk subseq in.fa reg.bed > out.fa











```


















