# bioedit 基本操作

Presentation Transcript
综合序列分析软件BioEdit 2003级 高芳銮

BioEdit简介 • BioEdit是一个性能优良的免费的生物序列编辑器，可在Windows 95/98/NT/2000中运行，它的基本功能是提供蛋白质、核酸序列的编辑、排列、处理和分析。 • 与DNAMAN相比，其分析内容相对丰富一些，而且提供了很多网络程序的分析界面和接口，与DNAMAN等软件配合使用更好。 • 尤其值得一提是利用BioEdit能够十分方面地根据指定的核酸序列绘制相应的质粒图谱。

序列的常规操作： 序列输入：多种序列输入方式； 序列分类：按标题、位置 、定义、参数、注释等分类； 成对排列：两序列的最佳排列及计算同一性和类似性； 序列屏蔽：仅采用联配中部分区域进行分析而排除其他。 核酸分析：组成、互补、反转、翻译、质粒、限制性内切酶； 蛋白质分析：氨基酸成分、疏水性轮廓 、疏水力矩平均数 翻译或反翻译：把DNA或RNA翻译成蛋白质； 切换翻译：在核酸和编码蛋白质序列中切换核苷酸序列； 点图[成对比较]：相互比较两序列的矩阵，生成一个点图。

BLAST • 本地使用BLAST • 创建本地数据库 • 本地BLAST 搜寻 • BLAST INTERNET 客户端程序 • ClustalW • 进化分析 • 使用互联网工具 • HTML BLAST 网络浏览器 • PSI-BLAST • nnPredict …

主要内容 • 绘制质粒图 • 限制性内切酶图 • 蛋白质分析 • 组成分析 • 熵图 • 疏水性轮廓 • 联配中搜寻保守区 • 根据密码子的使用翻译核苷酸 • RNA比较分析 • 共变 • 潜在配对 • 互交信息分析


一、绘制质粒图（Plasmind drawing） 　使用BioEdit质粒绘图功能，序列可以通过自动的位置标记，自动修改成环形质粒。特征、多连接位点和限制性位点可以通过使用对话框增加。当将一个序列进入质粒图时，在背景上出现一个限制性内切酶图谱，所以可以通过对话框选择可以增加限制性位点。它们自动增加到当前的位点。质粒功能提供简单的绘制和标记工具。标签和绘图可以通过鼠标移动和缩放。想要编辑目标性质，双击目标。 　　想要从一个DNA序列产生一个质粒，从“Sequence ”菜单中“Nucleic Acid ”子菜单中选择“Create Plasmid from Sequence ”选项。选择这个选项时，限制性内切酶图谱将会使用通常商业化的，储存在存储器中的限制性内切酶。质粒第一次产生时，它显示成有10个位点标记的圆圈，中央是标题 。

1.Restriction sites:(限制性位点) 　　想要增加限制性位点，从“Vector ”菜单中选择“Restriction Sites ”选项。将会显示一下对话框：

