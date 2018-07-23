###################################################################################
############################ PCA analysis (ALL CRITERIA) ##########################
###################################################################################
# Load packages
library(stringi)
library(devtools)
library(ggplot2)
library(colorspace)
library(ggfortify)
library(cluster)
library(lattice)
library (gclus)
library(openxlsx)

# Load data and set working directory
setwd ("C:/Users/wwainwright/Documents/R/MCDA/Plots")
MCA <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/PCA/PCA2Unweighted.csv")
MCA1 <- MCA[c(2:18)]

# apply PCA - scale. = TRUE is highly advisable, but default is FALSE. 
pca <- prcomp(MCA1,
              center = TRUE,
              scale. = TRUE, 
              scores = TRUE) 

# Summary and scree plot
ls(pca) 
  K <- summary(pca)
  K
  write.xlsx(K, file="PCASummary_ALL.csv")
  G <- pca$sdev^2  # These are be the eigenvalues
  G
  write.xlsx(G, file="PCASummary_ALLEigen.csv")
pca$scale
print(pca)
plot(pca, type = "l")

# DotPlot PC1
load    <- pca$rotation
sorted.loadings <- load[order(load[, 1]), 1]
myTitle <- "Loadings Plot for PC1" 
myXlab  <- "Variable Loadings"
dotplot(sorted.loadings, main=myTitle, xlab=myXlab, cex=1.5, col="red")

# DotPlot PC2
sorted.loadings <- load[order(load[, 2]), 2]
myTitle <- "Loadings Plot for PC2"
myXlab  <- "Variable Loadings"
dotplot(sorted.loadings, main=myTitle, xlab=myXlab, cex=1.5, col="red")

# PCA Plot (set scale=0 to disable the scaling parameter, label.label is used to source text labels from column x
# label.repel ensures the labels dont overlap.)
g <- autoplot(prcomp(MCA1), main = "Plot A: All criteria", data = MCA, loadings = TRUE, loadings.colour = 'red',
              label=TRUE, label.label="BreedScore1", label.size = 4, loadings.label = TRUE, loadings.label.size  = 4, frame = TRUE,
              label.repel=TRUE, loadings.label.repel=TRUE) 
g <- g + theme_bw() + geom_vline(xintercept = 0) + geom_hline(yintercept=0) 
g <- g + theme(axis.text.x=element_text (size=13, vjust=0.5, hjust=0.5),
                axis.text.y=element_text (size=13, vjust=0.5, hjust=0.5),
                axis.line = element_line(color="black", size = 0.1),
                axis.title=element_text(size=13))
g

# Apply the Varimax Rotation
my.var <- varimax(pca$rotation)
my.var

# Cluster analysis plots
autoplot(clara(MCA1[-3], 3),frame = TRUE)
autoplot(fanny(MCA1[-3], 3), frame = TRUE)