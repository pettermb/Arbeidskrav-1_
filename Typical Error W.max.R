library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

library(tidyverse)

w.max <- data.frame(trial1 = c(463, 438, 400, 400, 453, 428, 288), 
                    trial2 = c(439, 450, 403, 375, 450, 425, 288)) 

# Calculate the typical error.

w.max %>%
  mutate(diff = trial2 - trial1) %>% # Change/difference score
  summarise(s = sd(diff),  # Summarize to calculate sd, and... 
            m = mean(c(trial1, trial2)), # mean
            te = round(s / sqrt(2), 1), # the typical error.
            cv = round(100 * (te / m), 1), # Calculate as a percentage of the mean
            upr.L = mean(diff) + qt(0.975, 4) * s, 
            lwr.L = mean(diff) - qt(0.975, 4) * s) %>% 
  gt()
