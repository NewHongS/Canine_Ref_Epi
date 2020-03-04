#!/usr/bin/

# Used assembly version: canFam3, hg38, mm10
# Gene annotation: ENSEMBL build 93

## RNA-seq ------------------------------------------------------------
# Octopus-toolkit
# -- QC: fastqc
# -- Trimming: trimmomatic
# -- Align: STAR
# Bam qc: tin.py (RSeQC)
# Make bigWig: HOMER
# Expression estimation: Cufflinks




## ChIP-seq & MBD-seq -------------------------------------------------
# Octopus-toolkit
# -- QC: fastqc
# -- Trimming: trimmomatic
# -- Align: HISAT2
# Mark duplicates: Sambamba
# Bam qc: SPP
# Make bigWig: HOMER
# Peak calling: HOMER


