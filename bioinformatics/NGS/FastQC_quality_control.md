# 用FastQC做质控

Ok！那么今天我们要解决的问题是在从测序公司拿到原始数据以后，我们应该怎么评价这次的测序质量。是不是要做相应的一些后续处理。我们今天要使用的就是一个强大的工具——FastQC

## **FastQC的基本介绍**

FastQC是一款基于Java的软件，一般都是在linux环境下使用命令行运行，它可以快速多线程地对测序数据进行质量评估（Quality Control），其官网地址为：[Babraham Bioinformatics](https://link.zhihu.com/?target=http%3A//www.bioinformatics.bbsrc.ac.uk/projects/fastqc/)

FastQC的下载和安装，和一般的Java软件没有什么区别，我们在这里就不做介绍了，在成功安装好以后，我们就在命令行模式下，输入fastqc就可以调用这个程序，界面如下：

![img](https://picb.zhimg.com/80/6cdffd5747cfc38375f481a141f96acc_720w.png)

这时候我们可以选择 --help选项看一下帮助文档：

![img](https://pic1.zhimg.com/80/315fc9215fc3242c2b4e1f44c4de0682_720w.png)

```text
# 基本格式

# fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] [-c contaminant file] seqfile1 .. seqfileN

# 主要是包括前面的各种选项和最后面的可以加入N个文件
# -o --outdir FastQC生成的报告文件的储存路径，生成的报告的文件名是根据输入来定的
# --extract 生成的报告默认会打包成1个压缩文件，使用这个参数是让程序不打包
# -t --threads 选择程序运行的线程数，每个线程会占用250MB内存，越多越快咯
# -c --contaminants 污染物选项，输入的是一个文件，格式是Name [Tab] Sequence，里面是可能的污染序列，如果有这个选项，FastQC会在计算时候评估污染的情况，并在统计的时候进行分析，一般用不到
# -a --adapters 也是输入一个文件，文件的格式Name [Tab] Sequence，储存的是测序的adpater序列信息，如果不输入，目前版本的FastQC就按照通用引物来评估序列时候有adapter的残留
# -q --quiet 安静运行模式，一般不选这个选项的时候，程序会实时报告运行的状况。
```



以我平时用的一个真实的例子：

```text
fastqc -o ./tmp.result/fastQC/ -t 6 ./tmp.data/fastq/H1EScell-dnase-2014-GSE56869_20151208_SRR1248176_1.fq 
```

使用的数据是2014年Dnase Hi-C的测序数据，数据下载地址：

```text
http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1370433
```

运行一段时间以后，就会出现报告：

```text
H1EScell-dnase-2014-GSE56869_20151208_SRR1248176_1.fq_fastqc.html
H1EScell-dnase-2014-GSE56869_20151208_SRR1248176_1.fq_fastqc.zip
```

使用浏览器打开后缀是html的文件，就是图表化的fastqc报告：

![img](https://pic1.zhimg.com/80/877967dad063658ee72cf567b4d69ab4_720w.png)

## **FastQC的报告介绍**

### 总结信息

上图中Summary的部分就是整个报告的目录，整个报告分成若干个部分。合格会有个绿色的对勾，警告是个“!”，不合格是个红色的叉子。

### 基本信息

![img](https://pic2.zhimg.com/80/b19f28a107a90f7c4f7b02510c7884ab_720w.png)

```text
# Encoding指测序平台的版本和相应的编码版本号，这个在计算Phred反推error P的时候有用，如果不明白可以参考之前的文章。
# Total Sequences记录了输入文本的reads的数量
# Sequence length 是测序的长度
# %GC 是我们需要重点关注的一个指标，这个值表示的是整体序列中的GC含量，这个数值一般是物种特意的，比如人类细胞就是42%左右。
```

### 序列测序质量统计

![img](https://picb.zhimg.com/80/38670ee6d5f373e326e3fe3e23ba4f9b_720w.png)

```text
# 此图中的横轴是测序序列第1个碱基到第101个碱基
# 纵轴是质量得分，Q = -10*log10（error P）即20表示1%的错误率，30表示0.1%
# 图中每1个boxplot，都是该位置的所有序列的测序质量的一个统计，上面的bar是90%分位数，下面的bar是10%分位数，箱子的中间的横线是50%分位数，箱子的上边是75%分位数，下边是25%分位数
# 图中蓝色的细线是各个位置的平均值的连线
# 一般要求此图中，所有位置的10%分位数大于20,也就是我们常说的Q20过滤
# 所以上面的这个测序结果，需要把后面的87bp以后的序列切除，从而保证后续分析的正确性
# Warning 报警 如果任何碱基质量低于10,或者是任何中位数低于25
# Failure 报错 如果任何碱基质量低于5,或者是任何中位数低于20
```



### 每个tail测序的情况

![img](https://pic3.zhimg.com/80/ccf9bb69e20e2a3561581d08f57ef63e_720w.png)

```text
# 横轴和之前一样，代表101个碱基的每个不同位置
# 纵轴是tail的Index编号
# 这个图主要是为了防止，在测序过程中，某些tail受到不可控因素的影响而出现测序质量偏低
# 蓝色代表测序质量很高，暖色代表测序质量不高，如果某些tail出现暖色，可以在后续分析中把该tail测序的结果全部都去除
```

### 每条序列的测序质量统计

![img](https://pic4.zhimg.com/80/63086aca8162f21cb685d45c20e88b6f_720w.png)



```text
# 假如我测的1条序列长度为101bp，那么这101个位置每个位置Q之的平均值就是这条reads的质量值
# 该图横轴是0-40，表示Q值
# 纵轴是每个值对应的reads数目
# 我们的数据中，测序结果主要集中在高分中，证明测序质量良好！
```

### GC 含量统计

![img](https://picb.zhimg.com/80/1b78609b8c4690eddf1eb1408c26f10c_720w.png)

```text
# 横轴是1 - 101 bp；纵轴是百分比
# 图中四条线代表A T C G在每个位置平均含量
# 理论上来说，A和T应该相等，G和C应该相等，但是一般测序的时候，刚开始测序仪状态不稳定，很可能出现上图的情况。像这种情况，即使测序的得分很高，也需要cut开始部分的序列信息，一般像我碰到这种情况，会cut前面5bp
```

### 序列平均GC含量分布图

![img](https://picb.zhimg.com/80/5fead4df4b5c980b7519ddd536a7b196_720w.png)

```text
# 横轴是0 - 100%； 纵轴是每条序列GC含量对应的数量
# 蓝色的线是程序根据经验分布给出的理论值，红色是真实值，两个应该比较接近才比较好
# 当红色的线出现双峰，基本肯定是混入了其他物种的DNA序列
# 这张图中的信息良好
```

### 序列测序长度统计

![img](https://pic4.zhimg.com/80/97d24fbdf9e42fc057072f7582e1532c_720w.png)

```text
# 每次测序仪测出来的长度在理论上应该是完全相等的，但是总会有一些偏差
# 比如此图中，101bp是主要的，但是还是有少量的100和102bp的长度，不过数量比较少，不影响后续分析
# 当测序的长度不同时，如果很严重，则表明测序仪在此次测序过程中产生的数据不可信 
```

### 序列Adapter

![img](https://pic3.zhimg.com/80/7563b88d741b0f97e8546325f91e9969_720w.png)

```text
# 此图衡量的是序列中两端adapter的情况
# 如果在当时fastqc分析的时候-a选项没有内容，则默认使用图例中的四种通用adapter序列进行统计
# 本例中adapter都已经去除，如果有adapter序列没有去除干净的情况，在后续分析的时候需要先使用cutadapt软件进行去接头，这个软件以后我会介绍
```

### 重复短序列

![img](https://pic3.zhimg.com/80/d36385723bfbe857c1d0516c622fc05f_720w.png)

```text
# 这个图统计的是，在序列中某些特征的短序列重复出现的次数
# 我们可以看到1-8bp的时候图例中的几种短序列都出现了非常多的次数，一般来说，出现这种情况，要么是adapter没有去除干净，而又没有使用-a参数；要么就是序列本身可能重复度比较高，如建库PCR的时候出现了bias
# 对于这种情况，我的办法是可以cut掉前面的一些长度，可以试着cut 5~8bp
```

在使用FastQC之后，如果我们发现了一些问题（序列质量不高，），那么我们该使用什么样的工具，去解决这些问题呢？这就是今天我们要干的事情。

## 质控后操作

### fastx Toolkit

fastx Toolkit是包含处理fastq/fasta文件的一系列的工具，它是基于java开发的，我们高通量测序最常用到的是使用这个软件进行reads的裁剪（trim）。它的安装可以根据官网的指南进行：

- [http://hannonlab.cshl.edu/fastx_toolkit/index.html](https://link.zhihu.com/?target=http%3A//hannonlab.cshl.edu/fastx_toolkit/index.html)

在这里我们就不再赘述。下面我们对这个工具箱中的工具，具体的命令进行一个简要的介绍。

```text
FASTQ-to-FASTA
说明：这个命令主要是用来转换FASTA格式与FASTQ格式$ fastq_to_fasta [-h] [-r] [-n] [-v] [-z] [-i] [-o]
[-h] = 获得帮助信息.
[-r] = 使用序号去代替fastq文件中原来的reads名.
[-n] = 如果fastq中有N，保留.（默认是有N的序列删除）
[-v] = 报告reads的总数
[-z] = 调用GZip软件，输出的文件自动经过压缩.
[-i] = 输入文件，可以是fastq/fasta格式.
[-o] =输出路径，如果不设置会直接输出到屏幕.

FASTX Statistics
说明：主要统计一下序列的基本信息，如GC含量什么的，很少用，基本使用FastQC代替
$ fastx_quality_stats 
[-h] [-i INFILE] [-o OUTFILE]
[-h] = 获得帮助信息
[-i] = FASTA/Q格式的输入文件
[-o] = 输出路径，如果不设置会直接输出到屏幕.

FASTA/Q Clipper
说明：主要是进行reads的过滤和adapter的裁剪
$ fastx_clipper [-h] [-a ADAPTER] [-i INFILE] [-o OUTFILE]
#参数很多，我们慢慢来看！
[-h] = 获得帮助信息.
[-a ADAPTER] = Adapter序列信息. 默认的是CCTTAAGG
[-l N] = 如果1条reads小于N就抛弃，默认5.
[-d N] = 保留adapter并保留后面的Nbp，如果设置-d 0等于没有用这个参数.
[-c] = 只保留包含adapter的序列
[-C] = 只保留不包含adapter的序列
[-k] = 报告adater的序列信息
[-n] = 如果reads中有N，保留reads.（默认是有N的序列删除）
[-v] = 报告序列总数
[-z] = 调用GZip软件，输出的文件自动经过压缩.
[-D]= Debug output.

FASTA/Q Trimmer
说明：这个是我最常用的工具，可以快速切序列
$ fastx_trimmer [-h] [-f N] [-l N] [-z] [-v] [-i INFILE] [-o OUTFILE]
[-h] = 获得帮助信息.
[-f N] = 序列中从第几个碱基开始保留. 默认是1.
[-l N] = 序列最后保留到多少个碱基，默认是整条序列全部保留.
[-z] = 调用GZip软件，输出的文件自动经过压缩.

备注：其实Fastx工具箱中还有很多其他的工具，但是都不是特别常用，所以我也就不进行介绍了。如果有感兴趣的同学，请直接到他们的官网上去阅读说明文档。
```

### cutadapt软件

这个cutadapt软件是最常用的去adapter的工具。它是基于Python编写的一个Python包，Python包安装的办法在我们的公众号里面已经有比较详细的介绍，我们就不赘述。这里为大家附上cutadapt程序包的下载地址。

- [https://pypi.python.org/pypi/cutadapt](https://link.zhihu.com/?target=https%3A//pypi.python.org/pypi/cutadapt)

成功安装cutadapt以后，在命令行模式下输入：cutadapt就会出现类似于下面的提示，里面主要是cutadapt的基本介绍信息和最简单的用法。

![img](https://pic4.zhimg.com/80/da46edde62197b075241261a49a9265b_720w.png)

```text
一些最基本的用法
# cutadapt的功能特别强大，相对应的参数真的特别说，有几十个参数，我们平时只会用到很少的几个，我在这里为大家介绍一下。

# 最基本的形式，可以去掉3‘端的adapter序列
$ cutadapt -a AACCGGTT -o output.fastq input.fastq

# 可以直接输入或者输出压缩文件，不需要修改参数，输出文件的后面加上.gz
$ cutadapt -a AACCGGTT -o output.fastq.gz input.fastq.gz

# 假如去掉3‘端的adapter AAAAAAA 和5’端的adapter TTTTTTT
$ cutadapt -a AAAAAAA -g TTTTTTT -o output.fastq input.fastq

# cutadapt也可以用来进行reads的cut
# 去掉最前面的5bp
$ cutadapt -u 5 -o trimmed.fastq input_reads.fastq

# 进行reads测序质量的过滤
# cutadapt软件可以使用-q参数进行reads质量的过滤。基本原理就是，一般reads头和尾会因为测序仪状态或者是反应时间的问题造成测序质量差，比较粗略的一个过滤办法就是-q进行过滤。需要特别说明的是，这里的-q对应的数字和phred值是不一样的，它是软件根据一定的算法计算出来的。
# 3‘端进行一个简单的过滤,--quality-base=33是指序列使用的是phred33计分系统
$ cutadapt -q 10 --quality-base=33 -o output.fastq input.fastq 
# 3‘端 5’端都进行过滤,3'的阈值是10，5‘的阈值是15
$ cutadapt -q 10,15 --quality-base=33 -o output.fastq input.fastq 


Reads 长度的过滤
[--minimum-length N or -m N]
# 当序列长度小于N的时候，reads扔掉

[--too-short-output FILE]
# 上面参数获得的这些序列不是直接扔掉，而是输出到一个文件中

[--maximum-length N or -M N]
# 当序列长度大于N的时候，reads扔掉

[--too-long-output FILE]
# 上面参数获得的这些序列不是直接扔掉，而是输出到一个文件中


Paired-Reads的裁剪（trim）
# 现在很多的测序都是双端测序，那么从测序原理上来说，一对reads来自于1簇反应，所以一起进行adapter的trim可能效果更好。cutadapt自然也提供了这样的功能。
$ cutadapt -a ADAPTER_FWD -A ADAPTER_REV -o out.1.fastq -p out.2.fastq reads.1.fastq reads.2.fastq
# -a是第1个文件的adapter序列
# -A是第2个文件的adapter序列
# -o是第1个输出文件
# -p是第2个输出文件
```

### 1个例子

其实在实际中，我们从公司拿到的数据大多数已经进行过cutadapt，我们其实更关注的是reads的trim。我们利用我们的测试数据进行一下实际处理说明。

我们首先先要用fastqc对test1.fastq与test2.fastq进行一下质量评估，评估的主要结果如下：

<center>read1的测序质量图

![img](https://pic4.zhimg.com/80/8778d44748ea5cf63122238f92927293_720w.png)

<center>read2的测序质量图



![img](https://pic3.zhimg.com/80/9e10e6c7ae57995f0bf261b148e50a16_720w.png)

我们从上面两张图可以明显看出，read1的测序质量明显好于read2，一般我们确定要trim多少bp的时候都是按phred20这个标准进行评估。比如，对于我们测试数据，read1就不需要trim，read2需要保留1-85bp。对应的fastx_trimmer的命令如下：

```text
fastx_trimmer -i test_data_2.fastq -o test_data_2_trim.fastq -f 1 -l 85
```