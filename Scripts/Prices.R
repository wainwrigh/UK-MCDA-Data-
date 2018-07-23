#################################################################################
################################### Livestock Prices ############################
#################################################################################

# 1.0 Set working directory and load the data ----
setwd ("C:/Users/wwainwright/Documents/R/MCDA")
CP <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Cattleprices.csv")

# 2.0 Load the packages ----

library(tidyr)
library(dplyr)
library(ggplot2)
library(readr)
library(gridExtra)
library(scales)
library(psych)
library(corrplot)
library(openxlsx)
library(bear)

# 3.0 Data exploration ----

names(CP)
show(CP$Breed)

# Use "Aggreagte" to determine the means, subject to each breed.
aggregate(CP$TopPrice~CP$Breed, FUN=mean) 
counts <- aggregate(CP$MeanPrice~CP$Breed, FUN=mean)
aggregate(CP$No.Sold~CP$Breed, FUN=sum) 

counts

# Plot the data 
boxplot(counts$`CP$MeanPrice`~counts$`CP$Breed`)
    