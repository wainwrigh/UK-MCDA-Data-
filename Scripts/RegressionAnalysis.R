####################################################################################################
########################################## Regression analysis #####################################
###################################################################################################

# Load data
MCA <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/Regression.csv")
MCA2 <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/Regression2.csv")

# Load packages
library(tidyr)
library(ggplot2)
library(corrplot)
library(psych)

# Overarching regression model higher level node data  
mod.1 = lm(formula = Total ~ Diversity + Marketability + Endangerment, data = MCA) 
summary(mod.1)

# Plot of all regressions 
plot(MCA, pch=16, col="blue")

# Overarching regression model lower level node data 
mod.2 = lm(formula = Total ~ Diversity + Utility + Traits + ExSitu + InSitu, data = MCA2) 
summary(mod.2)

# Plot of all regressions 
plot(MCA, pch=16, col="blue")
