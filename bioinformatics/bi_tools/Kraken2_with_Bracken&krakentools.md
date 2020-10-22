# <center>Kraken2、Bracken和krakentools基本操作</center>

## 软件的安装
```bash
# 首选当然是conda
conda install -c bioconda kraken2
conda install -c bioconda krakentools
conda install -c bioconda bracken
```

## kraken2
```bash
   >>$ kraken2
Need to specify input filenames!
Usage: kraken2 [options] <filename(s)>

Options:
  --db NAME               Name for Kraken 2 DB
                          (default: none)
  --threads NUM           Number of threads (default: 1)
  --quick                 Quick operation (use first hit or hits)
  --unclassified-out FILENAME
                          Print unclassified sequences to filename
  --classified-out FILENAME
                          Print classified sequences to filename
  --output FILENAME       Print output to filename (default: stdout); "-" will
                          suppress normal output
  --confidence FLOAT      Confidence score threshold (default: 0.0); must be
                          in [0, 1].
  --minimum-base-quality NUM
                          Minimum base quality used in classification (def: 0,
                          only effective with FASTQ input).
  --report FILENAME       Print a report with aggregrate counts/clade to file
  --use-mpa-style         With --report, format report output like Kraken 1's
                          kraken-mpa-report
  --report-zero-counts    With --report, report counts for ALL taxa, even if
                          counts are zero
  --memory-mapping        Avoids loading database into RAM
  --paired                The filenames provided have paired-end reads
  --use-names             Print scientific names instead of just taxids
  --gzip-compressed       Input files are compressed with gzip
  --bzip2-compressed      Input files are compressed with bzip2
  --minimum-hit-groups NUM
                          Minimum number of hit groups (overlapping k-mers
                          sharing the same minimizer) needed to make a call
                          (default: 2)
  --help                  Print this message
  --version               Print version information

If none of the *-compressed flags are specified, and the filename provided
is a regular file, automatic format detection is attempted.

```

### 算法原理

算法原理：

> mapping of every k-mer in Kraken's genomic library to the lowest common ancestor (LCA) in a taxonomic tree of all genomes that contain that k-mer
> 
> The set of LCA taxa that correspond to the k-mers in a read are then analyzed to create a single taxonomic label for the read; this label can be any of the nodes in the taxonomic tree

Kraken2与Kraken的差别：

> 由于在Kraken中使用了被排序和索引的k-mer/LCA对，使得Kraken非常占内存，Kraken2的出现就是为了解决或改善这些问题

### 用法

**（1）建立Kraken2 Databases**

它要求Kraken2 Databases数据保存在一个文件夹下，且该文件夹下至少要有一下3个文件：

- `hash.k2d`: Contains the minimizer to taxon mappings
- `opts.k2d`: Contains information about the options used to build the database
- `taxo.k2d`: Contains taxonomy information used to build the database

这3个文件都无法以文本的方式打开，即所谓的human-unreadable format

Kraken2 Databases有两种：

> - Standard Kraken2 Database
> 
> 	执行 `$ kraken2-build --standard --threads 24 --db $DBNAME` 即可
> 	
> 	它会从NCBI上下载物种信息（taxonomic information）和细菌、古细菌和真菌的complete genome Refseq序列，然后在本地建立Kraken2 Database，大约要占据100G的磁盘空间
> 
> - Custom Databases
> 
> 	构建自定义的Databases需要按顺序执行以下步骤：
> 
> 	- Install a taxonomy
> 
> 		```
> 		$ kraken2-build --download-taxonomy --db $DBNAME
> 		```
> 
> 	- Install one or more reference libraries
> 
> 		可选的library：
> 
>		> - archaea
>		> - bacteria
>		> - plasmid
>		> - viral
>		> - fungi
>		> ...
>		
> 		```
> 		$ kraken2-build --download-library bacteria --db $DBNAME
> 		```
> 		
> 	- Build the database
> 	
> 		```
> 		$ kraken2-build --build --threads 16 --db $DBNAME
> 		```

（2）执行classification

```
$ kraken2 \
     --db <directory for databases> \
     --threads <int> \
     --classified-out <output class sequence>\
     --unclassified-out <output unclass sequence> \
     --output <output file>
```

输出文件格式说明：

<p align="center"><img src=./picture/Strategies-metagenome-taxonomic-label-Kraken2.png width=800 /></p>

