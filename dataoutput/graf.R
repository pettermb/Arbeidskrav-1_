library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 




ggplot(data = reablitet2, aes(x = w.max, 
                              y = vo2.rel.max, 
                              color = timepoint)) + 
  geom_point() +
  labs(x = "w.max", 
       y = "V02maks (ml/kg", 
       title = "This is the title", 
       subtitle = "This is the subtitle", 
       caption = "This is a caption", 
       color = "This is the group aesthetics") +
  
  annotate(geom = "text", x = 200, y = 50, label = "This is a text annotation")
