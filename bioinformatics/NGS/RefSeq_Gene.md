# 什么是RefSeq Gene? 怎么给NCBI反馈问题？

## 1. 常用的Gene注释

其实，常用的gene注释有不同的来源，这个来源一般是某一个组织通过一定的方法来确定下来的参考gene的相关注释信息。比如常用的有：

- **RefSeq Gene注释**，对gene的不同转录本进行注释，1个转录本对应1个编号成为RefSeq id，例如对于可以翻译成蛋白的转录本，都会以NM_开头如NM_015658；对于不能翻译的转录本，都会以NR_开头如NR_027055；
- **Ensembl注释；**对gene的不同转录本进行注释，以ENSG开头的表示Ensembl gene_id如ENSG00000227232，以ENST开头的表示Ensembl transcript id如ENST00000438504
- **UCSC gene注释；**对gene的不同转录本进行注释，一般是类似uc004cpf这样的名称。

针对1个参考基因组版本，比如human的hg19参考基因组版本，会有来自各种不同组织，不同方法的基因注释。这些基因注释各有优劣，没有绝对的好与绝对的坏，只有掌握他们的注释规则，才能找到最适合我们课题的基因注释。所以，我们今天先来介绍一下RefSeq Gene的注释规则与原理。

## 2. RefSeq 计划与RefSeq gene

RefSeq = The NCBI Reference Sequence

这个计划是由NCBI提出的，意图是为所有常见生物提供非冗余，人工选择过的参考序列。一个物种的RefSeq注释通常包含：参考基因组，参考转录组，参考蛋白序列，参考SNP信息，参考CNV信息等等。

RefSeq基本上我们最常用的一个gene注释版本了，因为经过了人工挑选，挑选出来的gene或者是转录本都十分可靠。在RefSeq的官方说明文档中，这么写了一句话 “It is a unique resource because it provides a large, multi-species, ***curated\*** sequence database.” 这个curated是什么意思，大家可以查查字典~

从RefSeq的官方网站上可以下载到N个物种的参考序列信息，从无核到有核，从原核到真核，从低等到高等应有尽有。不过呢，这里面还是human的信息注释得最为全面，并且在RefSeq的主页上做了单独的页面链接如图1所示。

![img](https://pic4.zhimg.com/80/v2-9ff9be939d389b21c45b3885bf39948d_720w.jpg)
<center>图1 RefSeq的官方页面

点击图1页面中的==Human Genome Resource and Download==就可以进入Human资源的专题页面，如图2-1，图2-2所示。

![img](https://pic2.zhimg.com/80/v2-df4a697289c169321218f9eac7ab66c1_720w.jpg)

<center>图2-1 Human Genome Resource and Download页面上半部分

![img](https://pic3.zhimg.com/80/v2-d5eb4bfb7c087c9dbf04b97051635e96_720w.jpg)

<center>图2-2 Human Genome Resource and Download页面的download部分

页面的下半部分就是download的信息，其中提供了两个版本的资源，GRCh38 = hg38， GRCh37 = hg19。不过，我们注意一下，这里的基因注释文件为GFF3.0版本，和GTF（GFF2.0版本）略有不同，但里面的信息等价，也可以作为参考文件提供给比对软件。

我们点击GRCh37版本的gff3文件，结果我这里出现了报错信息：

```text
> The link cannot be connected!
```

好吧，那就只能去给NCBI提个意见，告诉他们这里出错了哟！

## 3. 怎么给NCBI反馈问题？

一般NCBI不同板块都会有不同的反馈途径，比如针对RefSeq板块反馈，就直接打开RefSeq的官方主页然后点击下方的Contact RefSeq Help Desk(图3-1).

![img](https://picb.zhimg.com/80/v2-0c1b2fe1f7667749934e5c2f3fc3a182_720w.jpg)

<center>图3-1 在RefSeq主页，找到Contact RefSeq Help Desk

然后就会出现提交问题的页面，在这个页面，我们需要填写基本的情况类型，联系方式，报错信息等等，然后就可以点击提交。如图3-2所示。

![img](https://pic3.zhimg.com/80/v2-0f6198793f2ced6b21cb95c9c6b0b6b4_720w.jpg)

![img](https://pic1.zhimg.com/80/v2-949bb08c2b3a8b00a43e6d578d0d1ff6_720w.jpg)

![img](https://pic2.zhimg.com/80/v2-90d3d689b12bb8b1297cce1050b771b5_720w.jpg)

![img](https://pic4.zhimg.com/80/v2-73bf66d9fbb18a8a8a0b72b265113419_720w.jpg)

<center>图3-2 提交问题反馈以及报错信息

在提交以后，会出现提交成功的信息如图3-3所示。

![img](https://picb.zhimg.com/80/v2-8cb29b1c9c1c298e12b5ae6d836a3051_720w.jpg)

<center>图3-3 问题提交成功的页面

可能有的小伙伴会问了，你提交的问题或者给NCBI提的各种意见或建议会有用吗？

告诉各位一个好消息，以我个人的经验，NCBI的工作人员都非常负责！一般1到2个工作日内（需要考虑时差）都会收到邮件回复。比如，我今天提交的这个问题，大概过了1个小时就收到了NCBI工作人员的邮件回复，回复信息如下（图3-4）：

![img](https://pic4.zhimg.com/80/v2-0a3cfbffebb23ba7952689a199585c58_720w.jpg)

<center>图3-4 NCBI工作人员的回复邮件

**目前，图2-2中GRCh37版本的GFF3文件链接已经被修复，可以下载了。大家可以试试~**

链接：[https://www.ncbi.nlm.nih.gov/projects/genome/guide/human/index.shtml](https://link.zhihu.com/?target=https%3A//www.ncbi.nlm.nih.gov/projects/genome/guide/human/index.shtml)

## 4. 提问环节

\1. 请点开RefSeq的官方主页，随便点一点里面的内容，探索一下每个链接对应的内容是什么；

\2. 尝试下载hg19的GFF3文件，并简单比较GFF3与GTF文件的不同。