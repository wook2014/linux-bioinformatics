# salmon基本操作

Salmon 是转录本定量软件，使用转录本定量主要优点一是更准确，比如不同样本同一基因使用不同 isoform 此时基因长度并不相等，直接基因定量无法顾及；二是方便进行可变剪切分析。Salmon 提供2种运行模式，一是直接读取 reads 文件(姑且称为 fastq 模式)；二是读取比对好文件 sam/bam (姑且称为比对模式)。

Reads 乱序
Salmon 要求 reads 是无序的，如果你的文件将 reads 排序过，用 Salmon 前要先重新乱序。

线程数
fastq 模式差不多使用线程越多运行越快，不过实际操作也没必要给整个几十个线程去跑；比对模式线程到达一定数目后，总体速度就不怎么加快了，设置 8-12 线程是相对合适的。





---
参考资料
1. [基因表达分析](https://www.plob.org/article/11591.html)

[Alignment-free的转录本比对工具-Salmon](https://www.bioinfo-scrounger.com/archives/411/)

[多套RNA-seq分析流程](https://ming-lian.github.io/2019/02/08/RNA-seq/)

[Scallop 和 Salmon 应用转录本定量分析](https://vidotto.top/post/scallop%E5%92%8Csalmon%E5%BA%94%E7%94%A8%E8%BD%AC%E5%BD%95%E6%9C%AC%E5%AE%9A%E9%87%8F%E5%88%86%E6%9E%90/)

[Salmon 进行转录本定量](https://www.jianshu.com/p/f62fd85113d3)
