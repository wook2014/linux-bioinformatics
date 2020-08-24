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
![](https://img-blog.csdnimg.cn/20190227215420862.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UyNXRoX2VuZ2luZWVy,size_16,color_FFFFFF,t_70)

