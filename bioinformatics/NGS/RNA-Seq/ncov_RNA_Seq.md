# SARS-Cov-2 RNA-Seq

## 软件安装
```bash
conda install multiqc
conda install hisat2
conda insatll samtools
```

## 数据准备
+ R830: /data/share/jialj/NGS/ 
```bash
ln -s /data/share/jialj/NGS/WTA-20200516_L2_809501_R*.fastq.gz .
ln -s /data/share/jialj/NGS/Homo_sapiens.GRCh38.100.chr.gtf .
ln -s /data/share/jialj/NGS/Homo_sapiens.GRCh38.dna.primary_assembly.fa .
ln -s /data/share/jialj/NGS/WTA0*.fastq.gz .
cp "/data/share/jialj/NGS/ncov.gtf" .
cp "/data/share/jialj/NGS/NC_045512.2.fasta" ./ncov_RNA_Seq/
```

## 质控
```bash
nohup fastqc -t 8 -q WTA* -o ./ncov_qc/ &
mkdir qc_zip|mv *.zip ./qc_zip
mkdir qc_html|mv *.html ./qc_html
cd qc_zip/
multiqc *fastqc.zip --pdf
```

## mapping

### 建立index
```bash
# 用SARS-Cov-2参考基因组做index
mkdir ana_v | hisat2-build NC_045512.2.fasta ./ana_v/ncov
```

### mapping
```bash
# 根据index将reads比对到参考基因组，生成.sam文件
nohup hisat2 -p 10 -x ./ana_v/ncov -1 WTA0402A_R1_001.fastq.gz -2 WTA0402A_R2_001.fastq.gz -S ./ncov_sam/WTA0402A.sam &
```
### 格式转换及排序
```bash
nohup samtools view -bS WTA0402A.sam | samtools sort -@ 10 - WTA0402A.sorted &
# 或
# sam2bam
nohup samtools view -bS WTA0402A.sam > WTA0402A.bam &
# sort
nohup samtools sort -@ 10 -o SWTA0402A.sorted.bam WTA0402A.bam &
```

### flagstat
```bash
nohup samtools flagstat SWTA0402A.sorted.bam > SWTA0402A.bam.stat &
# 统计输入文件的相关数据并将这些数据输出至屏幕显示。每一项统计数据都由两部分组成，分别是QC pass和QC failed，表示通过QC的reads数据量和未通过QC的reads数量。

rm *sam
```
具体信息如下
```bash
head -100 SWTA0402A.bam.stat # 其实也没有100行\笑哭

206963130 + 0 in total (QC-passed reads + QC-failed reads)
0 + 0 secondary
0 + 0 supplementary
0 + 0 duplicates
2 + 0 mapped (0.00% : N/A)
206963130 + 0 paired in sequencing
103481565 + 0 read1
103481565 + 0 read2
2 + 0 properly paired (0.00% : N/A)
2 + 0 with itself and mate mapped
0 + 0 singletons (0.00% : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)

```
---

## counts定量
```bash
# 定量
featureCounts -T 20 -p -t exon -g gene_id -a *.gtf ${i}.sorted.bam -o ${i}.count

# 推荐这种方式哦
nohup featureCounts \
        -T 12 \
        -p \
        -t exon \
        -g gene_id \
        -a Homo_sapiens.GRCh38.100.chr.gtf \
        -o all_feature.txt \
        *.bam &

# -a 输入GTF/GFF基因组注释文件
# -p 这个参数是针对paired-end数据
# -F 指定-a注释文件的格式，默认是GTF
# -g 从注释文件中提取Meta-features信息用于read count，默认是gene_id
# -t 跟-g一样的意思，其是默认将exon作为一个feature
# -o 输出文件
# -T 多线程数

#如果想了解每个基因上的count数，则只需要提取出第1列和第7列的信息
cut -f 1,7 *.count |grep -v '^#' > *feacture.count
```




---
参考资料

1.[Hisat2+FeatureCounts+DESeq2流程+作图！](https://pzweuj.github.io/2018/07/18/rna-seq-4.html)

1.[用edgeR做差异分析](https://pzweuj.github.io/2018/08/09/edgeR.html)

1.[宏基因组，除去宿主序列](https://pzweuj.github.io/2019/01/28/remove-host.html)

1.[]()

1.[]()

1.[]()

