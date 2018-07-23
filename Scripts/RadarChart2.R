###################################################################################################
######################################### Radar chart of data  #################################
##################################################################################################

# Load in the data.  The spreadsheets are different data matrices for the different scenarios.  
# These are used to produce four different radar charts for the various models.  
S1V2<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/WeightScenario/S1V2.csv")
S2V2<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/WeightScenario/S2V2.csv")
S3V2<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/WeightScenario/S3V2.csv")
S4V2<- read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/RadarChart/WeightScenario/S4V2.csv")

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
radarchart( S1V2  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,80,20), cglwd=1.0, 
            # Title for the chart 
            title="A) S1", line = 0.5,
            #custom labels
            vlcex=1, 
            vlabels=c("B.Galloway", "B.White","D.Shorthorn", "N.D.Shorthorn", "R.R.Devon", "Dexter",
                      "Galloway", "Gloucester", "Guernsey", "Highland", "I.Moiled", "L.Red", "Longhorn",
                      "Luing", "Red.P", "Shetland", "Vaynol", "W.Park", "W.Shorthorn")) 

# Plot 2: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( S2V2  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,80,20), cglwd=1.0, 
            # Title for the chart 
            title="B) S2", line = 0.5,
            #custom labels
            vlcex=1, 
            vlabels=c("B.Galloway", "B.White","D.Shorthorn", "N.D.Shorthorn", "R.R.Devon", "Dexter",
                      "Galloway", "Gloucester", "Guernsey", "Highland", "I.Moiled", "L.Red", "Longhorn",
                      "Luing", "Red.P", "Shetland", "Vaynol", "W.Park", "W.Shorthorn")) 


# Plot 3: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in1=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( S3V2  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,80,20), cglwd=0.8,
            # Title for the chart 
            title="C) S3", line = 0.5,
            #custom labels
            vlcex=1, 
            vlabels=c("B.Galloway", "B.White","D.Shorthorn", "N.D.Shorthorn", "R.R.Devon", "Dexter",
                      "Galloway", "Gloucester", "Guernsey", "Highland", "I.Moiled", "L.Red", "Longhorn",
                      "Luing", "Red.P", "Shetland", "Vaynol", "W.Park", "W.Shorthorn")) 

# Plot 4: 
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( S4V2  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="black", cglty=1, axislabcol="black", caxislabels=seq(0,80,20), cglwd=0.8,
            # Title for the chart 
            title="D) S4",line = 0.5,
            #custom labels
            vlcex=1, 
            vlabels=c("B.Galloway", "B.White","D.Shorthorn", "N.D.Shorthorn", "R.R.Devon", "Dexter",
                      "Galloway", "Gloucester", "Guernsey", "Highland", "I.Moiled", "L.Red", "Longhorn",
                      "Luing", "Red.P", "Shetland", "Vaynol", "W.Park", "W.Shorthorn")) 

