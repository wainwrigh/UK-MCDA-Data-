###################################################################################################
######################################### Radar chart of data  #################################
##################################################################################################

# Load in the data.  The spreadsheets are different data matrices for the three different models. 
# These are used to produce four different radar charts for the various models.  
D.S<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/D.Shorthorn.csv")
D<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/Devon.csv")
H <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/Highland.csv")
V <- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/Vaynol.csv")

# load packages
library(fmsb)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(ggpubr)
library(grid)
library(lattice)

# To arrange all the plots into a planel with 2 rows and 2 column
op <- par(
  oma=c(0,0,0,0), # Room for the title and legend
  mar=c(3,3,3,3),
  mfrow=c(1,2)
)

# Plot 1: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( D.S  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,100,25), cglwd=1.0, 
            # Title for the chart 
            title="A) Dairy Shorthorn", line = 1,
            #custom labels
            vlcex=1, 
            vlabels=c("% change\nto NE", "Consvation\ngrazing\ndemand",
                      "Adaptability and\nhardiness", "No. semen straws\nstored", "No.\nactive\nherds")) 

# Plot 2: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( D  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,100,25), cglwd=1.0, 
            # Title for the chart 
            title="B) Devon", line = 1,
            #custom labels
            vlcex=1, 
            vlabels=c("% change\nto NE", "Consvation\ngrazing\ndemand",
                      "Adaptability and\nhardiness", "No. semen straws\nstored", "No.\nactive\nherds")) 

# Plot 3: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in1=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( H  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,100,25), cglwd=0.8,
            # Title for the chart 
            title="C) Highland", line = 1,
            #custom labels
            vlcex=1, 
            vlabels=c("% change\nto NE", "Consvation\ngrazing\ndemand",
                      "Adaptability and\nhardiness", "No. semen straws\nstored", "No.\nactive\nherds")) 

# Plot 4: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( V  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,100,25), cglwd=0.8,
            # Title for the chart 
            title="D) Vaynol",line = 1,
            #custom labels
            vlcex=1, 
            vlabels=c("% change\nto NE", "Consvation\ngrazing\ndemand",
                      "Adaptability and\nhardiness", "No. semen straws\nstored", "No.\nactive\nherds")) 
