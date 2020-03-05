#!/usr/bin/

# Used assembly version: canFam3, hg38, mm10
# Gene annotation: ENSEMBL build 93

# Basic argument should be changed with your directory and files
Input_fa="canFam3.1.fa"
Input_gtf="Ensembl_canFam3.1.gtf"
Input_chromsizes="canFam3.1.chromsizes"
path="/Directory/"
Input_name="Input"
threads="40"
## RNA-seq ------------------------------------------------------------
# Octopus-toolkit
java -jar -Xmx50g Octopus-toolkit.jar
# -- QC: fastqc
fastqc ${Input_name} -alloMem 50 -o ./ -t ${threads} --extract
# -- Trimming: trimmomatic
trimmomatic PE -phred33 -threads ${threads} ${Input_name}_1.fq.gz ${Input_name}_2.fq.gz \
${Input_name}_1.trim.fq.gz ${Input_name}_1.unpair.fq.gz \
${Input_name}_2.trim.fq.gz ${Input_name}_2.unpair.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
# -- Align: STAR
STAR --runMode genomeGenerate \
--runThreadN ${threads} \
--genomeDir /STARindex/ \
--genomeFastaFiles ${Input_fa} \
--sjdbGT ${Input_gtf} \
--sjdbOverhang 100

STAR --genomeDir /STARindex/ \
--runThreadN ${threads} \
--outSAMstrandField intronMotif \
--outSAMtype BAM Unsorted \
--outFileNamePrefix ${Input_name} \
--readFilesIn ${Input_name}_1.trim.fq.gz ${Input_name}_2.trim.fq.gz
# Sort and index
samtools sort -@ ${threads} ${Input_name}Aligned.out.bam > ${Input_name}.st.bam
samtools index -@ ${threads} ${Input_name}.st.bam
# Make bigWig: HOMER
makeTagDirectory  ${Input_name} ${Input_name}.st.bam -single
makeUCSCfile ${Input_name} \
-bigWig ${Input_chromsizes} \
-style rnaseq \
-strand both
# Expression estimation: Cufflinks
cuffquant ${Input_gtf} ${Input_name}.st.bam\
-o cq_${Input_name} \
-p ${threads} \
--library-type fr-firststrand \

# Used cuffnorm command line
cuffnorm -o cn_${Input_name} \
-L CL_first,CO,CO_first,CR_first,KI,KI_first,LI_first,LU_first,MG,MG_first,OV,OV_first,PA,PA_first,SP_first,ST,ST_first \
-p ${threads} \
--library-type fr-firststrand \
${Input_gtf} \
CR_first/abundances.cxb CL_first/abundances.cxb CO/abundances.cxb CO_first/abundances.cxb \
KI/abundances.cxb KI_first/abundances.cxb LI_first/abundances.cxb LU_first/abundances.cxb \
MG/abundances.cxb MG_first/abundances.cxb OV/abundances.cxb OV_first/abundances.cxb \
PA/abundances.cxb PA_first/abundances.cxb SP_first/abundances.cxb ST/abundances.cxb ST_first/abundances.cxb\



## ChIP-seq & MBD-seq -------------------------------------------------
# Octopus-toolkit
java -jar -Xmx50g Octopus-toolkit.jar
# -- QC: fastqc
fastqc ${Input_name} -alloMem 50 -o ./ -t ${threads} --extract
# -- Trimming: trimmomatic
trimmomatic PE -phred33 -threads ${threads} ${Input_name}_1.fq.gz ${Input_name}_2.fq.gz \
${Input_name}_1.trim.fq.gz ${Input_name}_1.unpair.fq.gz \
${Input_name}_2.trim.fq.gz ${Input_name}_2.unpair.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
# -- Align: HISAT2
hisat2-build -p ${threads} ${Input_fa} /HISAT2index/ 
hisat2 -p ${threads} -x /HISAT2index/ \
-1 ${Input_name}_1.trim.fq.gz -2 ${Input_name}_2.trim.fq.gz \
-S ${Input_name}.sam
# Mark duplicates: Sambamba
# Sort and index
samtools view -bS -@ {threads} ${Input_name}.sam > ${Input_name}.bam

sambamba markdup -t {threads} -r ${Input_name}.bam ${Input_name}.rmdu.bam

samtools sort -@ ${threads} ${Input_name}.rmdu.bam > ${Input_name}.rmdu.st.bam
samtools index -@ ${threads} ${Input_name}.rmdu.st.bam
# Make bigWig: HOMER
makeTagDirectory  ${Input_name} ${Input_name}.rmdu.st.bam -single
makeUCSCfile ${Input_name} -i /TagDirectory/Of/Control/ \
-bigWig ${Input_chromsizes} \
-style factor
# Peak calling: HOMER
findPeaks ${Input_name} -i /TagDirectory/Of/Control/ -style factor
findPeaks ${Input_name} -i /TagDirectory/Of/Control/ -fdr 0.01 -style histone

