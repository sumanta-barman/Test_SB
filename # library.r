# library
library(ggplot2)

library(dplyr)
library(viridis)
library(tidyr)

library(reshape2)
library(RColorBrewer)

# create a dataset
mydata <- read.table("Input file.txt", sep = "", header = TRUE); 

datm <- mydata %>% 
  mutate(ind = factor(row_number())) %>%  
  gather(variable, value, -ind)

my_colors <- RColorBrewer::brewer.pal(4, "Set1")[3:2]


# Stacked + percent
ggplot(datm, aes(fill=ind, y=value, x=variable)) + 
  geom_bar(position="fill", stat="identity")  + guides(fill=guide_legend(title=('')))  +
  theme(axis.text = element_text(size = (12)), axis.title = element_text(size = (13), face = "bold"), 
        legend.text = element_text(size = (12), face = "bold"), legend.title = element_text(size = (12), face = "bold")) + 
   scale_y_continuous(labels = scales::percent_format()) + xlab("Patients") + scale_fill_manual(values = my_colors, labels = c("Persisting clones", "New clones")) +
  ylab("IgG+ MB cell repertoire")  #scale_colour_steps()  #scale_fill_discrete(labels = c("New Clones", "Persisted Clones")) #For different color> scale_fill_viridis(discrete = T) 

   
