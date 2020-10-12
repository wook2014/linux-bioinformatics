# NCBI ENTREZ DIRECT UNIX E-UTILITIES
A few useful examples for NCBI edirect utilities.

```bash
# Download a sequence in fasta format from NCBI using accession number
esearch -db nucleotide -query "NC_001552" | efetch -format fasta > output.fasta
```
```bash
# Batch retrieval for all proteins for taxon ID. This example will download all proteins for viruses in fasta format.
esearch -db "protein" -query "txid10239[Organism]" | efetch -format fasta > output.fasta
```

```bash
# Download sequences infasta format from NCBI using edirect using isolate info

esearch -db nucleotide -query "GDST008"|efetch -format fasta > output.fasta
```

```bash
# Download sequences from NCBI using edirect using bioproject accession or ID
esearch -db bioproject -query "PRJNA285593" | elink -target nuccore|efetch -format fasta
esearch -db bioproject -query "285593[id]" | elink -target nuccore|efetch -format fasta
```

```bash
# Get all CDS from a genome
esearch -db protein -query 302315370| elink -target nuccore|efetch -format ft| grep -A 4 --no-group-separator CDS
esearch -db protein -query 302315370 | elink -target nuccore|efetch -format fasta_cds_na| grep YP_003815423.1
```

```bash
# Get taxonomy ID from protein accession number
esearch -db protein -query "NP_066243"| elink -target taxonomy |efetch -format uid
#use gi instead
esearch -db protein -query "10314000"| elink -target taxonomy |efetch -format uid
```

```bash
# Get taxonomy ID from accession number using esummary
esearch -db nucleotide -query "NC_001552"|esummary|grep TaxId
```

```bash
# Get full lineage from accession number
# Tip : xtract can be used to fetch any element from the xml output
esearch -db protein -query "NP_066243"| elink -target taxonomy |efetch -format xml |xtract -element Lineage
```

```bash
# Get scientific name from accession number
esearch -db protein -query "NP_066243"| elink -target taxonomy |efetch -format xml |xtract -element ScientificName|cut -f1
```

```bash
# Download all refseq protein sequences for viruses
esearch -db "protein" -query "txid10239[Organism] AND refseq[filter]"|efetch -format fasta > refseq_protein_viruses.fa
```

```bash
# Download reference genome sequence from taxonomy ID
# Note: Using efilter command
esearch -db taxonomy -query "txid11053 [Organism]"|elink -target nuccore|efilter -query "refseq"|efetch -format fasta >output.fa
```

```bash
# Get all proteins from a genome accession
elink -db nucleotide -id JN420361.1 -target protein|efetch -format DocSum
#Downloads protein sequences in fasta format
elink -db nucleotide -id JN420361.1 -target protein|efetch -format fasta
#Get GI for these protein
elink -db nucleotide -id JN420361.1 -target protein|efetch -format uid
#Retrieve accession numbers of the protein
elink -db nucleotide -id JN420361.1 -target protein|efetch -format acc
```

```bash
# Extract genome accession from protein accession – DBSOURCE attribute in genbank file and an alternative to the script mentioned in one of my earlier blog post.
# Note: Following command would work with protein accession and GIs used as -id parameter in elink command.
elink -db protein -id 817524604 -target nuccore|efetch -format acc
#Use protein accession instead of GI as -id
elink -db protein -id YP_009134732.1 -target nuccore|efetch -format acc
```


More info about NCBI Entrez Direct E-utillities is available on the NCBI website. http://www.ncbi.nlm.nih.gov/books/NBK179288/
