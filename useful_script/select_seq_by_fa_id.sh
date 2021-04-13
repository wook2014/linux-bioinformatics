#!/usr/bin/bash

# select fasta dequence by fasta id

# by grep/seqkit

# multi-row sequence to single-row sequence
seqkit seq -w 0 test.fa > test_w.fa

grep "ORF1" -A 1 test_w.fa > fa.id

# one step
seqkit seq -w 0 test.fa | grep "ORF1" -A 1 > test_orf1.fa
