
library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

rer.max <- data.frame(trial1 = c(1.17, 1.18, 1.24, 1.24, 1.09, 1.21, 1.30), 
                      trial2 = c(1.17, 1.21, 1.26, 1.23, 1.15, 1.17, 1.35)) 

# Calculate the typical error. 
rer.max %>%
  mutate(diff = trial2 - trial1) %>% 
  summarise(s = sd(diff),  
            m = mean(c(trial1, trial2)),
            te = round(s / sqrt(2), 1), 
            cv = round(100 * (te / m), 1), 
            upr.L = mean(diff) + qt(0.975, 4) * s, 
            lwr.L = mean(diff) - qt(0.975, 4) * s) %>% 
  gt()
