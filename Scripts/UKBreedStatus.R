###########################################################################################################
############################  UK Rare Breed Status (2017 Defra data) ######################################
###########################################################################################################

# 1.0 Set working directory and load the data ----
setwd ("C:/Users/wwainwright/Documents/R/MCDA")
UKBS <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/BreedStatus.csv")

# 2.0 Load the packages ----

library(ggplot2)
library(reshape2)

# 3.0 Explore the data ----
names(UKBS)
summary(UKBS)

# Aggregate variables by each species 
aggregate(UKBS$NBAR, by=list(Category=UKBS$Species), FUN=sum, na.rm=TRUE)

# 4.0 Barplot of UK breed status ----

dfm <- melt(UKBS[,c('Species', 'Native','NBAR')],id.vars = 1)

(wbar1 <- ggplot(dfm, aes(x=Species, y=value, fill=variable)) +
    geom_bar(stat="identity", width=0.5, position=position_dodge()) +
    ylab("Number of breeds") +
    xlab("Species") +
    theme(
      panel.background = element_blank(),
      legend.position="top", # Puts legend at the top
      legend.title=element_blank(),
      panel.border = element_rect(colour = "black", fill=NA, size=1)))

# Make the chart grey style
wbar1+scale_fill_grey()

