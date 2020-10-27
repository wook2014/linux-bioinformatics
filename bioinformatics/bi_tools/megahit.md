# MEGAHIT

MEGAHIT is an ultra-fast and memory-efficient NGS assembler. It is optimized for metagenomes, but also works well on generic single genome assembly (small or mammalian size) and single-cell assembly.

## Installation
```bash
# Conda
conda install -c bioconda megahit
```

## Basic usage
```bash
megahit -1 pe_1.fq -2 pe_2.fq -o out  # 1 paired-end library
megahit --12 interleaved.fq -o out # one paired & interleaved paired-end library
megahit -1 a1.fq,b1.fq,c1.fq -2 a2.fq,b2.fq,c2.fq -r se1.fq,se2.fq -o out # 3 paired-end libraries + 2 SE libraries
megahit_core contig2fastg 119 out/intermediate_contigs/k119.contig.fa > k119.fastg # get FASTG from the intermediate contigs of k=119
```
The contigs can be found final.contigs.fa in the output directory.


## Example
```bash
# Input: metagenomics sample as paired-end fastq files _1 and _2
./megahit -1 SAMPLE_1.fastq  -2 SAMPLE_2.fastq  -m 0.5  -t 12  -o megahit_result

  -m 0.5  use 50% of available memory (default: 90%,  -m 0.9)
  -t 12    use 12 threads (number of parallel processors)
```
Result: assembled contigs are in fasta file:
megahit_result/final.contigs.fa


## Calculate contig coverage and extract unassembled reads










+ [MEGAHIT](http://www.metagenomics.wiki/tools/assembly/megahit)

+ [An example of real assembly](https://github.com/voutcn/megahit/wiki/An-example-of-real-assembly)

+ [contigs output by MEGAHIT](https://github.com/voutcn/megahit/wiki/Visualizing-MEGAHIT's-contig-graph)

+ [组装与分箱](https://www.jianshu.com/p/4cbbe3458366)




