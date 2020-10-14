# Trimmomatic

## 软件介绍

trimmomatic是一款用来处理illumina测序数据的工具，可以是单条的single reads，也可以是成对的pairend reads。支持压缩格式数据。功能和其他数据处理的程序都差不多，主要包括，  
1、去除adapter序列以及测序中其他特殊序列；  
2、采用滑动窗口的方法，切除或者删除低质量碱基；  
3、去除头部低质量以及N碱基过多的reads；   
4、去除尾部低质量以及N碱基过多的reads；    
5、截取固定长度的reads；  
6、丢掉小于一定长度的reads；  
7、Phred 质量值转换  

## 软件使用
```bash
   >>$ trimmomatic
Usage:
       PE [-version] [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-summary <statsSummaryFile>] [-quiet] [-validatePairs] [-basein <inputBase> | <inputFile1> <inputFile2>] [-baseout <outputBase> | <outputFile1P> <outputFile1U> <outputFile2P> <outputFile2U>] <trimmer1>...
   or:
       SE [-version] [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-summary <statsSummaryFile>] [-quiet] <inputFile> <outputFile> <trimmer1>...
   or:
       -version

```


## 参数
```bash
PE/SE
    设定对Paired-End或Single-End的reads进行处理，其输入和输出参数稍有不一样。
-threads
    设置多线程运行数
-phred33
    设置碱基的质量格式，可选pred64
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10
    切除adapter序列。参数后面分别接adapter序列的fasta文件：允许的最大mismatch
数：palindrome模式下匹配碱基数阈值：simple模式下的匹配碱基数阈值。
LEADING:3
    切除首端碱基质量小于3的碱基
TRAILING:3
    切除尾端碱基质量小于3的碱基
SLIDINGWINDOW:4:15
    Perform a sliding window trimming。Windows的size是4个碱基，其平均碱基
质量小于15，则切除。
MINLEN:50
    最小的reads长度
CROP:<length>
    保留reads到指定的长度
HEADCROP:<length>
    在reads的首端切除指定的长度
TOPHRED33
    将碱基质量转换为pred33格式
TOPHRED64
    将碱基质量转换为pred64格式
```

## 使用案例
```bash
# single情况
java -jar trimmomatic-0.35.jar SE -phred33 input.fq.gz output.fq.gz

# pair-end情况
java -jar trimmomatic-0.35.jar PE -phred33 input_forward.fq.gz input_reverse.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
```


