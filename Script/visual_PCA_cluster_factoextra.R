# Homepage adress
# -> http://www.sthda.com/english/wiki/factoextra-r-package-easy-multivariate-data-analyses-and-elegant-visualization
#install.packages("factoextra")
#install.packages("FactoMineR")
library(factoextra)
#library(FactoMineR)

rm(list = ls())
#Change my working Dir
path = "/media/vetbio/Keunhong_2TB/2.Projects/01s_SNU/01_Reference_Paper/ChIP-seq/05_bigWig/11_bwtool_summary_SuperEnhancer_180423/bwSum.filter1kb.annote.filterTSS2kb"
inFile_name = "bwSum.filter1kb.annote.filterTSS2kb.zscoreRow.zscoreCol"

outFile_name = "180424_11tissue_SE"
Title = "SuperEnhancer"
#------------------------------------------------------------------------
# Read Data
setwd(path)
inFile = read.table(inFile_name, sep="\t" ,header=T)#, row.names = 1)
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

## Make plots
##--------------------------------------------------------------------------
res.pca <- prcomp(inFile_rowCol, scale = TRUE)
# Visualize eigenvalues/variances
fviz_screeplot(res.pca, addlabels = TRUE, main = Title)#, ylim = c(0, 50))

outName = paste0(outFile_name, "_var_percent")
outPlot(outName)
##--------------------------------------------------------------------------
fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
outName = paste0(outFile_name, "_PCA")
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

outName = paste0(outFile_name, "_Dend_kmean")
outPlot(outName)

# Optimal number of clusters for k-means
#fviz_nbclust(inFile_rowCol, kmeans, method = "gap_stat")
