###################################################################################
############################ PCA analysis ########################################################
##################################################################################################
# Load packages
library(stringi)
library(devtools)
library(ggplot2)
library(colorspace)
library(ggfortify)
library(cluster)
library(lattice)
library (gclus)

# Load data
MCA <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/PCA/PCA2Unweighted.csv")
MCA1 <- MCA[c(2:18)]

#mca.Breed <- MCA[, 1]
#MCA$Breed <- NULL #Removes the breed colummn
#MCA[MCA == 0] <- NA # Makes all 0 values NA

#Scale the data 
#Sample <- data.frame(MCA1)

# apply PCA - scale. = TRUE is highly advisable, but default is FALSE. 
pca <- prcomp(MCA1,
              center = TRUE,
              scale. = TRUE, #Is this needed because all my data is already standardised?
              scores = TRUE) 

# Summary and scree plot
ls(pca) 
summary(pca)
pca$sdev^2  # These are be the eigenvalues
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
g <- autoplot(prcomp(MCA1), main = "Plot A", data = MCA, loadings = TRUE, loadings.colour = 'red',
              label=TRUE, label.label="BreedScore1", label.size = 4, loadings.label = TRUE, loadings.label.size  = 4, frame = TRUE,
              label.repel=TRUE) 
g <- g + theme_bw() + geom_vline(xintercept = 0) + geom_hline(yintercept=0)
#g <- g + theme (legend.direction="vertical", legend.position=c(0.9, 0.85), 
               # legend.text=element_text(size=11),
                #legend.key = element_rect(size = 4),
                #legend.key.size = unit(1.5, 'lines'))
g  


# Apply the Varimax Rotation
my.var <- varimax(pca$rotation)
my.var

# Cluster analysis plots
autoplot(clara(MCA1[-3], 3),frame = TRUE)
autoplot(fanny(MCA1[-3], 3), frame = TRUE)





