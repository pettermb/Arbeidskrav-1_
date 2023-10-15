
library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

ve.max <- data.frame(trial1 = c(217.0, 209.5, 217.0, 184.5, 197.5, 206.5, 179.0), 
                     trial2 = c(213.5, 230.0, 200.5, 187.0, 192.5, 201.0, 171.0)) 

# Calculate the typical error. 

ve.max %>%
  mutate(diff = trial2 - trial1) %>% 
  summarise(s = sd(diff),  
            m = mean(c(trial1, trial2)), 
            te = round(s / sqrt(2), 1), 
            cv = round(100 * (te / m), 1), 
            upr.L = mean(diff) + qt(0.975, 4) * s, 
            lwr.L = mean(diff) - qt(0.975, 4) * s) %>% 
  gt()
