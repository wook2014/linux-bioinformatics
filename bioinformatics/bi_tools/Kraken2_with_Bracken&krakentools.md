# Kraken2、Bracken和krakentools基本操作

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

### krakentools
krakentools的具体操作详见作者的GitHub，如下：
+ [krakentools](https://github.com/jenniferlu717/KrakenTools)




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
```