例如：

```
C       MH0055_GL0038344        246787  1842    0:225 246787:5 0:44 171549:1 0:1533
U       MH0271_GL0135705        0       1458    0:1424
U       MH0054_GL0072998        0       1329    0:1295
U       MH0055_GL0024944        0       624     0:590
```

若在运行时添加`--use-names`参数，则输出文件的第3列，会用taxonomic name代替taxonomic id

#### kraken2结果解释
--output  

共5列
1."C"/"U"：是否分类（C:分类;U:未分类）

2.测序数据read ID号 ，来自FASTA/FASTQ文件

3.分类ID号，（例：Mucilaginibacter ginsenosidivorax (taxid 862126);如果taxid号为0,说明没有分类）

4.测序read的长度

5.以空格分隔的列表，指示序列中每个k-mer的LCA映射 （冒号之前taxid，0为没有数据）

例："562:13 561:4 A:31 0:1 562:3" 


the first 13 k-mers mapped to taxonomy ID #562

the next 31 k-mers contained an ambiguous nucleotide

the next 1 k-mer was not in the database

备注：最近公共祖先 lowest common ancestor (LCA) 

--report

共6列

1.Percentage of fragments covered by the clade rooted at this taxon（这个属或种的read在总read的比例）

2.Number of fragments covered by the clade rooted at this taxon（统计分类子集数量即该分类单元的read数，）<比如属，会包括这个属之下的所有种>）

3.Number of fragments assigned directly to this taxon （只鉴定到这个分类单元的read数<比如属，就是只包含确定到这个属，但不包括可以鉴定到这个属之下的种的read，这个是和第2列的区别> ）

备注：与测序read个数相同

4.A rank code, indicating (U)nclassified<未分类>, (R)oot, (D)omain, (K)ingdom, (P)hylum, (C)lass, (O)rder, (F)amily, (G)enus<属>, or (S)pecies<种>.

门纲目科属种

备注：分类等级码(例：G2，通过一个数字指示与该等级的距离，表示分类单元在属和种之间的等级码，the grandparent taxon is at the genus rank)

5.NCBI taxonomic ID number （NCBI分类号）

6.Indented scientific name（缩进的学名）


