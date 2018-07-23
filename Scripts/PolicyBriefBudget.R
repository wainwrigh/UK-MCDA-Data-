###################################################################################################
######################################### Plotting a bar chart ##################################
##################################################################################################

# Load the packages
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)
library(ggplot2)

# Read in the spreadsheet
df = read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/PolicyBrief/PB1.csv")
summary(df)
df$Budget2 <- df$Budget/1000000 # Converting the budget allocation to a smaller scale.
format(round(df$Budget2, 2), nsmall = 2)
median(df$Budget2)

# Plotting a bar plot
P <-ggplot(data=df, aes(x = reorder(Breed, -Budget2), y=Budget2)) + # If want the bars to be ordered.
    geom_bar(stat="identity")+
    labs(x="Breed",
    y="Hypothetical budget allocation (million)",fill="") +
    scale_y_continuous( limits = c(0,0.7), expand = c(0,0) )+
    theme_bw() + 
    theme(axis.text.x=element_text (size=12, angle=50, vjust=0.9, hjust=0.9),
        axis.text.y=element_text (size=12, angle=0, vjust=0.9, hjust=0.9),
        axis.title=element_text(size=12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
P

# Add horizontal line at y = 50.9 (the mean breed score)
P + geom_hline(yintercept=0.518, linetype="dashed", color = "red", size =2)
P
