## LDL, HDL, Total cholesterol ----------------------------------------------------------------
wget http://csg.sph.umich.edu/abecasis/public/lipids2013/jointGwasMc_LDL.txt.gz
wget http://csg.sph.umich.edu/abecasis/public/lipids2013/jointGwasMc_HDL.txt.gz
wget http://csg.sph.umich.edu/abecasis/public/lipids2013/jointGwasMc_TC.txt.gz
gzip -d jointGwasMc_LDL.txt.gz
gzip -d jointGwasMc_HDL.txt.gz
gzip -d jointGwasMc_TC.txt.gz
mv jointGwasMc_LDL.txt Metabolic_Low-density-lipoprotein-cholesterol_24097068_70_2013.txt
mv jointGwasMc_HDL.txt Metabolic_High-density-lipoprotein-cholesterol_24097068_71_2013.txt
mv jointGwasMc_TC.txt Metabolic_Total-cholesterol_24097068_73_2013.txt

## Neoplasms ----------------------------------------------------------------------------------
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000124/analyses/phs000124.pha002845.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000147/analyses/phs000147.pha002853.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000206/analyses/phs000206.pha002874.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000207/analyses/phs000207.pha002877.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000207/analyses/phs000207.pha002878.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000206/analyses/phs000206.pha002889.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000124/analyses/phs000124.pha002895.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000361/analyses/phs000361.pha003106.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000652/analyses/phs000652.pha003836.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.2453.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/40006_C50_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/41202_D12_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d phs000124.pha002845.txt.gz
gzip -d phs000147.pha002853.txt.gz
gzip -d phs000206.pha002874.txt.gz
gzip -d phs000207.pha002877.txt.gz
gzip -d phs000207.pha002878.txt.gz
gzip -d phs000206.pha002889.txt.gz
gzip -d phs000124.pha002895.txt.gz
gzip -d phs000652.pha003836.txt.gz
gzip -d f.2453.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d 40006_C50_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d 41202_D12_logistic.EUR.sumstats.MACfilt.txt.gz
mv phs000124.pha002845.txt  Neoplasms_Neuroblastoma_1053_EUR.txt
mv phs000147.pha002853.txt  Neoplasms_Breast-cancer_1060_EUR.txt
mv phs000206.pha002874.txt  Neoplasms_Pancreatic-Cancer_1076_EUR.txt
mv phs000207.pha002877.txt  Neoplasms_Prostate-cancer_1079_EUR.txt
mv phs000207.pha002878.txt  Neoplasms_Prostate-cancer_1080_EUR.txt
mv phs000206.pha002889.txt  Neoplasms_Pancreatic-Cancer_1086_EUR.txt
mv phs000124.pha002895.txt  Neoplasms_Neuroblastoma_1088_EUR.txt
mv phs000652.pha003836.txt  Neoplasms_Glioma_1093_EUR.txt
mv f.2453.0.0_logistic.EUR.sumstats.MACfilt.txt Neoplasms_Cancer_This-study_3329_2017.txt
mv 40006_C50_logistic.EUR.sumstats.MACfilt.txt Neoplasms_Malignant-neoplasm-of-breast_This-study_3659_2017.txt
mv 41202_D12_logistic.EUR.sumstats.MACfilt.txt Neoplasms_Benign-neoplasm-of-colon-rectum-anus-and-anal-canal_This-study_3666_2017.txt

## Alzheimer's disease ------------------------------------------------------------------------
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000219/analyses/phs000219.pha002879.txt.gz
wget https://ctg.cncr.nl/documents/p1651/AD_sumstats_Jansenetal.txt.gz
gzip -d phs000219.pha002879.txt.gz
gzip -d AD_sumstats_Jansenetal.txt.gz
mv phs000219.pha002879.txt Neurological_Alzheimer-disease_17998437_1081_2008.txt
mv AD_sumstats_Jansenetal.txt Neurological_Alzheimer-disease_30617256_4094_2018.txt

