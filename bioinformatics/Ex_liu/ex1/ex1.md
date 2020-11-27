# <center>第一次上机实验</center>

## 一、了解常用生物数据库的

### 1. International Nucleotide Sequence Database Collaboration

![insdc](https://github.com/xujunbi/linux-bioinformatics/blob/master/bioinformatics/Ex_liu/ex1/img/insdc.png)


#### NCBI
NCBI（National Center for Biotechnology Information，美国国家生物技术信息中心）除了维护GenBank核酸序列数据库外，还提供数据分析和检索资源。NCBI资源包括Entrez、Entrez编程组件、MyNCBI、PubMed、PudMed Central、PubReader、Gene、the NCBI Taxonomy Browser、BLAST、Pimer-Blast、COBALT、RefSeq、UniGene、HomoloGene、ProtEST、dbMHC、dbSNP、dbVar、Epigenomics、the Genetic Testing Registry、Genome和相关工具、比对查看器、跟踪存档、Sequence Read Archive、BioProject、BioSample、ClinVar、MedGen、HIV-1/人类蛋白质相互作用数据库、Gene Expression Omnibus、Probe、Online Mendelian Inheritance in Animals、the Molecular Modeling Database、the Conserved Domain Database、the Conserved Domain Architecture Retrieval Tool、Biosystem、Protein Clusters and thePubChem suite of small molecule databases，所有这些资源可以在NCBI主页找到。

##### Databases

+ Assembly

一个提供有关基因组组装结构，装配名称和其他元数据，统计报告以及基因组序列数据链接等信息的数据库。

+ GenBank

NIH基因序列数据库，是所有公开可用DNA序列的注释集合。NCBI的GenBank数据库和日本DNA数据库（DDBJ），欧洲分子生物学实验室（EMBL）每天交换数据，保证数据实时跟新。 GenBank由几个部分组成，大部分序列可以通过Nucleotide数据库访问。 例外的是EST和GSS分区，分别通过Nucleotide EST和Nucleotide GSS数据库访问

+ Gene

一个可搜索的基因数据库，专注于已经完全测序的基因组，并且有一个活跃的研究团体来提供基因特异性数据。基因信息包括命名法、染色体定位、基因产物及其属性（例如，蛋白质相互作用）、相关标记、表型、相互作用、引文链接、序列、突变详情、图谱、表达报告、同源物、蛋白结构域内容和外部数据库链接。

+ Genome

包含来自1000多种生物的全基因组的序列和比对数据。 基因组代表完全测序的生物和正在进行测序的生物， 三个主要领域（细菌，古细菌和真核生物），以及许多病毒，噬菌体，类病毒，质粒和细胞器。

+ PubMed

MEDLINE和其他生命科学期刊的生物医学文献引文和摘要数据库。

+ PubMed Central (PMC)

全文生物医学和生命科学期刊文献，包括临床医学和公共卫生。

+ Reference Sequence (RefSeq)

由NCBI产生的主持的，非冗余的基因组DNA，转录物（RNA）和蛋白质序列的集合。

+ Taxonomy

包含NCBI数据库中具有分子数据的160,000多种生物的名称和系统发育谱系。

##### Tools
+ BLAST

BLAST（Basic Local Alignment Search Tool），即基于局部序列比对算法的搜索工具，是由NCBI开发和管理的一套生物大分子一级结构序列比对程序。可将输入的核酸或蛋白质序列与数据库中的已知序列进行比对，获得序列相似度等信息，从而判断序列的来源或进化关系。

+ Batch Entrez

允许你提交Nucleotide、Protein或其他Entrez数据库中的GI、登录号或其他唯一标识符的文件，从许多Entrez数据库中检索记录。

+ E-Utilities

在常规Web查询界面之外提供对NCBI Entrez系统内数据访问的工具。
命令行工具：direct-Entrez

+ Tree Viewer

用于创建和显示系统发育树数据的工具。 Tree Viewer可以分析您自己的序列数据，将可打印的矢量图像生成为PDF，并且可以嵌入到网页中。

#### EMBL-BEI




#### DDBJ
DDBJ(DNA Data Bank of Japan)，于1984年建立，是世界三大DNA 数据库之一，与NCBI的GenBank，EMBL的EBI数据库共同组成国际DNA数据库，每日都交换更新数据和信息，并主持两个国际年会－国际DNA数据库咨询会议和国际DNA数据 库协作会议，互相交换信息，因此三个库的数据实际上是相同的。


### 3. UniProt
Uniprot （Universal Protein ）是包含蛋白质序列，功能信息，研究论文索引的蛋白质数据库，整合了包括EBI（ European Bioinformatics Institute），SIB（the Swiss Institute of Bioinformatics），PIR（Protein Information Resource）三大数据库的资源。

UniProtKB/Swiss-Prot
高质量的、手工注释的、非冗余的数据集

Swiss-Prot旨在提供与高水平注释（例如，蛋白质功能，其域结构，翻译后修饰，变体等的描述）相关的可靠蛋白质序列，最小程度的冗余和高水平与其他数据库的集成级别。注释主要来自文献中的研究成果和E-value校验过计算分析结果，有质量保证的数据才被加入该数据库 。

Swiss-Prot由Amos Bairoch博士在1986年创建，由瑞士生物信息学研究所开发，随后由欧洲生物信息学研究所的Rolf Apweiler开发。也是说EBI和SIB共同制作了Swiss-Prot和TrEMBL数据库。

Swiss-Prot条目的注释中使用了一系列序列分析工具。包括手动评估，计算机预测，并选择结果包含在相应的条目中。这些预测包括翻译后修饰，跨膜结构域和拓扑，信号肽，结构域识别和蛋白质家族分类。

来自相同基因和相同物种的序列合并到相同的数据库条目中。确定序列之间的差异包含：可变剪接，自然变异，错误的起始位点，错误的外显子边界，移码，未识别的冲突。
## 二、NCBI Blast在线工具的使用及结果说明
![blast](https://github.com/xujunbi/linux-bioinformatics/blob/master/bioinformatics/Ex_liu/ex1/img/blast.jpg)

程序名	| 查询序列	|数据库	|搜索方法
|:--|:--:|:--:|:--|
Nucleotide BLAST	|核酸	|核酸	|库中存在的每条已知序列都将同所查序列作一对一地核酸序列比对。
Protein BLAST	|蛋白质	|蛋白质	|库中存在的每条已知序列将逐一地同每条所查序列作一对一的序列比对。
BLASTX	|核酸	|蛋白质	|先将核酸序列翻译成蛋白序列（一条核酸序列会被翻译成可能的六条蛋白），再对每一条作一对一的蛋白序列比对。
TBLASTN	|蛋白质	|核酸	|将库中的核酸序列翻译成蛋白序列，再同所查序列作蛋白与蛋白的比对。
TBLASTX	|核酸	|核酸	|此种查询将库中的核酸序列和所查的核酸序列都翻译成蛋白（每条核酸序列会产生6条可能的蛋白序列），这样每次比对会产生36种比对阵列。

### 4. PDB




## 一、实验目的


## 二、实验内容

### 1. NCBI Blast在线工具的使用及结果说明

+ 1. 获取SARS-CoV-2参考基因组的accession number。打开NCBI主页（[http://www.ncbi.nlm.nih.gov/](http://www.ncbi.nlm.nih.gov/)），在核酸（Nucleotide）数据库查询SARS-CoV-2，找到RefSeq后面的SARS-CoV-2参考基因组的accession number。
+ 2. 在线blast操作。打开blast页面[https://blast.ncbi.nlm.nih.gov/Blast.cgi](https://blast.ncbi.nlm.nih.gov/Blast.cgi)，进入Nucleotide BLAST。在Enter Query Sequence框中输入SARS-CoV-2参考基因组的accession number。在Choose Search Set部分选择默认的数据库。在Program Selection部分默认选择Highly similar sequences (megablast)。Algorithm parameters部分可调整Max target sequences 改变最终展现的序列的数量。Expect threshold调整E值（默认0.05，改小一点？）。点击blast运行。
+ 3. 阅读blast结果
+ 4. 下载blast结果并保存为FASTA (complete sequence)格式。


### 2. 基于序列对蛋白质进行理化性质分析

(1) 计算序列等电点和分子量  
[Compute pI/MW](https://web.expasy.org/compute_pi/)(theoretical pI (isoelectric point) and Mw (molecular weight))是计算序列的等电点和分子量的小工具。

基本操作
+ 打开网页；
+ 输入的格式可以是UniProtKB/Swiss-Prot的ID号，如ALBU_HUMAN，或UniProt的ID号，如P04406。也可以直接输入序列。注意，仅仅是序列就行了，不是Fasta格式。
+ 运行
+ submit查看整个蛋白质序列的预测结果，也可以选择某一片段。

(2) 氨基酸的理化性质分析
[ProtParam](https://web.expasy.org/protparam/)这个工具可以计算氨基酸个数(Number of amino acids),蛋白质分子量(Molecular weight)、理论等电点(Theoretical pI)、氨基酸的组成(Amino acid composition)、原子组成(Atomic composition)、总原子数(Total number of atoms)、分子式(Formula)、消光系数(Extinction coefficients)、估计半衰期(Estimated half-life)、不稳定指数(Instability index < 40 -> Stable；>40 -> Unstalbe)、脂肪系数(Aliphatic index)、亲水性平均系数(Grand average of hydropathicity)等等。需要注意的是，如果序列有修饰过的氨基酸残基，则不计算在内。也可以分析蛋白质的亲疏水性分析。 

+ 打开[ProtParam](https://web.expasy.org/protparam/)网站。
+ 输入序列。如果分析SWISS-PROT和TrEMBL数据库中序列，直接填写Swiss-Prot/TrEMBL AC号（accession number）；如果分析新序列，直接在搜索框中粘贴氨基酸序列。
+ 运行
+ submit查看整个蛋白质序列的预测结果，也可以选择某一片段。

(3) 预测特定蛋白酶或化学物质可能的裂解位点

[PeptideCutter](https://web.expasy.org/peptide_cutter/)是一个根据蛋白质序列预测特定蛋白酶或化学物质可能的裂解位点。
+ 打开[PeptideCutter](https://web.expasy.org/peptide_cutter/)网站。
+ 输入序列。如果分析SWISS-PROT和TrEMBL数据库中序列，直接填写Swiss-Prot/TrEMBL AC号（accession number）；如果分析新序列，直接在搜索框中粘贴氨基酸序列。
+ 运行。
+ 查看运行结果。切割发生在标记氨基酸的右侧（C端方向）。您可以通过在地图上单击相应的酶名称来显示单个酶的结果。

(4) 蛋白的亲疏水性分析
[ProtScale](https://web.expasy.org/protscale/)可计算和展示所选蛋白的50多种氨基酸标度（Amino acid scale）的图谱，氨基酸标度是给每种氨基酸指定的数值，比如Molecular weight（分子质量）、Number of codon（密码子数）、Bulkiness（膨胀度）等等。最常用的标度是疏水性标度，主要来源于多肽在非极性和极性溶剂中的分配实验数据。如果你对所选标度感兴趣可点击标度名称可进入详情页面，查看具体的氨基酸的标度数值和参考文献，如下图，这里正值的氨基酸具有更大的疏水性，负值越小的氨基酸则更加亲水。

+ 打开[ProtScale](https://web.expasy.org/protscale/)网站。
+ 输入序列。如果分析SWISS-PROT和TrEMBL数据库中序列，直接填写Swiss-Prot/TrEMBL AC号（accession number）；如果分析新序列，直接在搜索框中粘贴氨基酸序列。
+ 选择scale，设定窗口大小等参数。
+ 查看运行结果。

### 3. 蛋白质序列特征分析

(1) 跨膜区分析

[TMHMM](http://www.cbs.dtu.dk/services/TMHMM/)是一个蛋白质的跨膜螺旋预测的工具。
基本操作：
打开网址[TMHMM](http://www.cbs.dtu.dk/services/TMHMM/)。
上传本地的fasta文件或以fasta格式粘贴到输入框即可。如果只有序列，在最上面新建一行，以**>**开头，后面写点啥都行













## 参考资料
+ [Compute pI/Mw:计算序列等电点和分子量的工具](https://liucheng.name/862/)
+ [ProtParam预测蛋白质基本理化性质](http://www.bioengx.com/protparam%E9%A2%84%E6%B5%8B%E8%9B%8B%E7%99%BD%E8%B4%A8%E5%9F%BA%E6%9C%AC%E7%90%86%E5%8C%96%E6%80%A7%E8%B4%A8/)
+ [蛋白质分析工具](https://www.genscript.com.cn/protein-analysis.html)
+ [蛋白亲疏水性分析工具](https://www.plob.org/article/14709.html)
























## 三、蛋白质功能与结构的分析


### 2. 蛋白质序列特征分析

#### 蛋白质跨膜区的分析
TMPred
TMHMM


#### 蛋白质信号肽的分析
SignalP 



### 3. 蛋白质结构预测

#### 蛋白质二级结构预测
PredictProtein



#### 蛋白质二级结构预测
SWISS-MODEL


---
[蛋白质序列基本和特征信息分析](https://cloud.tencent.com/developer/article/1398590)

[一文极速读懂 Uniprot 蛋白质数据库](https://zhuanlan.zhihu.com/p/108602863)

[]()


