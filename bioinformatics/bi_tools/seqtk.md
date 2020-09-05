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
         comp      get the nucleotide composition of FASTA/Q
         sample    subsample sequences
         subseq    extract subsequences from FASTA/Q
         fqchk     fastq QC (base/quality summary)
         mergepe   interleave two PE FASTA/Q files
         trimfq    trim FASTQ using the Phred algorithm

         hety      regional heterozygosity
         gc        identify high- or low-GC regions
         mutfa     point mutate FASTA at specified positions
         mergefa   merge two FASTA/Q files
         famask    apply a X-coded FASTA to a source FASTA
         dropse    drop unpaired from interleaved PE FASTA/Q
         rename    rename sequence names
         randbase  choose a random base from hets
         cutN      cut sequence at long N
         listhet   extract the position of each het

```

### 实操
```bash
# 将FASTQ 转为 FASTA:
seqtk seq -a in.fq.gz > out.fa

# 随机抽取一定数量的序列
seqtk sample
Usage:   seqtk sample [-2] [-s seed=11] <in.fq> <frac>|<number>
Options: -s INT       RNG seed [11]
         -2           2-pass mode: twice as slow but with much reduced memory
# []中的是可选参数，<> 中的是必需参数。
# [-2] 内存较小的服务器上运行时，设置此参数。
# [-s] 随机数的种子。如果是 Pair-end 数据，需要保证 read1 和 read2 的种子一致，才能抽到相同的raeds。默认是 11。
# [in.fq] 输入文件

可以输入要抽取的比例或 reads 条数。
seqtk sample -s100 read1.fq 10000 > sub1.fq
```


