### krakentools
krakentools的具体操作详见作者的GitHub，如下：
+ [krakentools](https://github.com/jenniferlu717/KrakenTools)

为了我这三秒记忆的人可以在日后看见还能尽快拿来用，想着还是翻译一下：
#### Scripts included in KrakenTools 
KrakenTools 实际上就是9个Python脚本，如下所示：
1. [extract\_kraken\_reads.py](#extract\_kraken\_readspy)
2. [combine\_kreports.py](#combine\_kreportspy)
3. [kreport2krona.py](#kreport2kronapy)
4. [kreport2mpa.py](#kreport2mpapy)
5. [combine\_mpa.py](#combine\_mpapy)
6. [filter\_bracken\_out.py](#filter\_bracken\_outy)
7. [fix\_unmapped.py](#fix\_unmappedpy)
8. [make\_ktaxonomy.py](#make\_ktaxonomypy)
9. [make\_kreport.py](#make\_kreportpy)

怎么用？
```bash
python *.py -h
```
##### 1. extract\_kraken\_reads.py usage/options 
这个脚本是用来提取reads的

这里不仿照官方文档给的指南，只讲怎么用


对于双端测序的reads文件来说，不论是fastq还是fasta都是可以的，也可以是这些文件的压缩格式
```bash
extract_kraken_reads.py -k myfile.kraken -s1 read1.fq -s2 reads2.fq -o extracted1.fq -o2 extracted2.fq
```

在具体的提取阶段，有包含提取和不包含提取两大类
+ 不包含提取（--exclude flag）  
默认是包含提取，但是不包含也是有用的嘛！

For example:

1. `extract_kraken_reads.py -k myfile.kraken ... --taxid 9606 --exclude` ==> extract all reads NOT classified as Human (taxid 9606).（提取不包含mapping人类基因组的reads）
2. `extract_kraken_reads.py -k myfile.kraken ... --taxid 2 --exclude --include-children` ==> extract all reads NOT classified as Bacteria (taxid 2) or any classification in the Bacteria subtree.（提取不包含细菌及其子类的其他所有reads）
3. `extract_kraken_reads.py -k myfile.kraken ... --taxid 9606 --exclude --include-parents` ==> extract all reads NOT classified as Human or any classification in the direct ancestry of Human (e.g. will exclude reads classified at the Primate, Chordata, or Eukaryota levels).（提取不包含人类及其以上所有分类的reads，如灵长类，脊索动物门，真核生物等）


+ 包含提取（--include-parents/--include-children flags）

默认就是按照包含某物种的taxonomy ID来提取reads的

举个栗子：
1. `extract_kraken_reads.py [options] -t 562` ==> 850 reads classified as E. coli will be extracted
2. `extract_kraken_reads.py [options] -t 562 --include-parents` ==> 900 reads classified as E. coli or Bacteria will be extracted
3. `extract_kraken_reads.py [options] -t 562 --include-children` ==> 950 reads classified as E. coli, E. coli C, or E. coli ETEC will be extracted
4. `extract_kraken_reads.py [options] -t 498388` ==> 50 reads classified as E. coli C will be extracted
5. `extract_kraken_reads.py [options] -t 498388 --include-parents` ==> 950 reads classified as E. coli C, E. coli, or Bacteria will be extracted
6. `extract_kraken_reads.py [options] -t 1 --include-children` ==> All classified reads will be extracted


##### 2. combine_kreports.py usage/options
这个脚本就是把多个kraken report文件合并为一个
这也真没啥好讲的。


##### 3. kreport2krona.py usage/options
这个脚本把kraken report文件转化为krona兼容的
举栗子：
```bash
kraken2 --db KRAKEN2DB --threads THREADNUM --report MYSAMPLE.KREPORT \
    --paired SAMPLE_1.FASTA SAMPLE_2.FASTA > MYSAMPLE.KRAKEN2
python kreport2krona.py -r MYSAMPLE.KREPORT -o MYSAMPLE.krona 
ktImportText MYSAMPLE.krona -o MYSAMPLE.krona.html
```
<font size="3" color="red">先到这，后面用到再补！</font>

### bracken
```bash
   >>$ bracken -h
/home/usr18/miniconda2/bin/bracken: illegal option -- h
Usage: bracken -d MY_DB -i INPUT -o OUTPUT -w OUTREPORT -r READ_LEN -l LEVEL -t THRESHOLD
  MY_DB          location of Kraken database
  INPUT          Kraken REPORT file to use for abundance estimation
  OUTPUT         file name for Bracken default output
  OUTREPORT      New Kraken REPORT output file with Bracken read estimates
  READ_LEN       read length to get all classifications for (default: 100)
  LEVEL          level to estimate abundance at [options: D,P,C,O,F,G,S] (default: S)
  THRESHOLD      number of reads required PRIOR to abundance estimation to perform reestimation (default: 0)
  
# Bracken参数解释
-d，Kraken2数据库路径（包含Braken对应长度索引）；
-i，Kraken2的输出文件名（--report的输出文件名），在这里作为输入文件；
-o，Bracken输出文件（校正详情）文件名；
-w，Bracken计算后的新报告（每个物种的reads数目）文件名；
-r， reads长度；
-l，分类水平（D,P,C,O,F,G,S）；
-t，线程数。

```

#### Option 1: bracken:（使用Braken校正kraken2产生的report文件）
```bash
bracken -d ${KRAKEN_DB} -i ${SAMPLE}.kreport -o ${SAMPLE}.bracken -r ${READ_LEN} -l ${CLASSIFICATION_LEVEL} -t ${THRESHOLD}

# 例如
bracken -d ~/dbminikraken2_v1_8GB -i ./out/TEST.report -o ./out/TEST.S.bracken -w TEST.S.bracken.report -r 150 -l S
```






一个相当好的教程
+ [kraken2](http://ccb.jhu.edu/software/kraken2/index.shtml)

+ [bracken](https://ccb.jhu.edu/software/bracken/index.shtml?t=manual)

+ [KrakenTools](https://github.com/jenniferlu717/KrakenTools)

+ [pavian](https://github.com/fbreitwieser/pavian)

+ [宏基因组单个样本数据处理流程笔记](https://www.codenong.com/cs107077993/)

+ [Kraken2+Bracken处理宏基因组数据](https://www.jianshu.com/p/dd8182e861cb)

+ [宏基因组分析（三）物种组成分析](https://www.jianshu.com/p/04065914220b)

