# 本地blast基本操作

```
blastn -db uniprot -query *.fasta -outfmt 11 -out "*_blastn@db_name" -num_threads 8
-query 输入文件名，也就是需要比对的序列文件
 -db 格式化后的数据库名称
 -evalue 设定输出结果中的e-value阈值
 -out 输出文件名
 -num_alignments 输出比对上的序列的最大值条目数
 -num_threads 线程数
 此外还有：
 -num_descriptions 对比对上序列的描述信息，一般跟tabular格式连用
 -outfmt      
  0 = pairwise,
  1 = query-anchored showing identities,
  2 = query-anchored no identities,
  3 = flat query-anchored, show identities,
  4 = flat query-anchored, no identities,
  5 = XML Blast output,
  6 = tabular,
  7 = tabular with comment lines,
  8 = Text ASN.1,
  9 = Binary ASN.1
  10 = Comma-separated values
```


