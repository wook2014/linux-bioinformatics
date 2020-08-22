# illumina 测序原理介绍

## **目前**

我们接触到的很多生物信息学的技术，都是基于NGS技术的，比如RNA-Seq，ChIP-Seq，FAIRE-Seq，ChIA-PET，Hi-C等等。所谓的NGS就是Next Generation Sequencing，翻译为“下一代测序技术”，或者是“第二代测序技术”。之所以这么叫，是因为相比较于第一代测序技术其测序通量有了很大的提升。

其实，二代测序比较常见的有罗氏454测序，Illumina等。但目前最为常用的NGS技术就是illumina测序技术，它能够保证在几十个小时内产生几百G甚至上T的测序数据，完全能够满足高通量测序的通量要求。并且其测序准确程度也是完全能够保证。我在这里很决断的说，在目前高通量测序的科研领域，Illumina测序绝对是主导地位的，几乎没有其他的公司可以撼动它。因此，我们这篇文章就Illumina测序的原理做一个比较详细的介绍，希望对大家入门生物信息学有所帮助。

## **目录**

1. **一些常用基本概念的介绍**
2. **建库**
3. **桥式PCR**
4. **测序 & Illumina为什么这么短！**
5. **下期预告**

## **1.一些常用基本概念的介绍**

- flowcell 是指Illumina测序时，==测序反应发生的位置，1个flowcell含有8条lane==
- lane 每一个flowcell上都有8条泳道，用于测序反应，可以添加试剂，洗脱等等
- ==tile 每一次测序荧光扫描的最小单位==
- reads 指==测序的结果，1条序列一般称为1条reads==
- bp base pair 碱基对，用于衡量序列长度
- 双端测序 只一条序列可能比较长如500bp，我们可以两端每端各测150bp
- junction 上面说的==双端测序，中间会留有200bp测不到的东西==，我们叫junction
- adapter 就是==测序中需要的一段特定的序列，有类似于引物的功能==
- primer PCR中的引物