## Parkinson disease --------------------------------------------------------------------------
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000126/analyses/phs000126.pha002865.txt.gz
wget https://grasp.nhlbi.nih.gov/downloads/ResultsOctober2016/Pankratz/Pankratz_Parkinsons_22687-SuppTable1.txt
gzip -d phs000126.pha002865.txt.gz
mv phs000126.pha002865.txt Neurological_Familial-Parkinson-Disease_21829596_1070_2011.txt
mv Pankratz_Parkinsons_22687-SuppTable1.txt Neurological_Parkinson-Disease_22451204_1187_2012.txt

## Insomnia -----------------------------------------------------------------------------------
wget https://ctg.cncr.nl/documents/p1651/Insomnia_sumstats_Jansenetal.txt.gz
wget https://ctg.cncr.nl/documents/p1651/Hammerschlag_NatGenet2017_insomnia_sumstats-full_090617.txt.gz
gzip -d Insomnia_sumstats_Jansenetal.txt.gz
gzip -d Hammerschlag_NatGenet2017_insomnia_sumstats-full_090617.txt.gz
mv Insomnia_sumstats_Jansenetal.txt Neurological_Insomnia_30804565_3786_2019.txt
mv Hammerschlag_NatGenet2017_insomnia_sumstats-full_090617.txt Neurological_Insomnia_28604731_210_2017.txt

## Intelligence -------------------------------------------------------------------------------
wget https://ctg.cncr.nl/documents/p1651/sumstats.txt.gz
wget https://ctg.cncr.nl/documents/p1651/SavageJansen_IntMeta_sumstats.zip
gzip -d sumstats.txt.gz
unzip SavageJansen_IntMeta_sumstats.zip
mv sumstats.txt Cognitive_Intelligence_28530673_209_2017.txt

## Multiple Sclerosis -------------------------------------------------------------------------
wget https://www.immunobase.org/downloads/protected_data/GWAS_Data/hg19_gwas_ms_imsgc_4_19_1.tab.gz
gzip -d hg19_gwas_ms_imsgc_4_19_1.tab.gz
mv hg19_gwas_ms_imsgc_4_19_1.tab Neurological_Multiple-Sclerosis_21833088_3819_2011.txt

## Cronhn's disease ---------------------------------------------------------------------------
wget ftp://ftp.sanger.ac.uk/pub/consortia/ibdgenetics/cd-meta.txt.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2016-11-07/cd_build37_40266_20161107.txt.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2016-11-07/uc_build37_45975_20161107.txt.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2016-11-07/ibd_build37_59957_20161107.txt.gz
gzip -d cd-meta.txt.gz
gzip -d cd_build37_40266_20161107.txt.gz
gzip -d uc_build37_45975_20161107.txt.gz
gzip -d ibd_build37_59957_20161107.txt.gz
mv cd-meta.txt Gastrointestinal_Crohns-Disease_21102463_1193_2010.txt
mv cd_build37_40266_20161107.txt Gastrointestinal_Crohns-Disease_28067908_2029_2017.txt
mv uc_build37_45975_20161107.txt Gastrointestinal_Ulcerative-colitis_28067908_2030_2017.txt
mv ibd_build37_59957_20161107 Gastrointestinal_Inflammatory-Bowel-Disease_28067908_2031_2017.txt

## Diabetes ----------------------------------------------------------------------------------
wget http://www.t2diabetesgenes.org/datasets/t2d_dom_dev.txt.gz
wget ftp://ftp.sanger.ac.uk/pub/magic/MAGIC_ISI_Model_2_AgeSexBMI.txt
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000180/analyses/phs000180.pha002862.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.2443.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
wget http://cnsgenomics.com/data/t2d/Xue_et_al_T2D_META_Nat_Commun_2018.gz
wget https://www.immunobase.org/downloads/protected_data/GWAS_Data/hg19_gwas_t1d_bradfield_4_19_1.tab.gz
gzip -d t2d_dom_dev.txt.gz
gzip -d phs000180.pha002862.txt.gz
gzip -d f.2443.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d Xue_et_al_T2D_META_Nat_Commun_2018.gz
gzip -d hg19_gwas_t1d_bradfield_4_19_1.tab.gz
mv t2d_dom_dev.txt Endocrine_Type-2-Diabetes_26961502_1140_2016.txt
mv phs000180.pha002862.txt Endocrine_Type-1-Diabetes_19430480_1067_2009.txt
mv f.2443.0.0_logistic.EUR.sumstats.MACfilt.txt Endocrine_Diabetes_This-study_3328_2017.txt

