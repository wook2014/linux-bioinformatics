# mimimap2基本操作

## 官方教程
```bash
minimap2 -d ref.mmi ref.fa                     # indexing
minimap2 -a ref.mmi reads.fq > alignment.sam   # alignment

```
建立索引后比对（节省每次建索引的时间）
```bash
minimap2 -d co92.min co92.fna
minimap2 -ax map-ont co92.min ../4.filter/clean.filtlong.fq.gz >s1037.sam
```

不建立索引比对
```bash
minimap2 -ax map-pb  ref.fa pacbio-reads.fq > aln.sam   # for PacBio subreads
minimap2 -ax map-ont ref.fa ont-reads.fq > aln.sam      # for Oxford Nanopore reads 
# 可以不建立索引吗
```

```bash
minimap2 -ax splice:hq -uf ref.fa iso-seq.fq > aln.sam       # PacBio Iso-seq/traditional cDNA
minimap2 -ax splice ref.fa nanopore-cdna.fa > aln.sam        # Nanopore 2D cDNA-seq
minimap2 -ax splice -uf -k14 ref.fa direct-rna.fq > aln.sam  # Nanopore Direct RNA-seq
minimap2 -ax splice --splice-flank=no SIRV.fa SIRV-seq.fa    # mapping against SIRV control
```
常用选项参数
主要分成五大类，索引（Indexing），回帖（Mapping），比对(Alignment),输入/输出（Input/Output）,预设值（Preset）。
+ -x ：非常中要的一个选项，软件预测的一些值，针对不同的数据选择不同的值
	+ map-pb/map-ont: pb或者ont数据与参考序列比对；
	+ ava-pb/ava-ont: 寻找pd数据或者ont数据之间的overlap关系；
	+ asm5/asm10/asm20: 拼接结果与参考序列进行比对，适合~0.1/1/5% 序列分歧度；
	+ splice: 长reads的切割比对
	+ sr: 短reads比对
+ -d :创建索引文件名
+ -a ：指定输出格式为sa格式，默认为PAF
+ -Q ：sam文件中不输出碱基质量
+ -R ：reads Group信息，与bwa比对中的-R一致
+ -t：线程数，默认为3

最终流程
```bash
# 建立参考转录组的mmi索引
minimap2 -t 10 -k 14 -d index.mmi ref.fa
# splice-mapping
for dir in monkey_*
do
minimap2 -ax splice -uf -N 32 -k 14 -t 20 index.mmi *.fastq | samtools view -bS > ~/sars_test/sars-cov-2/${dir}.bam; 
done
```