> ![img](https://pic1.zhimg.com/80/7bf9590eb86cf3fe53915af600282b4a_720w.jpg)一台illumina最新的X Ten测序仪



> ![img](https://pic3.zhimg.com/80/9cd2b42fde82c99fe94863cd883ddc27_720w.jpg)
>
> flowcell，图中黑色的小线条就是lane，每一个lane中整齐排列了无数个tile，只可惜我们肉眼看不到

## **2.建库**

- 由于Illumina测序策略本身的问题，导致其测序长度不可能太长，==目前最好的X Ten也就是双端各150bp，所以不可能直接拿整个基因组去测序，所以在测序的时候需要先打断成一定长度的片段，这个根据需要用不同的策略，一般测人的基因组，我们是将其打断成300 ~ 500bp的长度。这个是根据跑胶控制的。==
- 打断以后会出现==末端不平整的情况，用酶补平==，所以现在的序列是平末端。
- 完成补平以后，在3'端使用酶==加==上一个==特异的碱基A==
- 加上A之后就可以利用互补配对的原则，==加上adapter==，这个==adpater可以分成两个部分，一个部分是测序的时候需要用的引物序列，另一部分是建库扩增时候需要用的引物序列==
- 进行==PCR==扩增，使得我们的DNA样品浓度足够上机要求。
- 建库的示意图如下图所示，

![img](https://picb.zhimg.com/80/aa6a01141ff7744bdc4156e035143a93_720w.png)

## **3.桥式PCR**

- 将上述的DNA样品调整到合适的浓度加入到flowcell中，再加入特异的化学试剂（如），就可以使得==序列的一端与flowcell上面已经存在的短序列通过化学键十分强健地相连==，如下图。图中不同的颜色表示的是两种不同的adpater，分别对应序列之前加入的两种adpater
- 引用：[https://i.ytimg.com/vi/t0akxx8Dwsk/maxresdefault.jpg](https://link.zhihu.com/?target=https%3A//i.ytimg.com/vi/t0akxx8Dwsk/maxresdefault.jpg)

![img](https://pic3.zhimg.com/80/af4f2093686699098c0a15700f9d9f55_720w.jpg)

- 连接以后就正式开始桥式PCR。首先进行第一轮扩增，将序列补成双链。加入NaOH强碱性溶液破坏DNA的双链，并洗脱。由于最开始的序列是使用化学键连接的，所以不会被洗。
- 加入缓冲溶液，这时候序列自由端的部分就会和旁边的adpater进行匹配
- 进行一轮PCR，在PCR的过程中，序列是弯成桥状，所以叫桥式PCR，一轮桥式PCR可以使得序列扩增1倍
- 如此循环下去，就会得到一个具有完全相同序列的簇，一般叫cluster

整体流程如下图所示：

引用自：[http://tucf-genomics.tufts.edu/home/faq](https://link.zhihu.com/?target=http%3A//tucf-genomics.tufts.edu/home/faq)

![img](https://pic1.zhimg.com/80/5ddf2f42491196c92292aec7045e15eb_720w.jpg)



- 形成这种1个cluster，1个cluster的形态，在整个flowcell中看上去，示意图如下。其中的每1个cluster就算是1群完全相同的序列。

引用自：[http://www.intechopen.com/source/html/49419/media/image2.png](https://link.zhihu.com/?target=http%3A//www.intechopen.com/source/html/49419/media/image2.png)

![img](https://picb.zhimg.com/80/233cd4e4eebbf1cfabb458c1b8928ac2_720w.png)

## **4.测序**

- 测序的过程反而简单了不少。就是来一个primer，然后加入特殊处理过的A，T，C，G四种碱基。特殊的地方有两点，一个是脱氧核糖3号位加入了叠氮基团而不是常规的羟基，保证每次只能够在序列上添加1个碱基；另一方面是，碱基部分加入了荧光基团，可以激发出不同的颜色。
- 特殊处理的脱氧核糖核酸，引用自：[http://www.oezratty.net/](https://link.zhihu.com/?target=http%3A//www.oezratty.net/wordpress/wp-content/LaserGen-reversible-terminator.jpg)，图中的核糖的羟基应该换成-N2的叠氮基团。

![img](https://pic2.zhimg.com/80/cc5e56741b5445d772a3959447122bba_720w.png)

- 在测序过程中，每1轮测序，保证只有1个碱基加入的当前测序链。这时候测序仪会发出激发光，并扫描荧光。因为一个cluster中所有的序列是一样的，所以理论上，这时候cluster中发出的荧光应该颜色一致。一个测序扫描图片如下：

![img](https://picb.zhimg.com/80/87e61ae2bb88b212a421e99659517b32_720w.jpg)

- 随后加入试剂，将脱氧核糖3号位的—N2改变成—OH，然后切掉部分荧光基团，使其在下一轮反应中，不再发出荧光。如此往复，就可以测出序列的内容。示意图如下，引用自[http://www.gendx.com/](https://link.zhihu.com/?target=http%3A//www.gendx.com/images/stories/illumina/NGS%20workflow%20sequencing%20Illumina.png)：

![img](https://pic1.zhimg.com/80/d833a9ba5250c9bb7a9617ea72c6d9a7_720w.png)

- 那为什么Illumina测序会有长度限制呢？主要是下面2点

1. 1. 测序时，经过长时间的PCR，会有不同步的情况。通俗一点讲，比如一开始1个cluster中是100个完全一样的DNA链，但是经过1轮增加碱基，其中99个都加入了1个碱基，显示了红色，另外1个没有加入碱基，不显示颜色。这时候整体为红色，我们可以顺利得到结果。随后，在第2轮再加入碱基进行合成的时候，就变成了，之前没有加入的加入了1个碱基显示红色，剩下的99个显示绿色，这个时候就会出现杂信号。当测序长度不断延长，这个杂信号会越来越多，最后很有可能出现，50个红，50个绿色，这时候我们判断不出来到底是什么碱基被合成。
   2. 测序过程中，使用的碱基是特殊处理的，有一个非常大的荧光基团修饰。在使用DNA ploymerase的时候，酶的状态也会受到底物的影响，越来越差。

到此，Illumina测序的相关内容就介绍差不多了。

最后，如果大家觉得文字比较单薄，还可以参考下面这个链接，讲解得也十分详细。测序原理视频：[Illumina测序原理](https://link.zhihu.com/?target=http%3A//v.youku.com/v_show/id_XNzEzNzk1NTA0.html)



（通量高，可以测未知序列）

