## Systemic Lupus Erythematosus --------------------------------------------------------------
http://urr.cat/data/GWAS_SLE_summaryStats.zip
https://www.immunobase.org/downloads/protected_data/GWAS_Data/hg19_gwas_sle_bentham_4_20_0.tab.gz
gzip -d hg19_gwas_sle_bentham_4_20_0.tab.gz
mv hg19_gwas_sle_bentham_4_20_0.tab Skeletal_Systemic-Lupus-Erythematosus_26502338_3823_2015.txt

## Height ------------------------------------------------------------------------------------
wget https://portals.broadinstitute.org/collaboration/giant/images/0/0f/Meta-analysis_Locke_et_al%2BUKBiobank_2018.txt.gz
wget http://www.broadinstitute.org/collaboration/giant/images/0/01/GIANT_HEIGHT_Wood_et_al_2014_publicrelease_HapMapCeuFreq.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.50.0.0_res.EUR.sumstats.MACfilt.txt.gz
gzip -d Meta-analysis_Locke_et_al%2BUKBiobank_2018.txt.gz
gzip -d f.50.0.0_res.EUR.sumstats.MACfilt.txt.gz
gzip -d GIANT_HEIGHT_Wood_et_al_2014_publicrelease_HapMapCeuFreq.txt.gz
mv Meta-analysis_Locke_et_al%2BUKBiobank_2018.txt Skeletal_Height_30124842_4043_2018.txt
mv GIANT_HEIGHT_Wood_et_al_2014_publicrelease_HapMapCeuFreq.txt Skeletal_Height_25282103_142_2014.txt
mv f.50.0.0_res.EUR.sumstats.MACfilt.txt Skeletal_Height_This-study_3187_2017.txt

## Asthma ------------------------------------------------------------------------------------
wget ftp://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/DemenaisF_29273806_GCST005212/TAGC_meta-analyses_results_for_asthma_risk.zip
wget https://atlas.ctglab.nl/ukb2_sumstats/f.22127.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://beaune.cng.fr/gabriel/gabriel_results.zip
wget https://atlas.ctglab.nl/ukb2_sumstats/41204_J45_logistic.EUR.sumstats.MACfilt.txt.gz
unzip TAGC_meta-analyses_results_for_asthma_risk.zip
gzip -d f.22127.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
unzip gabriel_results.zip
gzip -d 41204_J45_logistic.EUR.sumstats.MACfilt.txt.gz
mv f.22127.0.0_logistic.EUR.sumstats.MACfilt.txt Respiratory_Asthma_This-study_3438_2017.txt
mv 41204_J45_logistic.EUR.sumstats.MACfilt.txt Respiratory_Asthma_This-study_3695_2017.txt

## Rheumatoid Arthritis and other ------------------------------------------------------------
wget http://archive.broadinstitute.org/ftp/pub/rheumatoid_arthritis/Stahl_etal_2010NG/RA_GWASmeta2_20090505-results.txt
wget https://grasp.nhlbi.nih.gov/downloads/ResultsOctober2016/Okada/RA_GWASmeta_European_v2.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/41204_M13_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/41204_M19_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d RA_GWASmeta_European_v2.txt.gz
gzip -d 41204_M13_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d 41204_M19_logistic.EUR.sumstats.MACfilt.txt.gz
mv RA_GWASmeta2_20090505-results.txt Connective-tissue_Rheumatoid-Arthritis_20453842_208_2010.txt
mv RA_GWASmeta_European_v2.txt Connective-tissue_Rheumatoid-Arthritis_24390342_1203_2014.txt
mv 41204_M13_logistic.EUR.sumstats.MACfilt.txt Connective-tissue_Other-arthritis_This-study_3700_2017.txt
mv 41204_M19_logistic.EUR.sumstats.MACfilt.txt Connective-tissue_Other-and-unspecified-osteoarthritis_This-study_3701_2017.txt

