#source("https://bioconductor.org/biocLite.R")
#biocLite("preprocessCore")
library(RColorBrewer)
library(pheatmap)
library(preprocessCore) # quantile normalization

rm(list = ls())
#Change my working Dir
path = "C:/Users/thsrm/Desktop"
inFile_name = "180620_TCGA_KI_100to84.txt"
outFile_name = inFile_name
setwd(path)
# Read Data
norm_method_col = "none" # none, zscore, quantile
norm_method_row = T # T or F

header_row = T     # T or F
header_col = 1 # 1 or NULL
inFile = read.table(inFile_name, sep="\t" ,header = header_row, row.names = header_col)
# Color
paletteLength <- 300
cols = colorRampPalette(c("navy","White","firebrick3"))(paletteLength)
# Clustering methods and distance
list_cl_method = c("average") # "complete", , "median", "centroid", "mcquitty", "ward.D"
list_cl_dist = c("euclidean") #, "correlation", "minkowski", "maximum", "manhattan"

## Functions
##--------------------------------------------------------------------------
outPlot = function(outName){
  outFile_png = paste0(outName, ".png")
  #outFile_pdf = paste0(outName, ".pdf")
  dev.print(png, file = outFile_png,
            width=800,
            height=600)
  #dev.print(pdf, file = outFile_pdf)
}

##--------------------------------------------------------------------------
# normalization method -> Column
if (norm_method_col == "none"){
  inFile_table = inFile
} else if (norm_method_col == "zscore"){
  inFile_table = apply(inFile, 2, scale)
} else if (norm_method_col == "quantile"){
  inFile_matrix = data.matrix(inFile)
  inFile_table = normalize.quantiles(inFile_matrix, copy=TRUE)
} else {
  print("norm_method_col is wrong")
  break
}
# normalization method -> Row
if (norm_method_row == T){
  inFile_z_row = t(apply(inFile_table, 1, scale)) # calculation z-score (row) using scale in base packages
  inFile_table = inFile_z_row
  print("1")
  colnames(inFile_table) = colnames(inFile)
  rownames(inFile_table) = rownames(inFile)
}
# fix break
breaklist = NA
# fix pheatmap score bar score
if (norm_method_row == T || norm_method_col == "zscore" || norm_method_col == "quantile"){
  max_score = max(inFile_table)
  min_score = min(inFile_table)
  max(inFile_table)
  min(inFile_table)
  breaklist = c(seq(min_score, 0, length.out=ceiling(paletteLength/2) + 1), seq(max_score/paletteLength, max_score, length.out=floor(paletteLength/2)))
}
# Make plot  
##--------------------------------------------------------------------------
for (i in 1:length(list_cl_method)){
  for (j in 1:length(list_cl_dist)){
    outTitle = paste0(list_cl_method[i], "_", list_cl_dist[j], "_", norm_method_col)
    outFile = paste0(outFile_name, "_", list_cl_method[i], "_", list_cl_dist[j], "_", norm_method_col)
    
    plot = pheatmap(inFile_table, scale = "none", cluster_rows = T, cluster_cols = T ,
                    fontsize_row = 4.8, fontsize_col = 10, color = cols,
                    breaks = breaklist,
                    clustering_method = list_cl_method[i],
                    clustering_distance_rows = list_cl_dist[j],
                    clustering_distance_cols = list_cl_dist[j],
                    cutree_rows = 3,
                    main = outTitle)
    plot
    outPlot(outFile)
  }
}

