# <center>iqtree 基本操作</center>

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
-T：程序运行使用的核数，可设置具体数字或者AUTO（推荐），默认为1
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
