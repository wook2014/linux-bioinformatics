# SARS-Cov-2 RNA-Seq

## 软件安装
```bash
conda install multiqc

conda install hisat2

conda insatll samtools

```

## 数据准备

```bash
ln -s /data/share/jialj/NGS/WTA-20200516_L2_809501_R*.fastq.gz .
ln -s /data/share/jialj/NGS/Homo_sapiens.GRCh38.100.chr.gtf .
ln -s /data/share/jialj/NGS/Homo_sapiens.GRCh38.dna.primary_assembly.fa .
ln -s /data/share/jialj/NGS/WTA0*.fastq.gz .
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
mkdir ana_v | hisat2-build NC_045512.2.fasta ./ana_v/ncov
```

### mapping
```bash
nohup hisat2 -p 10 -x ./ana_v/ncov -1 WTA0402A_R1_001.fastq.gz -2 WTA0402A_R2_001.fastq.gz -S ./ncov_sam/WTA0402A.sam &
```
### 排序及格式转换
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
rm *sam
```

## counts
```bash
featureCounts -T 20 -p -t GTF第三列 -g GTF第9列 -a GTF文件 ${i}.sorted.bam -o ${i}.counts
# 命令待改
```



