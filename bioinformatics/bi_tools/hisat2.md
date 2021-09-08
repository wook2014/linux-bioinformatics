# <p align='center'>hisat2基本操作</p>


## 软件安装
```bash
mamba search hisat2

mamba install -c bioconda hisat2
```


## 基本使用

```bash
# 建索引
hisat2-build –p 18 genome.fa genome.index

# 比对
hisat2 -x genome.index -1 R_1.fq.gz -2 R_2.fq.gz | samtools sort -O bam -@ 14 -o - > *.bam 

```











