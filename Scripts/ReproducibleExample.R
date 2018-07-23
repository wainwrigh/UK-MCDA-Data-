# Load the packages
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)

M <- structure(list(X1 = c("Diversity", "Endangerment", "Marketability", "Total"),
B1 = c(5.1, 4.9, 4.7, 4.6), B2 = c(3.5, 
3, 3.2, 3.1), B3 = c(1.4, 1.4, 1.3, 1.5), Petal.Width = c(7.1, 
4.7, 3.2, 5.1)), .Names = c("X1", "B1", "B2", "B3", "B4"), row.names = c(NA, 
4L), class = "data.frame")
M

# Plot the stacked bar 
P <- M %>% 
  gather(variable, value, -X1) %>% 
  filter(X1!="Total") %>% #Removes total variable
  group_by(variable) %>% 
  mutate(sum=sum(value)) %>% 
  ungroup() %>% 
  mutate(variable=reorder(variable, -sum)) %>% #Reorders the chart based on breed total score
  ggplot(aes(variable, value, fill=X1, width =.7)) +
  geom_col(col="black") + #Black border around the bars
  expand_limits(y = 0) +
  scale_y_continuous(limits = c(0,70), breaks=c(0,10,20, 30,40, 50,60, 70), expand = c(0.02, 0.02))+
  geom_text(aes(label = sum), vjust = -.25)+ #Here the text is added
  scale_fill_brewer(palette="Dark2") + #Changes the colour scale
  labs(x="Breed",
       y="Weighted score",
       fill="") +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.direction="vertical", legend.position=c(0.9, 0.85), 
        legend.text=element_text(size=11),
        legend.key = element_rect(size = 4),
        legend.key.size = unit(1.5, 'lines'))  # Ensures spacing between the different lines on the legend.
P
