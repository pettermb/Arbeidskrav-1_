
library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

bf.max <- data.frame(trial1 = c(59.0, 55.0, 73.0, 53.0, 56.0, 56.0, 62.5 ), 
                     trial2 = c(58.0, 66.0, 63.0, 55.5, 54.5, 56.5, 53.0)) 

# Calculate the typical error. 
bf.max %>%
  mutate(diff = trial2 - trial1) %>% 
  summarise(s = sd(diff),  
            m = mean(c(trial1, trial2)),
            te = round(s / sqrt(2), 1),
            cv = round(100 * (te / m), 1), 
            upr.L = mean(diff) + qt(0.975, 4) * s, 
            lwr.L = mean(diff) - qt(0.975, 4) * s) %>% 
  gt()
