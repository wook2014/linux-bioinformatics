# GFF与GTF文件

## GFF与GTF文件初探

在转录组分析的过程中，往往需要基因注释文件，通常是GFF或者是GTF文件，那么这两个文件的内容是什么？有什么特点呢？这是我们今天要探索的问题。

### 1. 我们为什么需要基因注释文件？

![img](https://pic4.zhimg.com/80/v2-4bb52e7f820b7c22e30741f7ae247d4f_720w.jpg)

<center>图1 通过对外显子（exon）的可变剪切，同1个基因可以形成多种蛋白（https://en.wikipedia.org/wiki/Alternative_splicing）

我们的gene在基因组上的结构不是连续的，而是exon-intron-exon（exon=外显子，intron=内含子）分隔开的。基因要表达，首先会先发生转录过程，转录出包含intron的pre-mRNA序列，然后再进行可变剪切，加5'帽子，3' PolyA尾巴等一系列复杂的加工过程才会形成成熟的mRNA。

在进行转录组序列比对，尤其是mRNA序列比对的时候，经常需要处理跨越两个exon之间的reads，所以在进行序列比对的时候往往需要对基因组有一个注释，告诉比对软件哪个位置是gene的exon，哪个地方是gene的intron，这个就是我们所说的基因注释信息。*所以，它里面核心内容就是一大堆gene在基因组上的坐标，以及这个gene本身的一些属性。*

### 2. GTF与GFF都是基因注释文件

GTF = General Transfer Format

GFF = General Feature Format

GFF有若干个版本，简单来说，GTF是GFF文件的其中一个版本，我们一般认为GTF文件就是GFF 2.0版本的内容。一个标准的GTF/GFF2.0文件需要包括9列内容，一个简单的示意图如下：

![img](https://pic4.zhimg.com/80/v2-fe4c64417c64bf6adea83e49d392792d_720w.jpg)

<center>图2 1个标准的GTF格式文件，文件不包括前面的行号

这9列分别是什么呢？ 我试着为大家翻译ensembl网站的说明文件（[GFF/GTF File Format](https://link.zhihu.com/?target=https%3A//asia.ensembl.org/info/website/upload/gff.html)）。

```text
# 所有的列必须用TAB分隔，总共有9列内容，第9列是补充列；
# 补充列的内容可以为空，但是前面8列必须有内容，如果想表达空的概念，则需要用"."；

# 第1列 seqname
染色体的名称，需要与genome FASTA文件中的染色体名对应，别一个用"chr1"一个用"Chr1"；

# 第2列 source
注释来自哪里，比如图2表示来自NCBI RefSeq数据库；

# 第3列 feature
此行的注释类型，一般有exon，CDS，stop_codon, start_codon等等；

# 第4，5列 start，end
此行注释的起始和终止位置，标准的GTF/GFF都是以1为染色体的起点（1-based system）;
注意！无论这个gene是正链还是负链，start的坐标都小于end坐标；

# 第6列 score
一般存放打分值，比如拼装的可信度之类。下载的官方注释文件一般为0.0

# 第7列 strand
正链基因标记为 "+", 负链基因标记为 "-";

# 第8列 frame
只可能是0,1,2这3个值,表示与CDS中codon的相对位置；
0表示，这个region的第1bp就是正好是codon 三连密码子的第1个碱基；
1表示，这个region的第2bp就是正好是codon 三连密码子的第1个碱基；
2表示，这个region的第3bp就是正好是codon 三连密码子的第1个碱基；

# 第9列 attribute
一般会记录 gene_id 与transcript_id;
这一列是可选列，可以增加很多内容。在程序处理过程中，相同的attribute会合并在一起处理。
比如，所有gene_id=SGIP1的行都会先汇总在一起，表示1个基因。
```

### 3. 提出问题

既然是这样，我们今天就思考2个小问题，1个比较偏理论，1个是比较具体。

\1. 你认为GTF/GFF的文件格式设计合理吗？为什么？

\2. 如果告知，transcript_id为NM001308203.1*，*gene_id为SGIP1, 在转录本上的坐标为101，那么对应基因组的坐标是多少？请写出答案与简要程序思路。注释信息如下：

```text
chr1	hg19_ncbiRefSeq	exon	66999252	66999355	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	start_codon	67000042	67000044	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67000042	67000051	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	66999929	67000051	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67091530	67091593	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67091530	67091593	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67098753	67098777	0.000000	+	1	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67098753	67098777	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67105460	67105516	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67105460	67105516	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67108493	67108547	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67108493	67108547	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67109227	67109402	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67109227	67109402	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67136678	67136702	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67136678	67136702	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67137627	67137678	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67137627	67137678	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67138964	67139049	0.000000	+	1	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67138964	67139049	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67142687	67142779	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67142687	67142779	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67145361	67145435	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67145361	67145435	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67154831	67154958	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67154831	67154958	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67155873	67155999	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67155873	67155999	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67160122	67160187	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67160122	67160187	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67184977	67185088	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67184977	67185088	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67194947	67195102	0.000000	+	1	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67194947	67195102	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67199431	67199563	0.000000	+	1	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67199431	67199563	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67205018	67205220	0.000000	+	0	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67205018	67205220	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67206341	67206405	0.000000	+	1	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67206341	67206405	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67206955	67207119	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67206955	67207119	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	CDS	67208756	67208775	0.000000	+	2	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	stop_codon	67208776	67208778	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
chr1	hg19_ncbiRefSeq	exon	67208756	67216822	0.000000	+	.	gene_id "SGIP1"; transcript_id "NM_001308203.1";
```

------

## GTF/GFF的注释是怎么来的，应该从哪里下载？

### 1. 什么是参考GTF/GFF文件

针对一些已经通过测序计划，拼装好基因组序列信息的物种，一般会同时提供其转录组的注释信息，也就是我们所说的GTF/GFF文件。常用的模式生物，比如human（人），mouse（小鼠），rat（大鼠），chicken（鸡），lizard（蜥蜴），Arabidopsis thaliana（拟南芥）等等都已经有非常好的 全基因组参考序列（FASTA文件），以及转录组注释信息（GTF或GFF文件）。因此，直接到能够提供下载地址的网站上下载就好了。图1给大家展示了已经公布参考基因组哺乳动物的系统发生树，大家可以看看人类和哪种动物演化距离最近。

![img](https://pic4.zhimg.com/80/v2-bda9584334e8221935ee41ba7eece3d6_720w.jpg)图1 已经公布参考基因组的哺乳动物系统发生树（http://asia.ensembl.org/info/about/speciestree.html）

多说一句，这个下载下来的FASTA文件就是我们所谓的参考基因组，需要用这个文件去构建mapping的index；下载下来的GTF文件是转录组注释信息，一般在计算表达量的时候需要提供。

### 2. 什么是拼装转录本

在进行转录组分析的过程中，我们经常会听到一句话叫“用XX软件拼装转录本”，这句话是什么意思呢？不都有参考转录组了，还要拼个啥转录组？

**第1个方面**，对于无参考基因组，无参考转录组的物种来说，往往需要通过RNA-Seq的数据自己拼出参考转录组，然后再进行下游的数据分析。所以，对于无参分析来说，往往需要自己拼装转录本，生成自己的参考转录组信息，也包括注释信息（GTF文件）。

**第2个方面**，对于有非常好注释的基因组，例如human来说。不同的细胞条件可能不同，一些永生化的细胞系往往都具有“癌症”的特征，这些细胞的转录组，基因组或多或少都有结构的变异，以及转录本的差异。

举个例子，有一个geneA，在参考转录组中注释的是从chr1:1000~15000进行转录，但是在另外的细胞系中有可能就是从chr1:980~15050进行转录。这种转录起始和终点的不同是很常见的现象。因此，有时候为了比较严谨地进行下游序列分析，是需要根据已知的参考转录组以及测序数据对其进行一个修饰。常用的软件是cufflinks，stringtie等等。

不过，对于有参考转录组的物种，一般情况下，我还是建议不要去自己拼转录本，也不要去做什么所谓的修正，意义不大。除非你研究的体系非常特殊。

### 3. 从哪里下载参考转录组GTF/GFF文件呢？

关于下载GTF/GFF文件的内容，给大家介绍2个最常用的网站：

- 1个是UCSC genome browser （[UCSC Genome Browser-网址链接](https://link.zhihu.com/?target=https%3A//genome.ucsc.edu/index.html)）
- 1个是Ensembl（[Ensembl 网址链接](https://link.zhihu.com/?target=http%3A//www.ensembl.org/index.html)）
- 注意：对于植物的Ensembl网站（[Ensembl Plants](https://link.zhihu.com/?target=http%3A//plants.ensembl.org/index.html)）

**3.1 从UCSC genome browser下载human的GTF文件**

```text
1. 打开UCSC genome browser网站 （图3.1-1）
2. 在Tools里选择 Table Browser(图3.1-2）
3. 打开Table Browser以后，设置相关的需要内容（图3.1-3）
4. 点击get output即可下载

# hg19 = human genome 19是常用的human参考基因组版本号；
# RefSeq gene是全部经过人工检查过的gene注释文件；
```

![img](https://pic2.zhimg.com/80/v2-fb7ac10d3e0d8286871510f674c2458c_720w.jpg)

<center>图3.1-1 打开UCSC genome browser网站

![img](https://pic1.zhimg.com/80/v2-a4288a1871acf65cbb644b766638463e_720w.jpg)

<center>图3.1-2 在Tools里选择 Table Browser

![img](https://picb.zhimg.com/80/v2-8a683d97d5023b2be6e0eae82d57f33b_720w.jpg)

<center>图3.1-3 打开Table Browser以后，设置相关的需要内容

**3.2 Ensembl下载human的GTF文件**

在下载之前我必须跟大家提个醒。

```text
* 对于动物相关的信息都请访问Ensembl的动物站：http://www.ensembl.org/index.html
* 对于植物相关的信息都请访问Ensembl的植物站：http://plants.ensembl.org/index.html
```

我们在这里还是以下载human hg19版本的GTF文件为例，操作步骤如下：

```text
1. 登陆Ensembl网站，并跳转到hg19版本界面 （图3.2-1）
2. 继续选择跳转到hg19版本界面（图3.2-2）
3. 在hg19版本的Ensembl界面中选择download（图3.2-3）
4. 在download页面中选择Download a sequence or region （图3.2-4）
5. 在左边栏选择 FTP download 然后选择下载 GTF文件（图3.2-5）
6. 选择注释好的GTF进行下载（图3.2-6）
```

![img](https://pic3.zhimg.com/80/v2-c09f13c87a3dd05634b4e8d9f2367d10_720w.jpg)

<center>图3.2-1 登陆Ensembl网站，并跳转到hg19版本界面

![img](https://pic1.zhimg.com/80/v2-0b84f16471fecc427b4c7b562301b0f3_720w.jpg)

<center>图3.2-2 继续选择跳转到hg19版本界面

![img](https://pic3.zhimg.com/80/v2-be5b86c4105cad5d9a243ba9b36d4ccb_720w.jpg)

<center>图3.2-3 在hg19版本的Ensembl界面中选择download

![img](https://pic3.zhimg.com/80/v2-af58e340e8f91fec5a7a61eb6ef98b09_720w.jpg)

<center>图3.2-5 在左边栏选择 FTP download 然后选择下载 GTF文件

![img](https://pic4.zhimg.com/80/v2-8fc02cbdc22285d422131327575e667a_720w.jpg)

<center>图3.2-6 选择注释好的GTF进行下载

### 4. 提问环节

\1. 请按照文中教程分别从UCSC Genome Browser，以及Ensembl网站上下载hg19的转录组注释的GTF格式文件。

\2. 下载这两个文件解压缩以后的大小是否有差异，差异大不大？

\3. 解压并使用Linux less命令打开这两个文件，观察这两个文件的transcript_id以及gene_id是否相同，再找找看有哪些其他地方的不同。

## GENCODE与Ensembl GTF/GFF到底哪里不同？怎么下载？

### 1. 基因注释的不同版本问题

其实在BBQ26题（[生物信息学100个基础问题 —— 第26题 什么是RefSeq Gene? 怎么给NCBI反馈问题？](https://zhuanlan.zhihu.com/p/36084586)）的时候，我们已经向大家解释过1次，在这里我们再重新复习一遍，针对gene在genome上的注释文件，也就是我们常说的GTF/GFF文件，目前主要的注释版本主要有：

- **RefSeq Gene注释**，对gene的不同转录本进行注释，1个转录本对应1个编号成为RefSeq id，例如对于可以翻译成蛋白的转录本，都会以NM_开头如NM_015658；对于不能翻译的转录本，都会以NR_开头如NR_027055；
- **Ensembl注释；**对gene的不同转录本进行注释，以ENSG开头的表示Ensembl gene_id如ENSG00000227232，以ENST开头的表示Ensembl transcript id如ENST00000438504
- **UCSC gene注释；**对gene的不同转录本进行注释，一般是类似uc004cpf这样的名称。

那么，在BBQ26题的时候，我们为大家介绍了RefSeq GTF/GFF的下载方式，并且向NCBI反馈了1个问题。RefSeq其实是平时我们最常用的1个gene注释版本啦，注释都是通过人工挑选的，如果是NM或者NR开头的就更为可信。但是，RefSeq有一些注释不够完整，或者说有一些可能存在的，有用的gene转录本，所以有的时候我们会推荐大家使用Ensembl或者GENCODE的注释，**那么我们今天的问题来了——Ensembl和GENCODE的GTF/GFF注释有什么不同？**

### 2. GENCODE上下载GTF/GFF

先说说GENCODE是什么吧，根据GENCODE的官方说明文档，GENCODE的目的是为了建立一个公用可信的gene注释体系，其缩写的对应关系为：

**The GENCODE Project = Encyclopædia of genes and gene variants**

好了，让我们先访问以下GENCODE的官方网站：[https://www.gencodegenes.org/](https://link.zhihu.com/?target=https%3A//www.gencodegenes.org/)

![img](https://pic4.zhimg.com/80/v2-40b724a11af7718a2fcd92a089232c5b_720w.jpg)

<center>图2-1 GENCODE 官方网站

其实，大家可以发现GENCODE的网站上，只提供了Human和Mouse两个物种的注释信息，但这两个物种也是平时研究的时候最关心最常用的两个物种。每个物种有若干个版本，我们一般下载最新版本就好了。下面以Human的数据下载为例为大家进行讲解。

```text
1. 先来点开Human的data部分；
2. 选择你想要的数据；
```

![img](https://pic2.zhimg.com/80/v2-8fd569b00b27ccc4c66e38112b89cfe1_720w.jpg)

![img](https://pic3.zhimg.com/80/v2-3d5e10b82361328a2ba9193b94d05e12_720w.jpg)

![img](https://pic4.zhimg.com/80/v2-1ef116d1a94a06f7f8dfa825c4266cb8_720w.jpg)

<center>图2-2 GENCODE上关于Human的Data文件

大家可以看出来，GENCODE已经对数据做了非常好的整理，不但提供了各种类型数据的下载，而且在下方的Metadata部分，还解释了每一种数据的元数据。**也就是不但告诉我们注释的结果，还告诉了我们为什么这么注释**，真的很良心！

在这里，我们就为大家下载了最常用的gene annotation也就是第1个文件Comprehensive gene annotation 的 GTF格式。

### 3. Ensembl 下载

关于Ensembl的GTF下载，我们之前已经有了非常详细的探讨，请移步BBQ25查看！

[孟浩巍：生物信息学100个基础问题 —— 第25题 GTF/GFF的注释是怎么来的，应该从哪里下载？](https://zhuanlan.zhihu.com/p/36065699)



### 4. GENCODE与Ensembl GTF/GFF有什么不同？

我们先来看一下这两者的数据内容：

**这是我们用BBQ25里面的方法从Ensembl下载下来的GTF文件；**

```text
#!genome-build GRCh37.p13
#!genome-version GRCh37
#!genome-date 2009-02
#!genome-build-accession NCBI:GCA_000001405.14
#!genebuild-last-updated 2013-09
1       ensembl_havana  gene    11869   14412   .       +       .       gene_id "ENSG00000223972"; gene_version "4"; gene_name "DDX11L1"; gene_source "ensembl_havana"; gene_biotype "pseudogene";
1       havana  transcript      11869   14409   .       +       .       gene_id "ENSG00000223972"; gene_version "4"; transcript_id "ENST00000456328"; transcript_version "2"; gene_name "DDX11L1"; gene_source "ensembl_havana"; gene_biotype "pseudogene"; transcript_name "DDX11L1-002"; transcript_source "havana"; transcript_biotype "processed_transcript"; havana_transcript "OTTHUMT00000362751"; havana_transcript_version "1"; tag "basic";
1       havana  exon    11869   12227   .       +       .       gene_id "ENSG00000223972"; gene_version "4"; transcript_id "ENST00000456328"; transcript_version "2"; exon_number "1"; gene_name "DDX11L1"; gene_source "ensembl_havana"; gene_biotype "pseudogene"; transcript_name "DDX11L1-002"; transcript_source "havana"; transcript_biotype "processed_transcript"; havana_transcript "OTTHUMT00000362751"; havana_transcript_version "1"; exon_id "ENSE00002234944"; exon_version "1"; tag "basic";
1       havana  exon    12613   12721   .       +       .       gene_id "ENSG00000223972"; gene_version "4"; transcript_id "ENST00000456328"; transcript_version "2"; exon_number "2"; gene_name "DDX11L1"; gene_source "ensembl_havana"; gene_biotype "pseudogene"; transcript_name "DDX11L1-002"; transcript_source "havana"; transcript_biotype "processed_transcript"; havana_transcript "OTTHUMT00000362751"; havana_transcript_version "1"; exon_id "ENSE00003582793"; exon_version "1"; tag "basic";
1       havana  exon    13221   14409   .       +       .       gene_id "ENSG00000223972"; gene_version "4"; transcript_id "ENST00000456328"; transcript_version "2"; exon_number "3"; gene_name "DDX11L1"; gene_source "ensembl_havana"; gene_biotype "pseudogene"; transcript_name "DDX11L1-002"; transcript_source "havana"; transcript_biotype "processed_transcript"; havana_transcript "OTTHUMT00000362751"; havana_transcript_version "1"; exon_id "ENSE00002312635"; exon_version "1"; tag "basic";
```



**这是我们刚刚下载下来的GENCODE的GTF文件；**

```text
##description: evidence-based annotation of the human genome (GRCh38), version 28 (Ensembl 92)
##provider: GENCODE
##contact: gencode-help@ebi.ac.uk
##format: gtf
##date: 2018-03-23
chr1    HAVANA  gene    11869   14409   .       +       .       gene_id "ENSG00000223972.5"; gene_type "transcribed_unprocessed_pseudogene"; gene_name "DDX11L1"; level 2; havana_gene "OTTHUMG00000000961.2";
chr1    HAVANA  transcript      11869   14409   .       +       .       gene_id "ENSG00000223972.5"; transcript_id "ENST00000456328.2"; gene_type "transcribed_unprocessed_pseudogene"; gene_name "DDX11L1"; transcript_type "processed_transcript"; transcript_name "RP11-34P13.1-002"; level 2; transcript_support_level "1"; tag "basic"; havana_gene "OTTHUMG00000000961.2"; havana_transcript "OTTHUMT00000362751.1";
chr1    HAVANA  exon    11869   12227   .       +       .       gene_id "ENSG00000223972.5"; transcript_id "ENST00000456328.2"; gene_type "transcribed_unprocessed_pseudogene"; gene_name "DDX11L1"; transcript_type "processed_transcript"; transcript_name "RP11-34P13.1-002"; exon_number 1; exon_id "ENSE00002234944.1"; level 2; transcript_support_level "1"; tag "basic"; havana_gene "OTTHUMG00000000961.2"; havana_transcript "OTTHUMT00000362751.1";
chr1    HAVANA  exon    12613   12721   .       +       .       gene_id "ENSG00000223972.5"; transcript_id "ENST00000456328.2"; gene_type "transcribed_unprocessed_pseudogene"; gene_name "DDX11L1"; transcript_type "processed_transcript"; transcript_name "RP11-34P13.1-002"; exon_number 2; exon_id "ENSE00003582793.1"; level 2; transcript_support_level "1"; tag "basic"; havana_gene "OTTHUMG00000000961.2"; havana_transcript "OTTHUMT00000362751.1";
chr1    HAVANA  exon    13221   14409   .       +       .       gene_id "ENSG00000223972.5"; transcript_id "ENST00000456328.2"; gene_type "transcribed_unprocessed_pseudogene"; gene_name "DDX11L1"; transcript_type "processed_transcript"; transcript_name "RP11-34P13.1-002"; exon_number 3; exon_id "ENSE00002312635.1"; level 2; transcript_support_level "1"; tag "basic"; havana_gene "OTTHUMG00000000961.2"; havana_transcript "OTTHUMT00000362751.1";
```



仔细观察一下，我们发现两者貌似没什么不同，除了GTF第9列的可选信息写的顺序不一样，不过这都没有什么影响。我们来看看官方是怎么回答这个问题的：

> **What is the difference between GENCODE and Ensembl annotation?**
> The GENCODE annotation is made by merging the Havana manual gene annotation and the Ensembl automated gene annotation. The GENCODE annotation is the default gene annotation displayed in the Ensembl browser. The GENCODE releases coincide with the Ensembl releases, although we can skip an Ensembl release is there is no update to the annotation with respect to the previous release. In practical terms, the GENCODE annotation is identical to the Ensembl annotation.

**简单翻译过来：**

GENCODE的组成包括Havana组织的人工注释，以及Ensembl的程序自动注释，在Ensembl的genome浏览器中，使用的是GENCODE的注释文件。这两个是完全等价的！



那么GENCODE与Ensembl GTF一点区别也没有吗？肯定不是的！来看看官方文档怎么说：

> **What is the difference between GENCODE GTF and Ensembl GTF?**
> The gene annotation is the same in both files. The only exception is that the genes which are common to the human chromosome X and Y PAR regions can be found twice in the GENCODE GTF, while they are shown only for chromosome X in the Ensembl file.
> In addition, the GENCODE GTF contains a number of attributes not present in the Ensembl GTF, including annotation remarks, APPRIS tags and other tags highlighting transcripts experimentally validated by the GENCODE project or 3-way-consensus pseudogenes (predicted by Havana, Yale and UCSC). Find here the complete list of tags.

**简单翻译一下：**

在X与Y的同源区域，有一些基因是在两条染色体上都有的，Ensembl只在X染色体注释了1次，GENCODE在X与Y染色体各注释了1次。

同时，GENCODE的GTF在第9列的可选列里面增加了很多新的tag信息来记录更多的注释内容。这些在Ensembl的注释里面也是没有的。

### 5. 今天的问题

- 请访问GENCODE的官方网站，查看并浏览statistics信息，看看最新版本的GENCODE中包含的各种类型的gene数目；
- 想办法查找到human X与Y染色体的同源区域（PAR regions）的坐标，并想办法验证，GENCODE确实对这些同源区域注释了2次；
- 开放思考：如果让你做可变剪切的分析，你是用RefSeq的注释，还是Ensembl的注释还是GENCODE的注释？请说出你的理由。