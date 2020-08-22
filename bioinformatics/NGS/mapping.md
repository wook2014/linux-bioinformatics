# 高通量测序的回贴问题

在这之前，我们一直在讨论怎么去做FASTQ文件的质控，怎么trim，怎么cutadapt；还为大家介绍了从双序列比对的最根本的原理及算法；再到后来学习了低通量的找相似序列的办法BLAST以及基因组快速定位的办法BLAT。那么从今天开始以后的若干问都是与高通量测序结果的回贴（mapping）问题有关。

## 技术路线图

![img](https://pic1.zhimg.com/80/v2-269f1aca792177edf59167abd66da214_720w.jpg)

<center>图1 从FASTQ到SAM路线图

***我们的核心任务是从FASTQ文件开始，经过中间的质控，最终找到序列在基因组上的定位。***

那么，我们之前的算法和方法能不能高效完成这个问题呢，答案是不行的！因为这次我们的输入常常是10^7 甚至更多的reads，而且是要在全基因组上寻找定位，比如人的基因组有3Gbp大！所以如果不优化算法，估计mapping这个问题就要等到地老天荒。关于mapping的算法问题，我之前录过1期视频，专门推导了为什么应用BWT算法就可以完成我们这项艰巨的任务。

[踏踏实实做技术：BWA，Bowtie，Bowtie2的比对算法推导](https://zhuanlan.zhihu.com/p/30485711)

------

谈完了算法，我们再谈谈比对软件。目前市面上针对DNA测序的结果mapping的比对软件有很多。针对2代测序优化过的，最常用的有Bowtie，Bowtie2，BWA这三款；针对3代测序优化的比对软件有BLASR，LAST，BWA-MEM等等。因为目前二代测序占据了90%以上的市场份额，因此我们前期主要讨论的内容是二代测序的比对问题，也就是Bowtie，Bowtie2，BWA这三款软件。

其实，看过我上面BWT推导的朋友应该能够知道，这三个软件本质上的算法是没有区别的，有区别的地方都是小修小改。所以上，理解了其中的1个，其他的也都很好理解。我们会发现，这些算法的最基础的要点就是都要有1个index。那么什么是index呢？简单来说就是若干个文件，方便我们快速地访问及搜索基因组。上面我说的这些比对软件都需要建立index。

一般建立index的输入文件为参考基因组序列（FASTA格式）和1个我们指定的index-name；输出为若干个以index-name为开头的index文件。比如我们使用Bowtie2，以human reference genome建立index的命令为：

```text
# build-index by Bowtie2
> bowtie2-build hg19_only_chromosome.fa  hg19_only_chromosome &

# 解释
#### bowtie2-build为建立index的命令，安装bowtie2以后就可以用；
#### hg19_only_chromosome.fa 为human genome的参考基因组，FASTA格式；
#### hg19_only_chromosome 为建立index需要指定的名称；
```

最终建立index输出结果如图2：

![img](https://pic4.zhimg.com/80/v2-59e137eb642fcbc22fcc5a17b1b1ac91_720w.jpg) 

<center>图2 使用bowtie2建立的human genome index

------

**那么今天的任务是，请观看我的两个视频：**

第1个视频是介绍BWT算法的及推导的；

- 视频链接：[踏踏实实做技术：BWA，Bowtie，Bowtie2的比对算法推导](https://zhuanlan.zhihu.com/p/30485711)；

第2个视频是介绍怎么从UCSC genome browser上下载参考基因组然后构建index的；

- 视频链接：[高通量测序技术交流录像](https://link.zhihu.com/?target=https%3A//www.bilibili.com/video/av12969326/)
- 请观看视频的 24:45 - 41:00部分，参考基因组的下载与bowtie2 index的建立



**那么我们今天的问题是：**

\1. 为什么FASTQ文件的快速比对需要建立index？

\2. 如果我从1个网站上下载的是1个物种的参考转录组的序列，其中包含了A,U,C,G碱基，我的FASTQ为该物种转录组测序的结果，用A,G,T,C，4种碱基来表示。那么需不需要在建立index之前把参考转录组中的U全部都换成T？

\3. 请在Linux环境下，下载human genome 19参考基因组的1号染色体序列；并使用bowtie 建立index。



我们再把思路理清楚，在进行mapping的时候，

***输入文件***应该包含：

```text
1. 测序结果（通常是FASTQ或者是FASTQ的压缩文件）
2. 之前建立好的参考基因组的index文件（不同的mapping软件建立的方法大同小异，但一般都是提前构建）
```

***输出文件***应该包括：

```text
1. 比对的结果文件（一般是SAM文件格式或者是BAM文件格式）
2. 比对的情况报告
```

## SAM/BAM文件

首先先说二者之间的关系，BAM文件是SAM文件的压缩格式，压缩以后可以节省空间，排好序的BAM文件还可以提供随机访问功能，性能优良。但是BAM文件和SAM文件储存的内容是完全一样的。我们以后还要单独再说BAM文件的操作方法，今天我们把重点放在文件中的内容上。

SAM文件的全称是：**Sequence Alignment Map，**它设计之初就是为了存储mapping结果的。一个标准的SAM文件由2部分组成，第1部分是以“@”开头的头部，在文件的最前面；第2部分就是紧跟在头部后面的比对结果文件。我们先来看一个例子（图1）。

![img](https://pic2.zhimg.com/80/v2-613c18370aee08a497a7ff8aa0d34e05_720w.jpg)

<center>图1 SAM文件的内容

在Linux中，访问sam文件最好用的工具是samtools，常用的操作如下：

```text
# 假设SAM文件的文件名是 test.sam

# 1.只查看头部
samtools view -H test.sam

# 2.只查看内容，不查看头部
samtools view test.sam

# 3.查看头部内容
samtools view -h test.sam 

# 4.查看帮助文档
samtools view
```

另外，==通常情况下，1行SAM文件的内容包含有多列，标准的SAM文件会包含11列内容，其中每一列的内容代表的意思与简单的描述如下。我们今天主要关注的是前面4列内容。==

![img](https://pic2.zhimg.com/80/v2-75e7e62a31b1c1d56523ae63abf5b8ca_720w.jpg)

<center>图2 标准SAM文件中的11列内容代表的含义

![img](https://pic2.zhimg.com/80/v2-a9f698ae27bbeaa9064fad2e77c46fab_720w.jpg)

<center>图3 SAM文件中的前4列内容

说了这么多，那么我们今天的问题如下：

\1. SAM文件的头部内容中常见的标志符号有@HD，@SQ，@PG，请问这三者后面跟随的信息分别是什么意思？

\2. 图3是SAM文件内容的前4列（最前面的序号是我加上去的，不包含在SAM文件中），那么请你解释一下这4列分别代表什么意思？其中的FLAG是第几列，是什么意思？

\3. 如果1条序列的FLAG=83 （图3标号38的行）请解释其比对含义。

https://link.zhihu.com/?target=https%3A//en.wikipedia.org/wiki/SAM_(file_format))

## 通量比对的质量MAPQ

比对的质量MAPQ。

在我们BBQ100的第1问中，我们就问了大家一个问题FASTQ格式中的第4行记录的是什么内容。我们也给大家进行了解答，FASTQ格式的第4行记录的是每一个碱基的测序质量信息，也叫phred值。1个FASTQ记录的例子如下：

```text
@HWI-ST1350:124:C1C2TACXX:3:1101:1223:2042
CTTTTCGAGTCAGACACATGACAGCCGGCAGCAACTGGAATGGCAGCAATT
+
BBCFFFFFGHHHHJJIJJIIJJJJIJJJGIJIIJJIJIGIIJJGIIIJIIG
```

我们在mapping的时候，会遇到一个问题，比如就用我们上面给大家展示的FASTQ序列举例。如果这条序列（readA）最终可以比对到：1号染色体的100000这个位置，但其中包含了1个mismatch（错配）；或者是2号染色体的200000这个位置，但是有2个错配。那readA到底是比对到第1个位置还是第2个位置呢？

这个时候就需要1个度量值来帮我们做判断，选择1个最好的作为最终的比对结果（当然研究一些比较特殊问题的时候需要把相似的比对结果都输出出来），这个度量值就是MAPQ。

## **那么MAPQ是什么意思呢？**

根据SAM文件的官方定义：

> MAPQ: Mapping Quality. It equals -10 log10 Pr{mapping position is wrong}, rounded to the nearest integer. A value 255 indicates that the mapping quality is not available.

简单翻译一下：MAPQ是mapping的质量值，计算方法与FASTQ的质量值类似，

```text
MAPQ=-10 * log10{mapping出错的概率}
```

当MAPQ=255的时候，代表MAPQ没有意义，就是一个占位符。

## **那么怎么计算MAPQ呢？**

到了这里，可能又会有同学问了，虽然我们知道了MAPQ的含义，但是里面有一个mapping出错的概率，我应该怎么计算呢？这是一个非常容易问到的问题！

**而我的回答是：**根据mapping的情况，然后结合碱基的测序质量值进行评估。核心思想是，低质量的碱基如果进行了mismatch（错配），那么很有可能是测序错误导致的，不应该罚太多分；低质量的碱基如果与参考基因组完美match（匹配），那么也很有可能是测序错误导致的，不应该加太多分。

以我们下面的图1内容为例，第5列是MAPQ值，一般在后续分析的时候，我们都需要把MAPQ质量过低的reads去掉，一般的cutoff是MAPQ≥10，严格一些的比如去寻找somatic mutation的时候需要MAPQ≥30.

![img](https://pic1.zhimg.com/80/v2-56e6004b23ffb661c943c5685891f711_720w.jpg)

<center>图1 标准的SAM文件截图

好了，说了这么多，我们今天的思考如下：

\1. 如果mapping的时候输入的是FASTA文件，那么MAPQ还有意义吗？为什么？

\2. 不同的比对软件比如bwa与bowtie2，计算出来的MAPQ意义相同吗？为什么？

\3. 请写出samtools view 命令 获得MAPQ 大于等于20的sam文件，假设原始的sam文件名为raw.sam，过滤后的sam文件名为filter_MAPQ20.sam

![image-20200801210013165](C:%5CUsers%5CXum_s%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20200801210013165.png)

## SAM/BAM中的CIGAR值

SAM/BAM文件的前面5列，分别记录了，各位可以对照下图1中的内容对应一下。

```text
1. 序列的名称；
2. FLAG值；
3. 比对到的染色体；
4. 比对到的染色体的具体位置；
5. 比对的质量值， 也叫MAPQ；
```

![img](https://picb.zhimg.com/80/v2-3ef77de4f0e9a5381b1df8e51068204a_720w.jpg)

<center>图1 全基因组测序的比对数据

那么第6列信息到底是什么呢？它其实是比对的一个简单描述，有一个很好听的名字叫CIGAR值（对滴，就是雪茄烟的那个单词）。

CIGAR = Concise Idiosyncratic Gapped Alignment Report

我们先来简单理解一下CIGAR值。

```text
例子1：如图1第37行，CIGAR = 56M1I30M；
它的含义就是：这条序列与参考基因组相比；
前56bp能够match上；
中间有1bp的insertion（相比于参考基因组有1bp的插入）；
最后是30bp的match

例子2：如图1第50行，CIGAR=145M，
含义就是：这条序列与参考基因组比对的结果是145bp完全match上。
```

那么常用的CIGAR标记符号都有哪些呢？根据SAM格式的官方文档如图2所示。

![img](https://pic1.zhimg.com/80/v2-e765bb1b5321f7cdc50a57a28b6fb522_720w.jpg)

<center>表1 常用的CIGAR符号

目前，我们只需要了解到前面7个，后面的=，X已经很不常用了，大家可以先忽略一下。

我们今天就是让大家去理解CIGAR值到底是什么，因此我们今天的问题就是：



\1. M,I,D,N分别是什么意思？如果1条序列的CIGAR=150M， 那么是不是可以说这150bp的区域中没有mismatch（错配）的现象？

\2. 如果1条序列来自于成熟的mRNA，在mapping到基因组的时候会有什么问题？如果这条序列中间正好跨过了200bp的intron，前后各有75bp mapping到了exon上，那么这条序列的CIGAR值应该怎么写？

\3. 根据下图提示，请理解clip的含义，无论是softclip还是hardclip。

![img](https://pic1.zhimg.com/80/v2-159690addc0c8d3ea592e30c6d1be438_720w.jpg)

<center>图 2 引自 http://bioinformatics.cvr.ac.uk/blog/tag/cigar-string/



## SAM/BAM中的其它重要信息列

1个标准的SAM文件包含前面的11列标准信息列和若干标识符信息列（如表1所示），其中前面的6列我们已经为大家解释清楚。那么今天我们来继续探索剩下的7到11列。

![img](https://pic4.zhimg.com/80/v2-a4f06ad5aacd4c87d4ff9f55b995cb87_720w.jpg)

<center>表1 SAM格式的标准11列信息介绍

第7列，一般情况下是指Pair read的另一半的比对的参考基因组；

第8列，一般情况下是指Pair read的另一半的比对的参考基因组的坐标；

第9列，可以简单理解为这1对read比对到基因组上以后，上游第1个碱基到下游最后1个碱基的距离。如果用负号表示是下游的序列；如果是正数表示为上游的序列；如果是0表示只是单端比对上；

第10列，进行比对read的序列信息；

第11列，进行比对read的质量信息；

![img](https://pic1.zhimg.com/80/v2-800c6a2d13f7c984b5e18029a9a8d8ab_720w.jpg)

<center>图1 SAM文件的截图，包含11列

对于我们今天的简单讲解，其实还涉及到很多概念，就比如在SAM官方文档中，对template，segment，read的各自定义就很让人挠头，我也是用了很长的时间才弄懂学会的。大家有兴趣的可以看一下图2我的截图，看看里面的定义。

![img](https://pic1.zhimg.com/80/v2-e8deb1b7b2b1ed243223ee59db9c7b28_720w.jpg)

<center>图2 SAM官方文档中对一些概念的解释（很让人难懂）

那么我们今天的问题如下：

\1. 图1中第20行，第9列记录了TLEN值，请你根据今天的文章与图1中的信息，列出算式计算TLEN值。

\2. 如果使用FASTA文件作为input，第11列的质量值是否还有意义？为什么？

\3. 有没有可能通过SAM文件，提取里面的序列信息并转换成FASTQ格式的文件？如果可能，请你写出程序思路。

## SAM/BAM中的附加标记信息

### 1. 基础导引部分

我们先给大家举个例子，这是一个human 的全基因组测序比对的SAM文件的11列以后的信息。第11列之前学习过了是reads的质量值，那么后面的若干标记比如MD:Z:145等等这些符号是什么意思呢？

![img](https://pic1.zhimg.com/80/v2-3bfbddafe079b618d23fe05aa2b68a15_720w.jpg)

<center>图1 SAM文件的11列以后的信息截图

我把上面图中的部分行的信息放到这里，供大家查阅（11列以后的内容要一直向右拖拽）。

```text
ST-E00126:128:HJFLHCCXX:2:1206:8105:9730	99	chr1	11670	1	145M	=	11898	315	AGGTGAAGCCCTGGAGATTCTTATTAGTGATTTGGGCTGGGGCCTGGCCATGTGTATTTTTTTAAATTTCCACTGATGATTTTGCTGCATGGCCGGTGTTGAGAATGACTGCGCAAATTTGCCGGATTTCCTTTGCTGTTCCTGC	KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKFKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKFKKFKKKKKKKKKKKKKKKKKKKFFKKKKKKKKKKFKKKKKKKKKKKKKKKFAK	MD:Z:145	PG:Z:MarkDuplicates	XG:i:0	NM:i:0	XM:i:0	XN:i:0	XO:i:0	AS:i:0	XS:i:0	YS:i:0	YT:Z:CP
ST-E00126:128:HJFLHCCXX:2:2107:22820:18520	99	chr1	11682	1	145M	=	11920	325	GGAGATTCTTATTAGTGATTTCGGCTGGTGCCTGGCCATGTGTATTTTTTTAAATTTCCACTGATGATTTTGCTGCATGGCCGGTGTTGAGAATGACTGCGCAAATTTGCCGGATTTCCTTTGCTGTTCCTGCATGTAGTTTAAA	KKKKAAKKAFFKKKKKKFKFKKKFKKKKKKKKKKFKFKKKKKKKKKKKKKKFKFFKKKKKKFAAKAKKKKKKKKKKKKFFKKKFFFKKFKFFKKKKKKKKFFFFFKKKKKKK7<FFKKKKKKAFK<F<<7<AA,,7AA<7F7AA<	MD:Z:21G6G116	PG:Z:MarkDuplicates	XG:i:0	NM:i:2	XM:i:2	XN:i:0	XO:i:0	AS:i:-12	XS:i:-12	YS:i:-6	YT:Z:CP
ST-E00126:128:HJFLHCCXX:2:1210:9110:60026	163	chr1	11703	1	87M	=	11840	282	GGGCTGGGGCCTGGCCATGTGTATTTTTTTAAATTTCCACTGATGATTTTGCTGCATGGCCGGTGTTGAGAATGACTGTGCAAATTT	7FKAFKFKFFFKKF<FKKKFKKKFKK7F<KFFKFKKKKKKKFFFF,FKKKKKKKFFKKKKK(7<,AAK<F7AAFKKFKFKFF<A<7<	MD:Z:78C8	PG:Z:MarkDuplicates	XG:i:0	NM:i:1	XM:i:1	XN:i:0	XO:i:0	AS:i:-5	XS:i:-5	YS:i:-33	YT:Z:CP
ST-E00126:128:HJFLHCCXX:2:2101:7425:68324	99	chr1	11708	1	145M	=	11923	302	GGGGCCTGGCCATGTGTATTTTTTTAAATTTCCACTGATGATTTTGCTGCATGGCCGGTGTTGAGAATGACTGCGCAAATTTGCCGGATTTCCTTTGCTGTTCCTGCATGTAGTTTAAACGAGATTGCCAGCACCGGGTATCATT	KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK<FKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKAKKKKK<FKKKKFKKKKKKKKK7<AKFFAFKFF<KKKKKFKK<FK<7F,AFKFFA	MD:Z:145	PG:Z:MarkDuplicates	XG:i:0	NM:i:0	XM:i:0	XN:i:0	XO:i:0	AS:i:0	XS:i:0	YS:i:0	YT:Z:CP
ST-E00126:128:HJFLHCCXX:2:2210:15382:54752	163	chr1	11714	1	87M	=	11866	297	TGGCCATGTGTATTTTTTTAAATTTCCACTGATGATTTTGCTGCATGGCCGGTGTTGAGAATGACTGCGCAAATTTGCCGGATTTCC	KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKFKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK	MD:Z:87	PG:Z:MarkDuplicates	XG:i:0	NM:i:0	XM:i:0	XN:i:0	XO:i:0	AS:i:0	XS:i:0	YS:i:-5	YT:Z:CP
```

一般呢，我们都把11列以后的内容称为可选择区域（optional fields），这个区域所有的格式都必须是TAG:TYPE:VALUE的形式，比如MD:Z:145就是一个符合规范的可选区域的值。

根据SAM格式官方文档的信息，我们需要记住以下内容：

```text
1. 所有的TAG都是2个字母，一般情况下都是大写字母。并且TAG在1行的比对结果中只能出现1次。
2. 所有的TYPE都是单字母，大小写敏感，它是用来定义后面VALUE的类型；
3. VALUE可长可短，但是需要和之前的TYPE相呼应。
```

关于TYPE不同字母对应的不同数据类型，把SAM的官方文档贴一下，共大家参考。其中，最常用的就是i（带符号的数字）；Z（可直接输出字符串，可以包含空格）；

![img](https://pic2.zhimg.com/80/v2-0eb1b608a393b8857c9604b90cb66405_720w.jpg)

<center>图2 TYPE的字母与不同数据类型之间的对应关系

### 2.常用的TAG

那么常用的TAG都有哪些，都代表什么含义呢？要知道，不同的比对软件可能会在SAM文件的后面加上不同的TAG，所以我们在查询TAG含义的时候一定要从所用比对软件的官方文档中去查找。而SAM文件的header部分又包含了@PG字符段可以帮助我们还原比对软件的参数设置，因此我们拿到一个SAM文件就可以通过查阅文档的方式了解TAG的基本信息。

```text
# 使用samtools可以查看sam文件的header部分
samtools view -H test.sam
```

比如，我们这里的@PG内容如下

```text
@PG	ID:bowtie2-5DEB9F7A	PN:bowtie2	VN:2.2.5	CL:"/home/biotools/bowtie2-2.2.5/bowtie2-align-s --wrapper basic-0 -p 4 --phred33 -x /lustre/user/reference/hg19/hg19_combine -S ./tmp.data/fastq/genome-sequence.sam -1 ./tmp.data/fastq/genome-sequence_L3_1_trim5.fastq -2 ./tmp.data/fastq/genome-sequence_L3_2_trim5_92.fastq"
```

我们就知道这个test.sam文件使用了bowtie2这个比对软件进行了比对，因此我们在查询TAG信息的时候，我们就需要翻阅bowtie2的文档。

## 都有了SAM文件，为什么还需要BAM文件

### 1. 背景介绍和数据下载

SAM文件不但记录了reads详细的mapping信息，还记录了reads的原始信息，内容很是全面。这样很好，但也存在很多问题：

1. 比如我的原始FASTQ文件是100G，那么我的SAM文件一定是大于100G的，也就是占用了更多空间；
2. mapping的结果是没有排序，无论是按reads 的 name排序还是按在基因组上的位置排序，都没有。所以默认的SAM输出文件是乱序的，处理很不方便；
3. mapping的结果不能进行随机访问，什么是随机访问呢？举个例子就是说对于一个SAM文件我不能快速地访问比如chr1 10000 - 200000 这个区域的所有reads 的mapping情况。

基于以上这3个问题，BAM文件就出现了，并且完美解决了上面3个问题。为了方便我们今天的展示和说明，我为大家准备了1个很小的SAM文件，大约只有4MB，请大家下载下来并完成我们的相关问题。

```text
# SAM测试文件的baidu盘下载地址
链接：https://pan.baidu.com/s/15gVVYPRu3VbF_uKbJUUGrA 密码：2drn
```

同时，我们今天要使用的工具是Linux下的samtools，请没有Linux的老铁去安装Linux（我们马上就会有教程出来）；请没有安装samtools软件的老铁使用conda安装需要软件，教程可以移步（[用Anaconda快速搭建生物信息学分析平台](https://zhuanlan.zhihu.com/p/35711429)）

### 2. 思路讲解

BAM文件是SAM文件的一种压缩格式，也是最常用的一种比对结果的压缩格式。它一般可以将SAM文件压缩到只有原来的20~30%大小，并且使用非常方便。

同时，对于BAM文件，我们一般还会进行排序，根据不同的需要，我们排序的方法一般有2种：第1种是按照mapping到的参考基因组的坐标上下游顺序来排序，是samtools的默认排序方法；第2种是按照reads name进行排序，需要增加一个-n参数。

对于一个已经排序好的BAM文件，我们通常会建立索引文件，后缀名一般是在BAM文件名的后面多个“.bai“。有了BAM以及索引文件的出现，我们就可以随机访问任意一段染色体区域的BAM文件。

### 3. 提出问题

那么我们今天的问题也很简单，就是使用samtools工具对我们的测试数据test.sam文件进行操作。具体要求如下：

\1. 使用samtools view 命令查看test.sam的header，请记录各条染色体的长度；同时告知这个test.sam文件是使用哪种mapping软件进行mapping的？

\2. 使用samtools view命令将test.sam文件转换成test.bam文件，并保留header区域，写出命令并记录test.sam，test.bam的文件大小。

\3. 使用less命令分别查看test.sam，test.bam文件，为什么bam文件会输出乱码？使用samtools view命令再试试看？

\4. 使用samtools sort命令对test.bam文件进行排序，输出文件名为test_sort.bam，并记录文件大小。

\5. 使用samtools index 对test_sort.bam建立index，写出命令并记录其文件大小。

\6. 使用samtools tview使用下面的命令查看chr1:160000-160100区域的比对情况，并截图

```text
samtools tview -p chr1:160000-160100  test_sort.bam
```

### 4. 参考资料

资料1：本次主要是对samtools的一个应用，我建议大家直接看samtools的说明文档，比如对于view功能，直接在命令行敲击samtools view，再按回车就能出现说明文档，如下图所示。

![img](https://pic3.zhimg.com/80/v2-373ed5baec098597ffaffad78046c2f2_720w.jpg)

<center>图1 samtools view的说明文档

资料2：[samtools manual page](https://link.zhihu.com/?target=http%3A//www.htslib.org/doc/samtools.html)

