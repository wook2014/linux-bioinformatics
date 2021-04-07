# <center>iqtree 基本操作</center>

## introduction
IQTREE是最大似然法进化树构建软件，主要由来自奥地利维也纳大学（Universität Wien）的越南天才学者Bùi Quang Minh（裴广明，似乎是这么译的）开发。提供包括windows（64/32位）、linux（64/32位）、以及macs在内的多平台不同版本。

+ IQ-TREE有四大功能，在很大程度上解决了前面提到的最大似然法建树软件、尤其是速度上的几个缺陷：

	+ 高效建树（efficient tree reconstruction）

	+ 模型选择（modelfinder: fast and accurate model selection）

	+ 超快自展（ultrafast bootstrap approximation）

	+ 大型数据（big data analysis）


输入数据：
十分灵活，包括Phylip，fasta，nexus，clustalw在内的序列比对格式均可接收，这一点不像RAxML、PhyML或MEGA比较局限。
```bash
iqtree -h
Usage: iqtree [-s ALIGNMENT] [-p PARTITION] [-m MODEL] [-t TREE] ...
-s：序列比对文件（支持多个文件逗号隔开，或者包含比对文件的文件夹），可选PHYLIP、FASTA、NEXUS、CLUSTAL、MSF
--seqtype：序列类型，可选BIN、DNA、AA、NT2AA、CODON、MORPH默认为自动检测
-o：外类群列表，不同物种之间逗号隔开
--prefix：结果文件名前缀
--seed：随机数种子，主要出于调试目的
--mem：最大可使用内存，单位为G、M或百分数%
--redo：忽略检查重写输出文件，默认为off，也即从上次意外中断处开始
-T：程序运行使用的核数，可设置具体数字或者AUTO（推荐），默认为1（-nt）
--threads-max：最大可使用的核数，默认为所有核
--fast：快速模式，类似FastTree
-b：非参数bootstrap次数，大于等于100
-B：超快速bootstrap次数，大于等于1000
--bnni：使用NNI优化超快速bootstrap的树，搭配-B使用
--alrt：SH近似似然比检验重复次数
-m：模型选择，设置MF自动选择最佳模型但不建树；设置MFP自动检测最佳模型并建树。此外还可以设置具体的模型，或者多个可选模型，例如-m LG,WAG
--ancestral：基于经验贝叶斯的祖先状态重建
```

```bash
# iqtree 建树（吴珂版）
iqtree -T 20 -st DNA -s ${i} -m MFP -bb 1000 -alrt 1000

# iqtree 建树（小明版）
iqtree -s novel_virus_aligned.fasta -pre novelvirus -bb 1000 -nt AUTO -m JC

# iqtree 建树
```




---
参考资料：

1. [文献笔记五十六：武汉新型冠状病毒的进化分析](https://cloud.tencent.com/developer/article/1593331)
