#!/bin/bash

## Path and variables
input_folder="/Directory/Bed/Homer"
memory_limit="80G"
num_thread=40

# Step 1. Binarize bed files called by HOMER
echo "Binarize Bed"
java -jar -Xmx${memory_limit} ChromHMM/ChromHMM.jar BinarizeBed \
-peaks \
-p ${num_thread} \
-b 200 canFam3.chrom.sizes ${input_folder} configure.txt output_binarized


# Step 2. Learn the Hidden Markov model (HMM)
# The number of states is specified from 10 to 20.
for i in 10 11 12 13 14 15 16 17 18 19 20;do
    echo "Learn model : "${i}
    java -jar -Xmx${memory_limit} ChromHMM/ChromHMM.jar LearnModel \
    -holdcolumnorder \
    -p ${num_thread} \
    -b 200 output_binarized output_chromHMM-${i} ${i} canFam3
done

## Annotation ----------------------------------------------

## Make OverlapEnrichmentPlot with ENSEMBL gene location
python /Script/001_makeOverlapEnrichmentPlot_Ensembl.py

## Make OverlapEnrichmentPlot with expressed or unexpressed genes
python /Script/001_makeOverlapEnrichmentPlot_Exp_UnExpr.py

## Make OverlapEnrichmentPlot with tissue-specific genes extracted from LMM method
python /Script/001_makeOverlapEnrichmentPlot_LMM_5tissues.py
