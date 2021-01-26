# boetie2基本操作

## 参考基因组建索引
```bash
bowtie2-build genome.fasta index
```
当其运行完毕时，当前文件夹会产生4个新的文件，它们的文件名都以lambda_virus开始，分别以.1.bt2, .2.bt2, .3.bt2, .4.bt2, .rev.1.bt2和.rev.2.bt2结束,这些文件构成了索引.


## 比对
```bash
# 双末端测序
bowtie2  -p 8 -x index -1reads1.fq -2 reads2.fq -S out1.sam

# 非双末端测序
bowtie2 -x index -U *.fq -S out2.sam

# 参考资料里有管道
# 局部比对，把长reads比对到参考基因组上
bowtie2 --local -x index -U longreads.fq -S out3.sam

# -x <bt2-idx>由bowtie2-build所生成的索引文件的前缀。
# -1 <m1>双末端测序对应的文件1。可以为多个文件，并用逗号分开；多个文件必须和-2<m2>中制定的文件一一对应。
# -2 <m2>双末端测序对应的文件2.
# -U <r>非双末端测序对应的文件。可以为多个文件，并用逗号分开。
# -S <hit>所生成的SAM格式的文件前缀。
# -p --threads NTHREADS 设置线程数.Default: 1
```




---
参考资料：

1. [管道命令实现比对到格式转化一条龙](https://www.jianshu.com/p/528d45521497)

1. [bowtie2（测序序列与参考序列比对）](https://zhuanlan.zhihu.com/p/91317299)

1. [Bowtie2用法详解](http://www.chenlianfu.com/?p=178)

1. []()

1. []()

1. []()

1. []()



