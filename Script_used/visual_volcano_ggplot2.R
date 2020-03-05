library(ggplot2)
library(ggrepel)
library(dplyr)

rm(list = ls())
## Basic argument should be changed with your directory and files
# Change my working Dir
path="/Directory/"
input_file_name = "table_format_input.txt"

# Read Data
setwd(path)
inFile = read.table(input_file_name, sep="\t" ,header=T)#, row.names = 1)
# check some attributes of the data
colnames(list_inFile)
# keep only the fields needed for the plot
list_inFile = list_inFile[c("Gene","log2FoldChange","pvalue")]

# Cutoff
logFC = 1
pValue = 0.05
# Annotation Cutoff
annot_logFC_plus = 2
annot_logP_plus = 3.7
annot_logFC_minus = -2
annot_logP_minus = 3.7
# Range
xAxis = c(-3, 3)
yAxis = c(0, 7)
# Output Label
main_title = "Scatter_test"
label_x = "Log2 FC"
label_y = "-Log10 p-value"
inner_line_color = "gray30"



##-----------------------------------------------------------------
##-----------------------------------------------------------------
colnames(list_inFile) = c("Gene", "Fold", "p_value")
list_inFile["group"] <- "01_Not"
list_inFile["annotation"] <- "no"

# Grouping (Significant)
# change the grouping for the entries with both significance and large enough fold change
list_inFile[which(list_inFile["p_value"] <= pValue & list_inFile["Fold"] >= logFC ),"group"] <- "02_Signif"
# change the grouping for the entries with both significance and large enough fold change
list_inFile[which(list_inFile["p_value"] <= pValue & list_inFile["Fold"] < -logFC ),"group"] <- "03_Signif"

# Grouping (Annotation)
# change the grouping for the entries with both significance and large enough fold change
list_inFile[which(-log10(list_inFile["p_value"]) >= annot_logP_plus & list_inFile["Fold"] >= annot_logFC_plus ),"annotation"] <- "yes"
list_inFile[which(-log10(list_inFile["p_value"]) >= annot_logP_minus & list_inFile["Fold"] <= annot_logFC_minus ),"annotation"] <- "yes"
##-----------------------------------------------------------------
##Construct the plot object
set.seed(42)
p <- ggplot(data=list_inFile, aes(x = Fold, y = -log10(p_value), colour = group)) +
  geom_point(aes(col = group), alpha = 0.5, size = 2.5) +
  scale_color_manual(values = c("gray", "red", "blue3")) +
  xlim(c(xAxis[1], xAxis[2])) + ylim(c(yAxis[1], yAxis[2])) +
  ggtitle(main_title) +
  xlab(label_x) + ylab(label_y) +
  theme_bw() +
  theme(legend.position="none", axis.title=element_text(size=14)) +
  geom_vline(xintercept = -logFC, color = inner_line_color) +
  geom_vline(xintercept = logFC, color = inner_line_color) +
  geom_hline(yintercept = -log10(pValue), color = inner_line_color) +
  geom_text_repel(data=filter(list_inFile, annotation == "yes")
                  , aes(label=Gene), size = 2 , colour="black")
p


