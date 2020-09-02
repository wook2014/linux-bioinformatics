# Perl学习之路

  [TOC]
 

---

## 基本知识点
1.三大数据类型
标量（$）,数组（@），散列（%）

2.写脚本的头和尾
```perl
#!/usr/bin/perl
use warnings;
use strict;
...
exit;
```

3.变量内插
单引号（' '）不会进行变量内插。
双引号（" "）能够进行变量内插，可以使用转义字符。

4.数组
数组中的每一个元素都是**标量值**；
通过索引/下标/偏移量/位置（从**0**开始）对数组中的元素进行访问

4.上下文环境
Perl 语言中的上下文环境类似于自然语言中的语境。
Perl 语言中有两种上下文环境：标量上下文和列表上下文。
Perl 语言中许多操作符的表现依赖于它所处的上下文环境。
```perl
#!/usr/bin/perl -w
@bases = ( 'A', 'C', 'G', 'T' ); #A C G T
$a = @bases; # 4
($a) = @bases; # A
exit;
```

5.代码格式化
```bash
perltidy *.pl
```

6.基本函数

**print**
向标准输出打印文本

**chomp**
删除变量末尾的（多个）换行符，返回删除的换行符的个数

**join**
把数组元素或者几个字符串通过分隔符连接成单个字符串

**split**
与join函数功能恰好相反，是通过指定的分隔符把字符串分割成一个一个的字段，形成一个数组返回

**open**

**close**


**my**

**local**

---



## 常用操作
1.序列拼接
```perl
#!/usr/bin/perl -w
$DNA1 = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';
$DNA2 = 'ATAGTGCCGTGAGAGTGATGTAGTA';
$DNA3 = "$DNA1$DNA2";
print "$DNA3\n\n";
exit;
```

2.转录
```perl
#!/usr/bin/perl -w
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';
$RNA = $DNA;
$RNA =~ s/T/U/g;
print "Here is the result of transcribing the
DNA to RNA:\n\n";
print "$RNA\n";
exit;
```

3.反向互补
```perl
#!/usr/bin/perl -w
$DNA = 'ACGGGAGGACGGGAAAATTACTACGGCATTAGC';

# reverse 函数：反转字符串等元素的顺序
$revcom = reverse $DNA;

# tr 函数：一次性把一个字符集翻译成新的字符
$revcom =~ tr/ACGTacgt/TGCAtgca/;
print "Here is the reverse complement DNA:\n\
n";
print "$revcom\n";
exit;
```
![tr](https://github.com/xujunbi/linux-bioinformatics/blob/master/Perl/Img/tr_usage.jpg)


4.文件读取
```perl
#!/usr/bin/perl -w
$proteinfilename = 'NM_021964fragment.pep';
open( PROTEINFILE, $proteinfilename );
@protein = <PROTEINFILE>;
print @protein;
close PROTEINFILE;
exit;
```

5.数组基本操作
```perl
@bases = ('A', 'C', 'G', 'T');
# 元素肩并肩地输出
print @bases; # ACGT
# 输出用空格分隔的元素（注意print语句中的双引号）
print "@bases"; # A C G T

# pop：从数组的末尾拿掉一个元素
$base1 = pop @bases; # @bases A C G 

# shift：从数组的开头拿掉一个元素
$base2 = shift @bases; # @bases C G

# unshift：把一个元素添加到数组的开头
unshift (@bases, $base1); # @bases T C G

# push：把一个元素添加到数组的末尾
push (@bases, $base2); # @bases T C G A

# reverse：反转数组
@reverse = reverse @bases; # @reverse A G C T

# scalar @array：获取数组的长度（数组中元素的个数）
$nu = scalar @bases # 4

# splice：在数组的任意一个位置插入一个元素（或者删除任意一个或多个元素）
# 语法：OFFSET 和 LENGTH 定义了 ARRAY 中将要删除的部分， LIST 表示在删除的位置上要添加的元素。 如果LIST 省略，表示只删除，不增加。
splice ARRAY, OFFSET, LENGTH, LIST
# 在 LIST 情境 splice 返回移除的值.
my @others = qw(SnowWhite Humbert);
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
my @who = splice @dwarfs, 3, 2, @others;
print "@who\n"; # Sleepy Sneezy

#在 SCALAR 情境，返回最后一个移除的值，如果没有值被移除，则返回 undef。
my @others = qw(SnowWhite Humbert);
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
my $who = splice @dwarfs, 3, 2, @others;
print "$who\n"; # Sneezy

#参数为负值？
#偏移值(OFFSET)和长度(LENGTH)值都可以为负数，表示从数组的末尾算起。

my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
my @who = splice @dwarfs, 3, -1;
print "@who"; # Sleepy Sneezy Dopey
#偏移为3，即从第四个算起，-1 表示直到整个数组的倒数第一个。

my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
my @who = splice @dwarfs, -3, 1;
print "@who"; # Sneezy
#从倒数第三个开始，向右移除的第一个元素。
```
















