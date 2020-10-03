# 基本操作之awk

## 基本介绍


awk -F '^CCATGTACC$' { print NF, $1, $NF }




计算多行数值求和
```bash
awk '{sum+=$1} END {print sum}' filename
```















