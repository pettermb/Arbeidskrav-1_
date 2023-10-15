
library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

vo2.rel.max <- data.frame(trial1 = c(72.95, 69.67, 62.56, 70.65, 71.41, 63.94, 52.40), 
                          trial2 = c(72.32, 72.22, 62.92, 70.58, 65.98, 62.95, 52.26)) 

# Calculate the typical error. 

vo2.rel.max %>%
  mutate(diff = trial2 - trial1) %>% 
  summarise(s = sd(diff),  
            m = mean(c(trial1, trial2)), 
            te = round(s / sqrt(2), 1), 
            cv = round(100 * (te / m), 1), 
            upr.L = mean(diff) + qt(0.975, 4) * s, 
            lwr.L = mean(diff) - qt(0.975, 4) * s) %>% 
  gt()