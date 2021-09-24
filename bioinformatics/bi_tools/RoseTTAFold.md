# <p align="center">RoseTTAFold 安装及使用</p>

1、下载
```
git clone https://github.com/RosettaCommons/RoseTTAFold
cd RoseTTAFold
```

2、配置环境
```
# 确定cuda版本
nvcc --version 

# cuda11

conda env create -f RoseTTAFold-linux.yml

# cuda10

conda env create -f RoseTTAFold-linux-cu101.yml
```

3、下载权重文件并解压
```
axel -a https://files.ipd.uw.edu/pub/RoseTTAFold/weights.tar.gz -n 12
tar xfz weights.tar.gz
```

4、安装依赖
```
./install_dependencies.sh
```

5、下载数据库
```
uniref30 [46G]解压后228G

wget http://wwwuser.gwdg.de/~compbiol/uniclust/2020_06/UniRef30_2020_06_hhsuite.tar.gz
mkdir -p UniRef30_2020_06
tar xfz UniRef30_2020_06_hhsuite.tar.gz -C ./UniRef30_2020_06

BFD [272G]解压后2.0T

axel -a  https://bfd.mmseqs.com/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt.tar.gz -n 24
mkdir -p bfd
tar xfz bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt.tar.gz -C ./bfd

structure templates[122.9G]解压后667G

wget https://files.ipd.uw.edu/pub/RoseTTAFold/pdb100_2021Mar03.tar.gz
tar xfz pdb100_2021Mar03.tar.gz
```

6、安装pyrosetta
```bash
# 创建conda环境

conda env create -f folding-linux.yml

# 激活环境

conda activate folding

# 安装pyrosetta

conda install --channel https://levinthal:paradox@conda.graylab.jhu.edu pyrosetta=2021.29+release.d8f5566
conda install --channel https://levinthal:paradox@conda.graylab.jhu.edu pyrosetta=2021.31+release.c7009b3

# 测试

python
>>> import pyrosetta
```

7、使用测试
```
cd example
../run_e2e_ver.sh input.fa .
../run_pyrosetta_ver.sh input.fa .
```

8、psipred core dumped 问题解决
```
# 从github重新下载

git clone https://github.com/psipred/psipred.git

进入文件夹下到src目录

cd psipred-master
cd src

修改sspred_avpred.c文件的241行

    char            buf[256], *p;

将256改为512

    char            buf[512], *p;

保存后编译

make

之后该文件夹下会出现chkparse、psipass2、psipred、seq2mtx四个文件
将其覆盖到conda环境下
/anaconda3/envs/RoseTTAFold/bin
```















