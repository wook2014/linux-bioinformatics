# <p align="center"> Generating consensus sequence from bam file </p>

## Required software
+ bowtie2
+ samtools
+ bcftools
+ seqtk

## workflow
```bash
# Create bowtie2 database
bowtie2-build ref.fasta ref.index

# bowtie2 mapping
# samtools:  sort .sam file and convert to .bam file
# single end
bowtie2 -x ref.index -U SAMPLE.fastq --no-unal | samtools sort -O bam -@ 10 -o - > *.bam

# pair end
bowtie2 -x ref.index -1 R1.fq -2 R2.fq | samtools sort -O bam -@ 10 -o - > *.bam

#  Get consensus fastq file
#Note that the input BAM file must be sorted before it can be used by this tool.
# vcfutils.pl is part of bcftools
samtools mpileup -uf ref.fa *.bam | bcftools view -cg - | vcfutils. pl vcf2fq > cns.fq

# Convert .fastq to .fasta and set bases of quality lower than 20 to N
seqtk seq -aQ64 -q20 -n N cns.fastq > cns.fasta
```













