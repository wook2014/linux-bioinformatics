# Perl学习之路

  [TOC]
 
---

## 基本知识点
1.三大数据类型
+ 标量（$）,数组（@），散列（%）

2.写脚本的头和尾
```perl
#!/usr/bin/perl
use warnings;
use strict;
...
exit;
```

3.变量内插
* 单引号（' '）不会进行变量内插。
* 双引号（" "）能够进行变量内插，可以使用转义字符。

4.数组
+ 数组中的每一个元素都是**标量值**；
+ 通过索引/下标/偏移量/位置（从**0**开始）对数组中的元素进行访问

5.上下文环境
+ Perl 语言中的上下文环境类似于自然语言中的语境。
+ Perl 语言中有两种上下文环境：标量上下文和列表上下文。
+ Perl 语言中许多操作符的表现依赖于它所处的上下文环境。
```perl
#!/usr/bin/perl -w
@bases = ( 'A', 'C', 'G', 'T' ); #A C G T
$a = @bases; # 4
($a) = @bases; # A
exit;
```

6.代码格式化
```bash
perltidy *.pl
```

7.基本函数

**print**
+ 向标准输出打印文本

**chomp**
+ 删除变量末尾的（多个）换行符，返回删除的换行符的个数

**join**\n
+ 把数组元素或者几个字符串通过分隔符连接成单个字符串

**split**
+ 与join函数功能恰好相反，是通过指定的分隔符把字符串分割成一个一个的字段，形成一个数组返回

**open**
+ open函数用于打开文件
```perl
open (my $fh, "<","test.txt") or die "Can't open < test.txt: $!";
# $fh是文件句柄，后面我们将通过文件句柄来引用该文件。
# < 表示以读模式打开文件，这意味着我们无法在该文件上写入任何内容。
# test.txt是我们要打开的文件的名称。它必须存在于正确的目录底下。
# or die "Can't open < test.txt:$!" 表示如果计算机无法打开文件，它将显示错误信息。 $ _存储错误信息。
```
**close**
关闭文件
```perl
close($fh)  or "Couldn't close the file: $!";
# 可以操作已经打开的文件句柄来关闭文件
```

**tr**
```perl
（1）/c表示把匹配不上的字符进行替换.
$temp="AAAABCDEF";
$count=$temp=~tr/A/H/c;
print "$temp\t$count\n";
结果：AAAAHHHHH 5

（2）/d:表示把匹配上的字符全部替换
$temp="AAAABCDEF";
$count=$temp=~tr/A/H/d;
print "$temp\t$count\n";
结果：HHHHBCDEF 4

(3)/s：表示如果要替换的字符中出现连续多个一样的字符，则去冗余：
$temp="AAAABCDEF";
$count=$temp=~tr/A/H/ds;
print "$temp\t$count\n";
结果：HBCDEF 4

$temp="AAAABCDEF";
$count=$temp=~tr/A/H/cs;
print "$temp\t$count\n";
结果：AAAAH 5

$count=$temp=~tr/A//; #表示计算$temp中出现A的次数，$temp并不改变值
$count=$temp=~tr/A/A/; #表示计算$temp中出现A的次数，$temp并不改变值
```

**substr**
```perl
$base = substr($DNA, $position, 1)
```
substr可以对字符串进行插入或者删除操作
+ 第一个参数指定要操作的字符串
+ 第二个参数指定要操作的位置索引（负值表示从字符串末尾开始）
+ 第三个参数指定要操作的长度（负值表示字符串末尾剩余的字符数）
+ 第四个参数指定要替换成的字符串

8.变量作用域

1.变量范围分为两类：全局、局部
2.全局变量标准（our）关键字、局部变量标准（my）关键字
3.（local）关键字将全局变量临时借用为局部、（state）关键字将局部变量变得持久
my 声明的变量可以和代码块外的变量重名
强制使用my 声明变量
```perl
use strict;
```
---

9.Perl 脚本中常见的bug
-括号没配对

-没用分号结尾

-索引计算错误

-变量/函数等拼写错误

-本该用减法却用成了加法

-意欲测试（==）却使用了赋值（=）

-程序设计存在逻辑缺陷 ⋯⋯


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
$proteinfilename = <STDIN>;
chomp $proteinfilename;
unless ( open( PROTEINFILE, $proteinfilename ) ) {
print "Cannot open file \"$proteinfilename\"\n\n"; exit;
}
@protein = <PROTEINFILE>;
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

6.模式匹配
```perl
#!/usr/bin/perl -w
# 文件读取
$proteinfilename = <STDIN>;
chomp $proteinfilename;
unless ( open( PROTEINFILE, $proteinfilename ) ) {
print "Cannot open file \"$proteinfilename\"\n\n"; exit;
}
@protein = <PROTEINFILE>;
close PROTEINFILE;
# 查找基序
# 将文件中的各行字符串连成一行
$protein = join( '', @protein );
$protein =~ s/\s//g;
do {
print "Enter a motif to search for: ";
$motif = <STDIN>;
chomp $motif;
if ( $protein =~ /$motif/ ) {
print "I found it!\n\n";
}
else {
print "I couldn\'t find it.\n\n";
}
} until ( $motif =~ /^\s*$/ );
exit;

```

7.文件写入
```perl
#!/usr/bin/perl -w
$outputfile = "countbase";
unless ( open( COUNTBASE, ">$outputfile" ) ) {
print "Cannot open file \"$outputfile\" to
write to!!\n\n";
exit;
}
print COUNTBASE "A=$a C=$c G=$g T=$t errors=$e\n";
close(COUNTBASE);
exit;
```












