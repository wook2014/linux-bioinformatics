# Perl学习之路
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
数组中的每一个元素都是**标量值**
通过索引/下标/偏移量/位置（从**0**开始）对数组中的元素进行访问

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


















