# Homepage adress
# -> http://www.sthda.com/english/wiki/factoextra-r-package-easy-multivariate-data-analyses-and-elegant-visualization
#install.packages("factoextra")
#install.packages("FactoMineR")
library(factoextra)

rm(list = ls())
## Basic argument should be changed with your directory and files
# Change my working Dir
path="/Directory/"
input_file_name = "table_format_input.txt"
output_file_name = "Write_output_file_name"
Title = "Write_title"


#------------------------------------------------------------------------
# Read Data
setwd(path)
inFile = read.table(input_file_name, sep="\t" ,header=T)#, row.names = 1)
#inFile = inFile[,-c(1:4)]
inFile_rowCol = t(inFile)

## Functions
##--------------------------------------------------------------------------
outPlot <- function(outName){
  outFile_png = paste0(outName, ".png")
  outFile_pdf = paste0(outName, ".pdf")
  dev.print(png, file = outFile_png,
    width=800,
    height=600)
  dev.print(pdf, file = outFile_pdf)
}

## PCA analysis
##--------------------------------------------------------------------------
res.pca <- prcomp(inFile_rowCol, scale = TRUE)
# Visualize eigenvalues/variances
fviz_screeplot(res.pca, addlabels = TRUE, main = Title)#, ylim = c(0, 50))

outName = paste0(output_file_name, "_var_percent")
outPlot(outName)
##--------------------------------------------------------------------------
fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
outName = paste0(output_file_name, "_PCA")
outPlot(outName)

##--------------------------------------------------------------------------
# Control variable colors using their contributions
#fviz_pca_var(res.pca, col.var="contrib",
#             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
#             repel = TRUE # Avoid text overlapping
#)
##--------------------------------------------------------------------------
# Compute hierarchical clustering and cut into 4 clusters
res <- hcut(inFile_rowCol, k = 5, stand = TRUE)
# Visualize
fviz_dend(res, rect = TRUE, cex = 1.2,
          k_colors = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07", "darkorchid3"))

outName = paste0(output_file_name, "_Dend_kmean")
outPlot(outName)

# Optimal number of clusters for k-means
#fviz_nbclust(inFile_rowCol, kmeans, method = "gap_stat")