## Hematological -----------------------------------------------------------------------------
wget ftp://ftp.ncbi.nlm.nih.gov/dbgap/studies/phs000086/analyses/phs000086.pha002882.txt.gz
wget ftp://ftp.sanger.ac.uk/pub/magic/MAGIC_HbA1C.txt.gz
gzip -d phs000086.pha002882.txt.gz
gzip -d MAGIC_HbA1C.txt.gz
mv phs000086.pha002882.txt Hematological_Hemoglobin-A1C-level_19875614_1084_2010.txt
mv MAGIC_HbA1C.txt Hematological_Hemoglobin-A1C_20858683_1163_2010.txt

## Psychiatric -------------------------------------------------------------------------------
wget http://ssgac.org/documents/Neuroticism_Full.txt.gz
wget http://ssgac.org/documents/DS_Full.txt.gz
wget http://www.nimh.nih.gov/hgb-data/BP_GWAS_meta_results.tar.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.1970.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.1980.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
wget https://atlas.ctglab.nl/ukb2_sumstats/f.4526.0.0_res.EUR.sumstats.MACfilt.txt.gz
wget http://broadabc.ctglab.nl/documents/p12/BroadABC_METALoutput_Combined.tbl
wget https://ctg.cncr.nl/documents/p1651/sumstats_neuro_f1950_ctg_format.txt.gz
wget https://ctg.cncr.nl/documents/p1651/sumstats_neuro_f1970_ctg_format.txt.gz
wget https://ctg.cncr.nl/documents/p1651/sumstats_neuro_f1980_ctg_format.txt.gz
gzip -d Neuroticism_Full.txt.gz
gzip -d DS_Full.txt.gz
gzip -d BP_GWAS_meta_results.tar.gz
tar -xvzf BP_GWAS_meta_results.tar.gz
gzip -d f.1970.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d f.1980.0.0_logistic.EUR.sumstats.MACfilt.txt.gz
gzip -d f.4526.0.0_res.EUR.sumstats.MACfilt.txt.gz
gzip -d sumstats_neuro_f1950_ctg_format.txt.gz
gzip -d sumstats_neuro_f1970_ctg_format.txt.gz
gzip -d sumstats_neuro_f1980_ctg_format.txt.gz
mv Neuroticism_Full.txt Psychiatric_Neuroticism_27089181_55_2016.txt
mv DS_Full.txt Psychiatric_Depressive-symptoms_27089181_56_2016.txt
mv BP_GWAS_meta_results Psychiatric_Bipolar-disorder_27329760_2043_2016.txt
mv f.1970.0.0_logistic.EUR.sumstats.MACfilt.txt Psychiatric_Nervous_This-study_3289_2017.txt
mv f.1980.0.0_logistic.EUR.sumstats.MACfilt.txt Psychiatric_Anxious_This-study_3290_2017.txt
mv f.4526.0.0_res.EUR.sumstats.MACfilt.txt Psychiatric_Happiness_This-study_3385_2017.txt
mv BroadABC_METALoutput_Combined.tbl Psychiatric_Antisocial-behavior_28979981_3957_2017.txt
mv sumstats_neuro_f1950_ctg_format.txt Psychiatric_Sensitivity_29500382_3994_2018.txt
mv sumstats_neuro_f1970_ctg_format.txt Psychiatric_Nervous_29500382_3996_2018.txt
mv sumstats_neuro_f1980_ctg_format.txt Psychiatric_Anxious_29500382_3997_2018.txt

