# Cutadapt对测序数据质控（去接头）

## 软件安装
```bash
conda install -c bioconda cutadapt
```

## 使用方法
```bash
cutadapt removes adapter sequences from high-throughput sequencing reads.

Usage:
    cutadapt -a ADAPTER [options] [-o output.fastq] input.fastq

For paired-end reads:
    cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq
```

## 常用参数
```bash
-g: #剪切reads 5'端adapter(双端测序第一条read)，加$表示adapter锚定在reads 5'端
-a: #剪切reads 3'端adapter(双端测序第一条read)，加$表示adapter锚定在reads3'端
-O MINLENGTH, --overlap=MINLENGTH #adapter与reads最小overlap,才算成功识别; Default: 3
-m LENGTH, --minimum-length=LENGTH: 根据最短长度筛选reads;Default: 0
--discard-untrimmed, --trimmed-only #丢掉不包含adapter的reads
 -e ERROR_RATE, --error-rate=ERROR_RATE  #adapter匹配允许的最大错配率（错配/匹配片段长度)；Default: 0.1
--no-trim: 不修剪adapter，直接输出满足跳进啊的reads
-u LENGTH, --cut=LENGTH:  #修剪reads 5'/3'端碱基,正数：从开始除移除碱基；负数：从末尾处移除碱基；
-q [5'CUTOFF,]3'CUTOFF, --quality-cutoff=[5'CUTOFF,]3'CUTOFF: #修剪低质量碱基
-l LENGTH, --length=LENGTH: #将reads修剪的最终长度
--trim-n: #修剪reads末端的'N'
-o FILE, --output=FILE: #输出文件
--info-file=FILE：每条reads和与reads匹配的adapter的信息
--too-short-output=FILE: #为reads长度最小值设定阈值筛选reads后，要丢弃的部分输出到文件；长度依据m值设定；   
--too-long-output=FILE：#为reads长度最大值设定阈值筛选reads后，要丢弃的部分输出到文件；长度依据M值设定； 
--untrimmed-output=FILE: #将没有adapter未做修剪的reads输出到一个文件;默认输出到trimmed reads结果文件
--max-n=COUNT：#reads中N的数量，设定整数或小数(N的占比)

双端测序参数
-A ADAPTER：  #第二条reads 3'adapter
-G ADAPTER：#第二条reads 5'adapter
-U LENGTH： #从第二条reads上修剪的长度
-p FILE, --paired-output=FILE： #第二条reads的输出结果
--untrimmed-paired-output=FILE：#第一条reads没有adapter时，将第二条reads输出到文件；默认输出到trimmed reads结果文件   

```

## 基本剪切类型
Cutadapt软件可以剪切多种类型的adapter，如下表所示：

![](http://cache1.bioon.com.cn/ewebeditor/fckup/2017/3/20170330175945958386.png)







