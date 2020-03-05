#!/usr/bin/

## RNA-seq ------------------------------------------------------------------
# tin.py modules (RSeQC package) was used to calculate TIN (transcript integrity number) score

# Basic argument should be changed with your directory and files
gtf_file_name="Ensemble.CanFam3.1"

## Extract only conding genes information from gtf file
grep "protein_coding" ${gtf_file_name}.gtf > ${gtf_file_name}.CDG.gtf

## convet gtf file to bed format
./gtf2bed.py ${gtf_file_name}.CDG.gtf > ${gtf_file_name}.CDG.bed

## calculate TIN score
for bam in *.bam;do pre=${bam%%.*};echo $pre;tin.py -i $bam -r ${gtf_file_name}.CDG.bed;done