## Immunological -----------------------------------------------------------------------------
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/baso/baso_N171846_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/eo/eo_N172275_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/gran/gran_N169822_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/hgb/hgb_N172925_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/hct/hct_N173039_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/lymph/lymph_N171643_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/mono/mono_N170721_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/neut/neut_N170702_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/plt/plt_N166066_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/ret/ret_N170641_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/wbc/wbc_N172435_ukbb_ukbil_meta.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/baso/baso_N171846_narrow_form.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/eo/eo_N172275_narrow_form.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/gran/gran_N169822_narrow_form.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/lymph/lymph_N171643_narrow_form.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/mono/mono_N170721_narrow_form.tsv.gz
wget ftp://ftp.sanger.ac.uk/pub/project/humgen/summary_statistics/human/2017-12-12/hematological_traits/plt/plt_N166066_narrow_form.tsv.gz
gzip -d baso_N171846_ukbb_ukbil_meta.tsv.gz
gzip -d eo_N172275_ukbb_ukbil_meta.tsv.gz
gzip -d gran_N169822_ukbb_ukbil_meta.tsv.gz
gzip -d hgb_N172925_ukbb_ukbil_meta.tsv.gz
gzip -d hct_N173039_ukbb_ukbil_meta.tsv.gz
gzip -d lymph_N171643_ukbb_ukbil_meta.tsv.gz
gzip -d mono_N170721_ukbb_ukbil_meta.tsv.gz
gzip -d neut_N170702_ukbb_ukbil_meta.tsv.gz
gzip -d plt_N166066_ukbb_ukbil_meta.tsv.gz
gzip -d ret_N170641_ukbb_ukbil_meta.tsv.gz
gzip -d wbc_N172435_ukbb_ukbil_meta.tsv.gz
gzip -d baso_N171846_narrow_form.tsv.gz
gzip -d eo_N172275_narrow_form.tsv.gz
gzip -d gran_N169822_narrow_form.tsv.gz
gzip -d lymph_N171643_narrow_form.tsv.gz
gzip -d mono_N170721_narrow_form.tsv.gz
gzip -d plt_N166066_narrow_form.tsv.gz
mv baso_N171846_ukbb_ukbil_meta.tsv Immunological_Basophil-count_27863252_3833_2016.txt
mv eo_N172275_ukbb_ukbil_meta.tsv Immunological_Eosinophil-count_27863252_3838_2016.txt
mv gran_N169822_ukbb_ukbil_meta.tsv Immunological_Granulocyte-count_27863252_3841_2016.txt
mv hgb_N172925_ukbb_ukbil_meta.tsv Immunological_Hemoglobin-concentration_27863252_3844_2016.txt
mv hct_N173039_ukbb_ukbil_meta.tsv Immunological_Hematocrit_27863252_3843_2016.txt
mv lymph_N171643_ukbb_ukbil_meta.tsv Immunological_Lymphocyte-count_27863252_3848_2016.txt
mv mono_N170721_ukbb_ukbil_meta.tsv Immunological_Monocyte-count_27863252_3853_2016.txt
mv neut_N170702_ukbb_ukbil_meta.tsv Immunological_Neutrophil-count_27863252_3859_2016.txt
mv plt_N166066_ukbb_ukbil_meta.tsv Immunological_Platelet-count_27863252_3863_2016.txt
mv ret_N170641_ukbb_ukbil_meta.tsv Immunological_Reticulocyte-count_27863252_3866_2016.txt
mv wbc_N172435_ukbb_ukbil_meta.tsv Immunological_White-blood-cell-count_27863252_3868_2016.txt
mv baso_N171846_narrow_form.tsv Immunological_Basophil-count_27863252_3869_2016.txt
mv eo_N172275_narrow_form.tsv Immunological_Eosinophil-count_27863252_3874_2016.txt
mv gran_N169822_narrow_form.tsv Immunological_Granulocyte-count_27863252_3877_2016.txt
mv lymph_N171643_narrow_form.tsv Immunological_Lymphocyte-count_27863252_3884_2016.txt
mv mono_N170721_narrow_form.tsv Immunological_Monocyte-count_27863252_3889_2016.txt
mv plt_N166066_narrow_form.tsv Immunological_Platelet-count_27863252_3899_2016.txt

