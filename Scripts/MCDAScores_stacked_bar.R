###################################################################################################
######################################### Plotting a stacked bar chart ############################
##################################################################################################

# Based on data from the MCDA model simulation. 

# Load the packages
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)

# Read in the spreadsheet
df = read.csv("C:/Users/wwainwright/Documents/R/MCDA/Data/MCDABreedScores_GW.csv")

# Plot the stacked bar (with deplyr) for breed GLOBAL weighted scores
df %>% 
  gather(variable, value, -X1) %>% 
  filter(X1!="Total") %>% 
  group_by(variable) %>% 
  mutate(sum=sum(value)) %>% 
  ungroup() %>% 
  mutate(variable=reorder(variable, -sum)) -> df

df %>% 
  group_by(variable) %>% 
  summarise(max = max(sum)) ->df_max

P <- df %>% 
  ggplot(aes(variable, value, width =.7)) +
  geom_col(col="black",aes(fill=X1)) + #Black border around the bars
  expand_limits(y = 0) +
  scale_y_continuous(limits = c(0,80), breaks=c(0,20,40, 60, 80), expand = c(0.02, 0.02))+
  geom_text(data = df_max,
            aes(label = max, y = max), vjust = -.25)+ #Here the text is added
  scale_fill_brewer(palette="Dark2") + #Changes the colour scale
  labs(x="Breed",
       y="Weighted score",
       fill="") +
  theme_bw() +
  theme(axis.text.x=element_text (size=12, angle=50, vjust=0.9, hjust=0.9),
        axis.text.y=element_text (size=12, angle=0, vjust=0.9, hjust=0.9),
        axis.title=element_text(size=12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.direction="vertical", legend.position=c(0.9, 0.85), 
        legend.text=element_text(size=11),
        legend.key = element_rect(size = 4),
        legend.key.size = unit(1.5, 'lines'))  # Ensures spacing between the different lines on the legend.
  #coord_flip() + #Flips the axis 
P

############################################################################################################
################################# Other chart based on all criteria ########################################
##################################################################################################

# Read in the spreadsheet
df1 = read_csv("C:/Users/wwainwright/Documents/R/MCDA/Data/MCDABreedScores_AllCriteria.csv")

# Make enough colours for the different labels
display.brewer.all() # View the different colour palettes
colourCount = length(unique(df1$X1))
getPalette = colorRampPalette(brewer.pal(9, "Paired"))

# Plot the stacked bar (with deplyr) for breed GLOBALLY weighted scores for all criteria
PL <- df1 %>% 
  gather(variable, value, -X1) %>% 
  group_by(variable) %>% 
  mutate(sum=sum(value)) %>% 
  ungroup() %>% 
  mutate(variable=reorder(variable, -sum)) %>% #Reorders the chart based on breed total score
  ggplot(aes(variable, value, fill=X1, width =.7)) +
  geom_col(col="black") + #Black border around the bars
  expand_limits(y = 0) +
  scale_y_continuous(limits = c(0,80), breaks=c(20,40,60,80), expand = c(0.02, 0.02))+
  scale_fill_manual(values = getPalette(colourCount)) + #Changes the colour scale
  labs(x="Breed",
       y="Weighted score",
       fill="") +
  theme_bw() + 
  theme(axis.text.x=element_text (size=12, angle=50, vjust=0.9, hjust=0.9),
        axis.text.y=element_text (size=12, angle=0, vjust=0.9, hjust=0.9),
        axis.title=element_text(size=12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
PL

# Add horizontal line at y = 50.9 (the mean breed score)
PL + geom_hline(yintercept=50.9, linetype="dashed", color = "red", size =2)

