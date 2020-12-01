# 第二次上机操作

## 实验目的

1. 学习并掌握使用本地工具MEGA构建系统发育树
2. 学习并掌握使用在线工具CIPRES构建系统发育树
3. 学习并掌握使用Figtree编辑展示树文件

## 实验内容
### MEGA构建系统发育树

#### 序列导入
可以通过DATA导入数据也可以通过File导入数据：Open A File/Session。

如果打开的文件是比对结果，选择Analyze；如果打开的文件是序列文件，选择Align。

#### 多序列比对
序列导入后，选中全部序列(ctrl+A),点击软件上方Alignment，选择 Align by ClustalW，比对参数保持默认。
> 如果比对的是蛋白质序列，选择 Align by MUSCLE

比对完成后保存为fasta或meg格式。Data -> Export Alignment -> 导出的格式。

#### 构建进化树
导入比对结果，在PHYLOGENY中选择一个算法来构建进化树。

参数选择：进化树评估：Bootstrap method，Bootstrap value 一般选择1000~1500；第一次绘图时建议选择500，这样运行速度会比较快，结果合适再调至1000重新进行进化分析。其余参数保持默认

进化树构建好后，导出为nwk格式，方便后面用figtree进行美化






### CIPRES在线构建系统发育树

**需注册**


#### 上传数据
注册完后，进入Folders。点击data -> upload data -> save

#### 新建task
点击tasks -> create new task -> 填写task描述 -> 选择数据 -> 选择工具 点击RAxML-HPC2 on XSEDE (8.2.12) -> 设置参数 

具体参数的设置
+ Maximum Hours to Run (click here for help setting this correctly) ：1
+ Set a name for output files ：给输出文件命名
+ Enter the number of patterns in your dataset ：一般省缺就好
+ Please select the Data Type ：数据类型
+ 









#### 参数设置



#### 构建进化树








### 进化树美化

#### 
2. 打开 Layout 布局标签，红框部分是不同的呈现格式，按要求选择；Zoom 标签是调整图的大小； Expansion 标签是调整图的高度；Fish eye 进行布局调整；Root length 是调节根的长度；Cuevature 是 调整角分支的线条；

3.Appearance 标签 Line weight 可调整分支的粗细；

4.Tip lables 标签，加上样本名；还可以改变样本名大小以及颜色；

5.Node labels 是添加节点标签；可以改变样本名大小以及颜色，sig digits 选项可以改变小数保留位数；

6.Node shapes 是改变节点形状以及大小；

7.Branch labels 是添加分支标签，可以改变字体颜色和大小， sig digits 选项可以改变小数保留位数

8.Scale bar 是增加标尺

9.Scale axis 是增加最下方的标尺；勾选掉 show grid 选项可以删除竖线部分；

10. Time scale 标签是调节最下方坐标轴的，scale by factor 是默认选项，scale root to 选项可改变轴的最大值。

11.Hilight 标签可以改变分支的颜色；










---
[FigTree构建进化树（柱状）教程](http://www.360doc.com/content/19/0125/12/52645714_811199917.shtml)
[一文读懂进化树（图文详解）](https://zhuanlan.zhihu.com/p/141835886)

