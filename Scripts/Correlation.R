############################ Correlation analysis ################################################
##################################################################################################

# Load data
MCA <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/Correlation.csv")

# Load packages
library(tidyr)
library(ggplot2)
library(corrplot)
library(psych)

# Correlation matrix analysis ----

# Create data frame of variables with selected columns using column indices
MC <- MCA[,c(2,3,4,5,6,8,9,10,11,12,13,14,15,16,17,18)]
names(MC)

# Group correlation test 
corr.test(MC[1:16])

# Visulisations
pairs.panels(MC[1:16])  

# Simple visualisation of correlation analysis effect size including significance    
x <- cor(MC[1:16])
cor(x,use="pairwise.complete.obs")
colnames (x) <- c("1. Ne", "1.1 % change NE", "1.2 Geographic origin", "2. Branded products", "2.1 Conservation grazing", "2.2 Adaptability + hardiness", "2.3 Graze wet sites", "2.4 Heat stress", "3. No. embryos", "3.1 No. semen straws", "3.2 No. males collected", "3.3 Geographic concent.", "3.4 PBF", "3.5 PBM", "3.6 % change to PBF", "3.7 No. herds")
rownames(x) <- c("1. Ne", "1.1 % change NE", "1.2 Geographic origin", "2. Branded products", "2.1 Conservation grazing", "2.2 Adaptability + hardiness", "2.3 Graze wet sites", "2.4 Heat stress", "3. No. embryos", "3.1 No. semen straws", "3.2 No. males collected", "3.3 Geographic concent.", "3.4 PBF", "3.5 PBM", "3.6 % change to PBF", "3.7 No. herds")
p.mat <- cor.mtest(MC, conf.level = .95)
p.mat <- cor.mtest(MC)$p
corrplot(x, p.mat = p.mat, sig.level = .05)

M2 <- x
diag(M2) = NA
corrplot(M2, na.label = "NA", type="upper",tl.col = "black", p.mat = p.mat, sig.level = 0.05, insig = "blank") # Ensures non-significant values are not displayed 
