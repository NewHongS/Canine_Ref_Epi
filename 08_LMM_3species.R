library(ggplot2)
library(reshape2)
library(stringr)
library(lme4)

input_folder = "/Directory/Input"
input_name = "normalized_expression_table_3species_5tissues.txt"
date = "200101"

## Input --------------------------------------------------------------------------------------------------------
rm(list=ls())
setwd(input_folder)

dat <- read.table(input_name, header=T, stringsAsFactors = F)
col = c("seagreen", "goldenrod2", "gray91") # Species / Tissue / None
## Function -----------------------------------------------------------------------------------------------------
gg_color_hue2 = function(n) {     # color setting from JH
  hues = seq(6.330885, 6.330885+360, length = n + 1)
  hcl(h = hues, l = 51.19696, c = 144.4467)[1:n]
}

outPlot = function(outName){
  outFile_png = paste0(outName, ".png")
  outFile_pdf = paste0(outName, ".pdf")
  dev.print(png, file = outFile_png, width=800, height=800, res=120)
  dev.print(pdf, file = outFile_pdf)
}

## Analysis -----------------------------------------------------------------------------------------------------
## Format conversion
dat2 <- melt(dat, id="Dog")  # Table to 3column format / ID column = Dog / ID, Sample, Score
tmp <- as.data.frame(str_split(dat2$variable, "_", simplify = T)) # String split ex) D_LI to D, LI
colnames(tmp) <- c("Species", "Tissue") # Grouping Using splited label ex) D = species, LI = tissue
dat2 <- cbind(dat2, tmp) # Group info to 3column format input_name

##---------------------------------------------------------------------------------------------------------------
###Dog vs Human
dat2a <- subset(dat2, Species %in% c("D", "H"))
dat2a$Species <- as.character(dat2a$Species)

resdat <- list()
for(i in 1:length(unique(dat$Dog))){
  name <- unique(dat$Dog)[i]
  mod <- lmer(value~(1|Species) + (1|Tissue), subset(dat2a, Dog==name))
  vardat <- as.data.frame(summary(mod)$varcor)
  vardat$vcov2 <- vardat$vcov/sum(vardat$vcov)
  resdat[[i]] <- data.frame(Name=name,
                            Tissue=vardat$vcov2[vardat$grp=="Tissue"],
                            Species=vardat$vcov2[vardat$grp=="Species"])
}

resdat2a <- do.call(rbind, resdat)

resdat2a$group <- "N"
resdat2a$group[resdat2a$Tissue >= quantile(resdat2a$Tissue, 0.75) & resdat2a$Tissue > resdat2a$Species] <- "Tissue"
resdat2a$group[resdat2a$Species >= quantile(resdat2a$Species, 0.75)] <- "Species"
resdat2a$group <- factor(resdat2a$group, levels=c("Species", "Tissue", "N"))

plot = ggplot(resdat2a, aes(x=Tissue, y=Species, color=group)) + geom_point() + 
  scale_color_manual(values=col, labels=c("High across species", "High across tissues", "None")) + guides(color=guide_legend("")) + 
  labs(list(x="Fraction of variance across tissues", y="Fraction of variance across species", title="Dog vs Human")) + 
  theme_bw() + theme(legend.position = c(0.7, 0.8), panel.grid = element_blank(), plot.title = element_text(hjust = 0.5))
plot

outFile = paste0(date, "_Dog_Human")
outPlot(outFile)

write.table(resdat2a, paste0(outFile, ".txt"), sep="\t", row.names = F, quote = F)

##---------------------------------------------------------------------------------------------------------------
###Dog vs Mouse
dat2a <- subset(dat2, Species %in% c("D", "M"))
dat2a$Species <- as.character(dat2a$Species)

resdat <- list()
for(i in 1:length(unique(dat$Dog))){
  name <- unique(dat$Dog)[i]
  mod <- lmer(value~(1|Species) + (1|Tissue), subset(dat2a, Dog==name))
  vardat <- as.data.frame(summary(mod)$varcor)
  vardat$vcov2 <- vardat$vcov/sum(vardat$vcov)
  resdat[[i]] <- data.frame(Name=name,
                            Tissue=vardat$vcov2[vardat$grp=="Tissue"],
                            Species=vardat$vcov2[vardat$grp=="Species"])
}

resdat2a <- do.call(rbind, resdat)

resdat2a$group <- "N"
resdat2a$group[resdat2a$Tissue >= quantile(resdat2a$Tissue, 0.75) & resdat2a$Tissue > resdat2a$Species] <- "Tissue"
resdat2a$group[resdat2a$Species >= quantile(resdat2a$Species, 0.75)] <- "Species"
resdat2a$group <- factor(resdat2a$group, levels=c("Species", "Tissue", "N"))

plot =  ggplot(resdat2a, aes(x=Tissue, y=Species, color=group)) + geom_point() + 
  scale_color_manual(values=col, labels=c("High across species", "High across tissues", "None")) + guides(color=guide_legend("")) + 
  labs(list(x="Fraction of variance across tissues", y="Fraction of variance across species", title="Dog vs Mouse")) + 
  theme_bw() + theme(legend.position = c(0.7, 0.8), panel.grid = element_blank(), plot.title = element_text(hjust = 0.5))
plot

outFile = paste0(date, "_Dog_Mouse")
outPlot(outFile)
  
write.table(resdat2a, paste0(outFile, ".txt"), sep="\t", row.names = F, quote = F)

##---------------------------------------------------------------------------------------------------------------
###Human vs Mouse
dat2a <- subset(dat2, Species %in% c("H", "M"))
dat2a$Species <- as.character(dat2a$Species)

resdat <- list()
for(i in 1:length(unique(dat$Dog))){
  name <- unique(dat$Dog)[i]
  mod <- lmer(value~(1|Species) + (1|Tissue), subset(dat2a, Dog==name))
  vardat <- as.data.frame(summary(mod)$varcor)
  vardat$vcov2 <- vardat$vcov/sum(vardat$vcov)
  resdat[[i]] <- data.frame(Name=name,
                            Tissue=vardat$vcov2[vardat$grp=="Tissue"],
                            Species=vardat$vcov2[vardat$grp=="Species"])
}

resdat2a <- do.call(rbind, resdat)

resdat2a$group <- "N"
resdat2a$group[resdat2a$Tissue >= quantile(resdat2a$Tissue, 0.75) & resdat2a$Tissue > resdat2a$Species] <- "Tissue"
resdat2a$group[resdat2a$Species >= quantile(resdat2a$Species, 0.75)] <- "Species"
resdat2a$group <- factor(resdat2a$group, levels=c("Species", "Tissue", "N"))

plot =  ggplot(resdat2a, aes(x=Tissue, y=Species, color=group)) + geom_point() + 
  scale_color_manual(values=col, labels=c("High across species", "High across tissues", "None")) + guides(color=guide_legend("")) + 
  labs(list(x="Fraction of variance across tissues", y="Fraction of variance across species", title="Human vs Mouse")) + 
  theme_bw() + theme(legend.position = c(0.7, 0.8), panel.grid = element_blank(), plot.title = element_text(hjust = 0.5))
plot

outFile = paste0(date, "_Human_Mouse")
outPlot(outFile)

write.table(resdat2a, paste0(outFile, ".txt"), sep="\t", row.names = F, quote = F)

