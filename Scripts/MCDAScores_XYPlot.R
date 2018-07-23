###################################################################################################
######################################### Plotting a X,Y chart ###################################
##################################################################################################

# Based on data from the MCDA model simulation. 

# Load the packages
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(gridExtra)
library(directlabels)
library(ggrepel)
library(scales)

# Read in the spreadsheet (based on total local weights of each node)
df <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/MCDABreedScores_XY.csv")

# Plot the X,Y chart for breed endangerment and marketability 
XY <- ggplot(df, aes(x=Marketability, y=Endangerment)) +
  geom_point(size=4, shape=23, fill="black")+ 
  geom_dl(aes(label=Breed),method=list("last.bumpup",cex=0.7, hjust = -.3))+ # "lastbump" ensures the labels do not overlap
  geom_smooth(method = "lm", formula = y ~ x, se=FALSE, fullrange=TRUE)+
  ylab("Endangerment") +
  xlab("Marketability") +
  scale_x_continuous(limits = c(0,100), breaks=c(0,  20, 40, 60, 80, 100))+
  scale_y_continuous(limits = c(0,100), breaks=c(0,  20, 40, 60, 80, 100))+
  theme(
    axis.text.x=element_text (size=12, angle=50, vjust=0.5, hjust=0.5),
    axis.text.y=element_text (size=12, angle=0, vjust=0.5, hjust=0.5),
    axis.line = element_line(color="black", size = 0.1),
    axis.title=element_text(size=12),
    panel.border = element_rect(fill=NA, colour = "black"),
    panel.background = element_blank())
XY

# A function to calculate the regression equation and R^2 
lm_eqn <- function(XY){
  m <- lm(Endangerment ~ Marketability, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 1), 
                        b = format(coef(m)[2], digits = 1), 
                        r2 = format(summary(m)$r.squared, digits = 1)))
  as.character(as.expression(eq));                 
}
print(lm_eqn(df)) # Print the result

# Plotting the function 
XYZ <- XY + geom_text(x = 75, y = 100, size = 3.5, label = lm_eqn(df), parse = TRUE)
XYZ

# Plot the X,Y chart for breed endangerment and Diversity 
XY1 <- ggplot(df, aes(x=Diversity, y=Endangerment)) +
  geom_point(size=4, shape=23, fill="black")+ 
  geom_dl(aes(label=Breed),method=list("last.bumpup",cex=0.7, hjust = -.3))+ # "lastbump" ensures the labels do not overlap
  geom_smooth(method = "lm", se=FALSE, fullrange=FALSE)+
  ylab("Endangerment") +
  xlab("Diversity") +
  scale_x_continuous(limits = c(0,100), breaks=c(0,  20, 40, 60, 80, 100))+
  scale_y_continuous(limits = c(0,100), breaks=c(0,  20, 40, 60, 80, 100))+
  theme(
    axis.text.x=element_text (size=12, angle=50, vjust=0.5, hjust=0.5),
    axis.text.y=element_text (size=12, angle=0, vjust=0.5, hjust=0.5),
    axis.line = element_line(color="black", size = 0.1),
    axis.title=element_text(size=12),
    panel.border = element_rect(fill=NA, colour = "black"),
    panel.background = element_blank())
XY1

# A function to calculate the regression equation and R^2 
lm_eqn <- function(XY1){
  m <- lm(Endangerment ~ Diversity, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(coef(m)[1], digits = 1), 
                        b = format(coef(m)[2], digits = 1), 
                        r2 = format(summary(m)$r.squared, digits = 2)))
  as.character(as.expression(eq));                 
}
print(lm_eqn(df)) # Print the result

# Plotting the function 
XYZ1 <- XY1 + geom_text(x = 75, y = 100, size = 3.5, label = lm_eqn(df), parse = TRUE)
XYZ1

# Arrange into a panel of two plots
grid.arrange(XYZ, XYZ1, ncol=2)