　　想要显示图谱中的限制性内切酶，从右边(“Don't Show ”中)选择任何想要的酶，用按钮将它们移动到左边。按下“Apply & Close ”时，这个位点就会增加到图谱中。指定的酶如果只有一个酶切位点,就会在酶切位点上出现一个“U ”。如果没有“U”，将会显示第一个酶切位点。想要移动图谱中酶的位置，在“Show ”中增加选择的酶的亮度，按下按钮将它们移动另一边。

2.Positional marks (位置标记): 　　点击“Vector ”菜单中的“Positional Marks ”选项，可以出现以下对话框： 　　可以通过移动位置标记到“Show” 中，单独增加位置标记，或者设定应用的分割标记数量。想要没有标记，选择“Divide into: ” 中的下拉菜单顶端的“None”。

3.Features (特征): 　　想要增加一个特征，如抗生素抵抗标记，从“Vector” 菜单选择“Add Feature”。 将显示以下对话框： 　　选择的类型是“Normal Arrow ”、“Wide Arrow ”、“Normal Box” 和、“Wide Box ”。在上面例子中的所有特征是“常规”宽度的。如果特征是一个箭头，箭头的方向将是从起点位置到终点位置。 　　增加特征或酶时，他们各自的标记增加在外面，中心是可能的尺寸。标记可以被选择工具选择、移动、编辑和缩放。

4.General Vector properties 　　载体属性可通过选 “Vector” 菜单中的“Properties ”来更改：

　　可以通过指定起点和末端位置，来增加多接头按钮。多接头显示为“Courier New ”字体。 　　在这个对话框中，特征可以被编辑、增加或者删除。想要编辑或删除一个现存的特征，在“Features”下拉式菜单中选择特征，并点击合适的按钮。点击“Add New” 按钮，可以增加一个新的特征。 　　现在只有一个圆形、单链质粒是有效的。在以后的版本中中将会改进。 “Font”按钮改变指示的默认字体。特征标记的字体将可以单独改变，但是位置标记不能单独改变。

二、Restriction Maps(限制性内切酶图) BioEdit提供两种方法产生核苷酸序列的限制性内切酶图。一种内在的限制性内切酶图功能允许产生序列最多为65,536个核苷酸的限制性内切酶图。实际上，只能检测大约35Kb， 而且在速度慢的计算机上会要消耗很长的时间。 　 你也可以通过万维网直接链接到WebCutter 限制性内切酶图上。

1.WebCutter： 点亮你想要图谱的序列标题，从“World Wide Web”菜单中选择“Auto-fed WebCutter Restriction Mapping”

2.BioEdit:点亮你想要图谱的序列标题，从“Sequence” 菜单选择“Restriction Map” 。以下选项将会显示在一个界面窗口：

—显示图谱：显示或省略序列的全图谱,互补链显示每个酶的酶切位点.默认值：yes —按照字母顺序排列名称：显示关于所有内切酶、它们的识别序列、切割频率和所有位置(5’末端开始是1) 的列表.默认值：yes —位置数：关于酶切位点的列表.默认值：no —唯一位点列表：在全部序列中只有一个酶切位点的内切酶列表.默认值：no —切割5次或更少的酶.默认值：yes —频率汇总表：关于所有正确选择的内切酶和它们切割序列的次数。默认值：no —不能切割的内切酶。默认值：yes —4-碱基内切酶： 想要包括这些酶,必须点击这个选项.默认值：no (不包括本身) —5-碱基内切酶：与4-base cutters相同. —非严格识别序列的酶：有时你可排除它们.默认值：yes —大的识别位点：通常用于克隆,只有共同的6-碱基识别酶被使用. —同裂酶：若只显示一个特殊识别位点的一个内切酶,不选(默认值=不选择). —翻　　译 ：显示沿着排列中的序列翻译(5’端到3’端的由左到右的翻译) —互补翻译 ：互补链的翻译方向相反. —编号方式 ：是酶切位点的核酸的号码,而不是识别位点的起点.

3.Restriction Enzyme Browser (限制性内切酶浏览器 ) 　　从核酸序列中得到内切酶谱时，显示酶的生产公司是很有用的。通过在内切酶图谱中选择制造厂商和按下按钮，可以手动浏览内切酶。你也可以通过选择“Options ”菜单中的“View Restriction Enzymes by Manufacturer”选择，在任何时候检查内切酶。显示如右对话框：

　 在这个例子中，所有来源于Stratagene的限制性内切酶显示在左边的列表中，KpnI的亮度增加。KpnI的识别序列显示在顶端，同裂酶显示在它的下方，其他提供KpnI的公司显示在同裂酶的下方。BioEdit使用ReBase提供的gcgenz表，限制性内切酶数据在万维网的地址是：http://www.neb.com/rebase/。可以从ReBase 下载最新的gcgenz 表，将其命名为“enzyme.tab”，并且替代在BioEdit安装文件夹中“tables ”目录下的旧文件。 注意：表必须是gcgenz格式的。你可以从tables文件夹中打开“enzyme.tab ”文件查看格式，或者查看“Restriction Maps ”。限制性内切酶表格文件名必须是“enzyme.tab ”，而且必须在BioEdit的“tables ”文件夹里。

三、蛋白质分析 1.氨基酸的组成 　　从“Sequence” 菜单下进入“Protein”, 再进入“amina acid composition”,可对序列的氨基酸组成分析，结果以摘要和图例的形式给出。 　　图例中的柱形条表示每种氨基酸在序列中的摩尔比，如下图：

以RGDV的minor outer capsid protein－AAS66885为例：

2.熵图 　　在联配文件中有专栏用熵图来衡量可变性。它衡量的是在联配中每个位置的“信息量”的缺乏。准确地说，是每个位置的可预测性的缺乏。

3.疏水性轮廓(profile) 　　平均疏水性轮廓采用Kyte &Doolittle 的方法，平均分值(总和/窗口大小)作为序列中各个位置的疏水性值，并以窗口中中间残基的疏水性值作图。

4.瞬间疏水性轮廓(hydrophobic moment profile)

5.平均瞬间疏水性轮廓

6.在联配中搜寻保守区 　　有时，即使序列之间的变化很大时，在几个序列中搜寻保守区是有用的。例如，根据一系列同源序列发现通用的PCR 引物。BioEdiot 查找的是低平均“熵”的区域。 　　首先选择你的序列，从“Aligment”->“Find Conserved Region”，对话框中各选项的内容：

BioEdit version 5.0.9 Conserved region search Alignment file: Q:\Ribosomal_RNA\some_methanos.bio 5/10/04 8:57:33 PM Minimum segment length (actual for each sequence): 15 Maximum average entropy: 0.2 Maximum entropy per position: 0.2 Gaps limited to 2 per segment Contiguous gaps limited to 1 in any segment 2 conserved regions found Region 1: Position 755 to 774 Consensus: 755 AUUAGAUACCCGGGUAGUCC 774

Segment Length: 20 Average entropy (Hx): 0.0155 Position 755 : 0.0000 Position 756 : 0.0000 Position 757 : 0.0000 Position 758 : 0.0708 Position 759 : 0.0000 Position 760 : 0.0000 Position 761 : 0.0000 Position 762 : 0.0000 Position 763 : 0.0000 Position 764 : 0.0708 Position 765 : 0.0000 Position 766 : 0.1679 Position 767 : 0.0000 Position 768 : 0.0000 Position 769 : 0.0000 Position 770 : 0.0000 Position 771 : 0.0000 Position 772 : 0.0000 Position 773 : 0.0000 Position 774 : 0.0000

Region 2: Position 1206 to 1222 Consensus: 1206 ACACGCGGGCUACAAUG 1222 Segment Length: 17 Average entropy (Hx): 0.0182 Position 1206 : 0.0000 Position 1207 : 0.0000 Position 1208 : 0.0000 Position 1209 : 0.0000 Position 1210 : 0.0708 Position 1211 : 0.0708 Position 1212 : 0.0000 Position 1213 : 0.1679 Position 1214 : 0.0000 Position 1215 : 0.0000 Position 1216 : 0.0000 Position 1217 : 0.0000 Position 1218 : 0.0000 Position 1219 : 0.0000 Position 1220 : 0.0000 Position 1221 : 0.0000 Position 1222 : 0.0000

结果： BioEdit version 5.0.9 Conserved region search Alignment file: G:\Ribosomal_RNA\some_methanos.bio 5/10/99 9:34:06 PM Minimum segment length(actual for each sequence): 10 Maximum average entropy:0.4 Maximum entropy per position: 0.4 with 2 exceptions allowed Gaps limited to 2 per segment Contiguous gaps limited to 1 in any segment 36 conserved regions found

7.根据密码子的使用翻译核苷酸 　　核苷酸序列可根据三联体密码翻译预测的蛋白序列。 　　从“Sequence”->“Protein”->“Translation”, 选择要按何种读框翻译。 　　例如，以下是一个假设的Methanobacterium(甲烷细菌)的ORF(开放阅读框架)。

>MTH671 coding region ATGGTTGCAGTACCCGGCAGTGAGATACTGAGCGGTGCACTACACGTTGTCTCCCAGAGCCTCCTCATACCGGTTATA GCAGGTCTACTGTTATTCATGGTATACGCCATAGTGACCCTCGGAGGGCTCATATCAGAGTACTCTGGAAGGATAAGG ACTGATGTTAAGGAACTTGAATCGGCAATAAAATCAATTTCAAACCCAGGAACCCCTGAAAAGATAATTGAGGTCGTC GATTCGATGGACATACCACAGAGCCAGAAGGCCGTGCTCACTGATATCGCAGGGACAGCTGAACTCGGACCAAAATCA AGGGAGGCCCTCGCAAGGAAGTTGATAGAGAATGAGGAACTCAGGGCTGCCAAGAGCCTTGAGAAGACAGACATTGTA ACCAGACTCGGCCCAACCCTTGGACTGATGGGGACACTCATACCCATGGGTCCAGGACTCGCAGCCCTCGGGGCAGGT GACATCAATACACTGGCCCAGGCCATCATCATAGCCTTCGATACAACAGTTGTGGGACTTGCATCAGGGGGTATAGCA TACATCATCTCCAAGGTCAGGAGAAGATGGTATGAGGAGTACCTCTCAAATCTTGAGACAATGGCCGAGGCAGTGCTG GAGGTGATGGATAATGCCACTCAGACGCCGGCGAAGGCTCCTCTCGGATCAAAA

A frame 1 of this sequence is displayed as follows in the BioEdit text editor: >MTH671 coding region 1 ATG GTT GCA GTA CCC GGC AGT GAG ATA CTG AGC GGT GCA CTA CAC 45 1 Met Val Ala Val Pro Gly Ser Glu Ile Leu Ser Gly Ala Leu His 15 46 GTT GTC TCC CAG AGC CTC CTC ATA CCG GTT ATA GCA GGT CTA CTG 90 16 Val Val Ser Gln Ser Leu Leu Ile Pro Val Ile Ala Gly Leu Leu 30 91 TTA TTC ATG GTA TAC GCC ATA GTG ACC CTC GGA GGG CTC ATA TCA 135 31 Leu Phe Met Val Tyr Ala Ile Val Thr Leu Gly Gly Leu Ile Ser 45 136 GAG TAC TCT GGA AGG ATA AGG ACT GAT GTT AAG GAA CTT GAA TCG 180 46 Glu Tyr Ser Gly Arg Ile Arg Thr Asp Val Lys Glu Leu Glu Ser 60 181 GCA ATA AAA TCA ATT TCA AAC CCA GGA ACC CCT GAA AAG ATA ATT 225 61 Ala Ile Lys Ser Ile Ser Asn Pro Gly Thr Pro Glu Lys Ile Ile 75 226 GAG GTC GTC GAT TCG ATG GAC ATA CCA CAG AGC CAG AAG GCC GTG 270 76 Glu Val Val Asp Ser Met Asp Ile Pro Gln Ser Gln Lys Ala Val 90 …

|A C G T | ----------------------------- A |3 7 3 13 |A |0.76 0.12 0.04 0.07 | |Lys Thr Arg Ile | ----------------------------- A |1 4 4 6 |C |0.61 0.43 0.27 0.46 | |Asn Thr Ser Ile | ----------------------------- A |8 1 6 7 |G |0.24 0.23 0.03 1 | |Lys Thr Arg Met | ----------------------------- A |4 3 1 3 |T |0.39 0.21 0.13 0.47 | |Asn Thr Ser Ile | ----------------------------- ………

四、RNA 的比较分析 RNA 的结构定义为核苷酸的碱基的相互作用。最简单情况下，即螺旋中的碱基对之间的Waltson-Crick 碱基配对。RNA 结构的系统发育比较分析方法建立在如下假定上，即在进化中核苷酸改变，但重要的RNA 二级和三级结构保持不变。一个可能破坏结构的碱基变化可以由序列中另一处的变化补偿以保持结构稳定。所以不同物种的同源RNA 中将包含“补偿碱基变化”或“共变化，协变（covariation） ”。所以通过检查来自各个不同生物的同源RNA ，确定这些“补偿碱基变化”，从而阐明结构。 　　例如，一给定的序列，GAAGA 将可能与序列中任一UCUUC 配对，而后者可能在序列中出现数次。如何确定到底是和哪一个配对呢？可以检查不同生物的同源RNA 序列，找出“补偿碱基变化”。

organism #1 ‑‑‑‑‑GAAGA‑‑‑‑‑‑‑‑‑UCUUC‑‑‑‑‑‑‑‑UCUUC‑‑‑‑‑‑‑‑‑UCUUC‑‑‑‑‑‑‑ organism #2 ‑‑‑‑‑GAUGA‑‑‑‑‑‑‑‑‑UCUUC‑‑‑‑‑‑‑‑UCUGC‑‑‑‑‑‑‑‑‑UCAUC‑‑‑‑‑‑‑ organism #2 ‑‑‑‑‑GAUGA‑‑‑‑‑‑‑‑‑GCUUC‑‑‑‑‑‑‑‑UCUAC‑‑‑‑‑‑‑‑‑UCAUC‑‑‑‑‑‑‑ organism #2 ‑‑‑‑‑GACGA‑‑‑‑‑‑‑‑‑UCUUC‑‑‑‑‑‑‑‑UCUGC‑‑‑‑‑‑‑‑‑UCGUC‑‑‑‑‑‑‑ 　　在此例中，只有最后一个UCUUC 才可和GAAGA 配对。象这样在序列中2 个位置出现“补偿碱基变化”，被认为是螺旋存在的证据。两条序列不能形成互补，表明不存在配对。在“系统发育比较分析”中关键是序列联配，同源序列必须适当联配。此处同源性是严格意义的：同源的核苷酸来自一个共同的祖先。所以开始时，先使用关系紧密的序列进行联配，这样在序列相似性基础上联配，不需要加入许多联配的空位。联配后互补序列的“协变”可被立即发现，从而开始构建二级结构,然后差异大的序列可以添进联配中。这样持续添加新序列，进行“协变”分析，直到联配和二级结构模型出现此过程的完全描述。一旦一个完整的二级结构模型形成，“协变”分析可以鉴定非螺旋区的核苷酸之间的相互作用以及不规则的相互作用。之所以可以被鉴定,是因为涉及的核苷酸即使不形成规则的碱基配对或是一个螺旋的一部分，也仍一致的变化。

1.共变化(Covariation) • 　　共变化指序列中两个残基步调一致地变化。严格地讲即每当联配序列中x 变化时，y 也变化，两者是一致的。（例如，当x 变为A ，y 变为T 。每次x 变为A，y 一定变为T）。 残基间的共变化表明，它们之间一定有重要的相互作用，当重要结构残基突变时，自然选择保留了那些有补偿突变的序列。 • 共变化的例子 • 　　假设我们现有一个联配序列，它表示了几种物种共有的一个特定的RNA 的保守的结构。我们希望从联配中包含的信息推测出RNA 二级结构。

下面是一个联配的例子 ....|....| ....|....| ....|.... 10 20 sample 1 CCGGAUACGA UCGUCGGGUA CGUAUCCGG sample 2 CCGGAUACUA UCUUGGCGAA AGUAUCUGG sample 3 CGGGAUACGA UCGACGCGUA CGUAUCCCG sample 4 CGCGGUACCA UCCACCCCUA GGUACCGCG sample 5 CCGGAUACGA UCGUCCCGUU CGUAUCCGG sample 6 CCGGAUACGA UCGUCGGGUA CGUAUCCGG sample 7 CCGGACACGA UCGUCGGGUA CGUAUCCGG sample 8 CCAGAUACGA UCGAAACUUU CGUAUCUGG sample 9 CCGGUUACCA UCGUCGGGUA GGUAACCGG sample 9 CCGGAUACGA UCGACAGGAA CGUAUCCGG sample 10 CCGGAUACGA UCGUCCCGUA CGUAUCCGG sample 11 CCGGAUACGA UCGUCGGGUA CGUAUCCGG sample 12 CCUGAUACUA UCGUCGCCUA AGUAUCGGG sample 13 CGGGGUACGA UCGAGGCCUA CGUACCCCG sample 14 CCCGCUACGA UCGAGGCCUU CGUAGCGGG sample 15 CCGGAUACGA UCGAGGCCUU CGUAUCCGG

Covariation analysis Input file: I:\BioEdit\help\samples.gb Position numbering is relative to the alignment numbering. No mask was used. 1 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position 2: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 2 CCGGCCCCCCCCCGCC 28 GGCCGGGGGGGGGCGG All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 3 GGGCGGGAGGGGUGCG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 4 GGGGGGGGGGGGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position 5: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 5 AAAGAAAAUAAAAGCA 25 UUUCUUUUAUUUUCGU All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 7 AAAAAAAAAAAAAAAA ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 8 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position 9: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 9 GUGCGGGGCGGGUGGG 21 CACGCCCCGCCCACCC All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 10 AAAAAAAAAAAAAAAA ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 11 UUUUUUUUUUUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 12 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 13 GUGCGGGGGGGGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 14 UUAAUUUAUAUUUAAA ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 15 CGCCCCCACCCCCGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 16 GGGCCGGAGACGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 17 GCCCCGGCGGCGCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 18 GGGCGGGUGGGGCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 19 UAUUUUUUUAUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 20 AAAAUAAUAAAAAAUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position 21: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 21 CACGCCCCGCCCACCC 9 GUGCGGGGCGGGUGGG All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 22 GGGGGGGGGGGGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 23 UUUUUUUUUUUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 24 AAAAAAAAAAAAAAAA ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position 25: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 25 UUUCUUUUAUUUUCGU 5 AAAGAAAAUAAAAGCA All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 26 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 27 CUCGCCCUCCCCGCGC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position 28: ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 28 GGCCGGGGGGGGGCGG 2 CCGGCCCCCCCCCGCC All potential Watson Crick or G‑U pairs ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 29 GGGGGGGGGGGGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

　　在上述联配中共有3 对“共变化”的位置点：2/28， 5/25 ，9/21。两个碱基共变表明它们很可能相互作用。如果一个突变发生在与其他碱基有重要作用的碱基上（常是碱基对），选择压力可能会只保留在另一处碱基上发生补偿突变的碱基。事实上，上述的碱基共变化都发生在规则的碱基对（Watson-Crick 碱基对或在RNA 中G-U ）表明它们可能是碱基配对。共变化碱基对2/5 分别和5/25 的距离相同，而5/25 分别和9/21 的距离也相同，而且界于它们之间的碱基也可形成碱基互补，这都表明联配序列的两端可能闭合形成螺旋如下是“Sample1”形成的结构。 U C A G -- C C G G A T A C G U -- G G C C T A T G C C A G U G G

2.潜在配对分析potential pairing 　　当RNA 分子中两个核苷酸之间存在配对碱基的相互作用力。一个碱基发生突变，另一个碱基为了补偿这一突变，可能不仅仅是某一特定核苷酸突变（例如原来的A-T 配对可能在一序列中转换为G-C,而另一序列中为G-U, ）这在共变化分析中将被忽略。因为此种改变并不遵循完全相同的模式。要鉴定这种情况，可以在潜在配对中选定碱基配对的规则。 　　仍用上例中的序列（sample 1 － sample 15略） BioEdit 中并不要求有位置变化，所以未改变的位置上只要可以形成碱基对，也能被发现同时也可在“preference”中设置以滤出未改变的位置之间的碱基配对。以下是一个联配序列它和在共变化分析中使用的相同。设置允许A-U/G-C/G-U 碱基配对规则以及1 个错配，产生下列的结果（以清单格式，滤除了未变化位置的潜在配对）比较这一结果和共变化的结果，发现位置3/27 有一潜在的配对，而共变化的结果未检出。潜在配对的数据也可以按允许的配对出现的频率或原始允许配对的数目列出一个（二维矩阵）表。

Potential Pairings List Input File: I:\BioEdit\help\samples.gb Allowed Mispairings = 1 16 total sequences, 29 nucleotides per sequence. Axes reflect numbering of the entire alignment. No Mask was used. Hits on invariant pairs have been filtered out. ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 1 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 2 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 2 CCGGCCCCCCCCCGCC 28 GGCCGGGGGGGGGCGG 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position: 3 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 3 GGGCGGGAGGGGUGCG 27 CUCGCCCUCCCCGCGC 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 4 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 4 GGGGGGGGGGGGGGGG 6 UUUUUUCUUUUUUUUU 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 5 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 5 AAAGAAAAUAAAAGCA 25 UUUCUUUUAUUUUCGU 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position: 6 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 4 GGGGGGGGGGGGGGGG 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 7 AAAAAAAAAAAAAAAA 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 10 AAAAAAAAAAAAAAAA 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 22 GGGGGGGGGGGGGGGG 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 24 AAAAAAAAAAAAAAAA 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 6 UUUUUUCUUUUUUUUU 29 GGGGGGGGGGGGGGGG 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position: 7 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 7 AAAAAAAAAAAAAAAA 6 UUUUUUCUUUUUUUUU 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 8 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 9 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 9 GUGCGGGGCGGGUGGG 21 CACGCCCCGCCCACCC 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 10 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 10 AAAAAAAAAAAAAAAA 6 UUUUUUCUUUUUUUUU 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

11 UUUUUUUUUUUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 12 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 13 GUGCGGGGGGGGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 14 UUAAUUUAUAUUUAAA ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 15 CGCCCCCACCCCCGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 16 GGGCCGGAGACGGGGG ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 17 GCCCCGGCGGCGCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 18 GGGCGGGUGGGGCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 19 UAUUUUUUUAUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 20 AAAAUAAUAAAAAAUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position: 22 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 22 GGGGGGGGGGGGGGGG 6 UUUUUUCUUUUUUUUU 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 23 UUUUUUUUUUUUUUUU ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 24 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 24 AAAAAAAAAAAAAAAA 6 UUUUUUCUUUUUUUUU 1 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑  Position: 25 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 25 UUUCUUUUAUUUUCGU 5 AAAGAAAAUAAAAGCA 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 26 CCCCCCCCCCCCCCCC ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ Position: 27 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 27 CUCGCCCUCCCCGCGC 3 GGGCGGGAGGGGUGCG 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

Position: 28 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 28 GGCCGGGGGGGGGCGG 2 CCGGCCCCCCCCCGCC 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑  Position: 29 ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑ 29 GGGGGGGGGGGGGGGG 6 UUUUUUCUUUUUUUUU 0 mis‑matches ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

3.交互信息分析（Mutual Information Analysis） • 概述 • 　　交互信息，象在系统发育比较分析中的应用一样，主要是衡量在一个适当联配中两个位置共有信息的信息量。符号是M(x,y)(位置x,y 的相互信息) 。M(x,y)表明两个位置相关的紧密程度。此相关程度显示了两位置的直接相互作用，如碱基配对。BioEdit 另外计算R1 和R2 两个参数，它们分别表示位置x,y 对M(x,y)的贡献。

什么是交互信息 • 　　交互信息分析是以下思想的拓展--即对某个特定位置的不确定性表示是信息含量的下降。在预先对某位置一无所知的情况下（如RNA 中核苷酸），不确定性最大。但一旦确定了某位置是什么核苷酸时,不确定性消除了,此位置的信息量达到最大。现在考虑有多条序列，在某位置均含有一个同源核苷酸。知道第一条序列上此位置上的核苷酸并不能为确定第二条或随机的一条序列中此序列的核苷酸提供多少信息。但是如果已知此位置在许多乃至几乎所有序列中均为某一特定碱基（如C ），而不是其它的碱基（如G），则我们积累了相当多的“信息”，可预测另一个未检测的序列中，在此位置某核苷酸出现的可能性。即在另一未检测的序列中，此位置核苷酸的不确定性下降了。

　　交互信息进一步拓展了这一思想，对配对位置的信息量进行检查，此信息量依赖于并联系每个位置单独的信息量，但不能将两者混淆。总的讲，它衡量不确定性的下降，此不确定性指两种事物相互影响相互作用的程度。Robin Gutell 发展了用交互信息预测RNA 结构的方法，也很适合系统发育比较分析，因为两个位置交互信息高也提示这2 个残基直接相互作用。 如左图总共8 个序列，其中位置1，4 是不改变的,信息量最大。位置2 ，3 中C/G/U/A 各出现了2 次，信息量为0 ，我们无法预测下一个序列中这两个位置的核苷酸，但位置2 ，3都含有它们之间是如何影响彼此的共有信息。我们不能猜出新一序列中位置2 的核苷酸，但如果告诉我位置3 是C，我们可以推断出位置2 是G，这即建立在“交互信息分析” （它们遵循共同的配对模式）交互信息也表明这些碱基可能相互作用。 1 2 3 4 A C G U A C G U A G C U A U A U A U A U A A U U A A U U A G C U

交互信息示例 • 　　以下是分析细菌RNase P RNA 的部分序列的一个例子。　　点击（Aligment）可以观察此联配。设置输出是全部列表（full table）显示M(x,y)的数值。Nbest 列出各个位置5 个高分值。序列和编号mask 都是根据E.coli. 。序列的编号是根据E.coli的mask序列。此序列中包含了一个RNase P RNA 结构区域的“cruciform region”(十字型区域) 。由于矩阵文件太大，不能在此说明文件中打开观察。但可通过打点作图方便地观察。在BioEdit 矩阵作图程序中，数据既可以数字也可以图形的方式被动态的检查。

　　其中交互信息分析的“cruciform region” (十字型区域)在此输出中是环型的。此图象及全部最新的细菌和古细菌的RNase P RNA 结构和序列均可在RNase P 数据库中找到。http://jwbrown.mbio.ncsu.edu/RNaseP • 交互信息的作图示例 　细菌RNase P RNA 联配的一部分,共有包含极丰富信息的138 条序列。序列包含 “cruciform region”(十字型区域) 。 [具体数据详见文本]。

使用矩阵打点作图器分析交互信息数据 　　例如使用E.coli 作为序列和编号masks ，对146 条细菌RNase P RNA 序列进行M(x,y)分析得到的矩阵进行使用矩阵打点作图器分析交互信息数据 。 　　作图完成后 打开“数据检查器”，用鼠标在图中各点移动观察各数据点，可直接用点击某点在顶部的工具条中将出现数据值。 　　通过设置数据点的阈值在矩阵作图中遮蔽（shading）某些数据点，当仅需要显示出高分区域时，此选择可能有用。 　　下面的细菌RNase P RNA 联配的交互信息数据作图（E.coli 作为mask）。在图中很难挑出某一核苷酸三联体，虽然碱基配对的位置94 和104 是明显可见的，但很难挑出配对核苷酸94-104 及第三个核苷酸316 组成的三联体。

　　此图是联配的全部M(x,y)列表格式的部分图示，设置固定数据点大小为3*3象素。鼠标箭头指向位置94-104，右边的小红色框中心是位置94-316。　 此图中位置316和位置94，104的相互作用并不明显，从作图窗口下“Plot”“Line Graph of Rows”进入一维行向作图。

　　下图显示第316 行的作图用“Row”旁边的上下箭头选择要观察的行或直接在框中输入要观察的行。可移动图中的蓝十字点击任何位置，将在顶部工具条的左上方列出位置x,y 及数据值。其中数据值是指图中位置的高峰对应的数值。

交互信息检查器(mutual information examiner) 　　如果希望在联配窗口中观察任意两个位置的交互信息，从“View”菜单下进入“mutual information examiner”，下面是控制条的格式 。

　　在“x”,”y”旁边输入要分析的位置。如果希望某一特定序列上此位置的信息（序列需无“gap”）, 就把此序列设为“numbering mask”,再输入x、y 的位置。图中的x、y 位置（x=261,y=289）对应的是前面在矩阵作图时选择的数据点。一定要将需要分析的序列全部选中。 最后点击“calculate”,将出现以下窗口。

　　在上图窗口中点击“Text”, 将出现如下文本编辑窗口，内容可复制和粘贴。

　　如果采用此位置输入是X=a-b,Y=c-d, 同时计算几对位置，BioEdit 假设你要分析是螺旋区域，即位置是反向平行的，所以c-d 和d-c 是不区分的。如果你要特别地指明某对的顺序，要采用X=a,b,c,d Y=e,f,g,h.的形式的输出。 ------------------------------------------------------------------- 附： BioEditV5.09： 官方下载 红意下载 汉化补丁 BioEditV6.0.5:分卷1 分卷2

谢谢！



---
参考资料
+ [综合序列分析软件 BioEdit ](https://www.slideserve.com/nowles/bioedit)
