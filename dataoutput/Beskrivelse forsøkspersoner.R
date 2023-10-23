library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)
reablitet2 <- read_excel("data/reablitet2.xls") 

reablitet2 %>%
  select(timepoint, age, bodyheight, bodymass) %>%
  summarise(Alder = mean(age),
            Høgde = mean(bodyheight), 
            Vekt = mean(bodymass)) %>%
  gt(caption = "Forsøkspersoner") %>%
  fmt_number(columns = Alder:Vekt, 
             decimals = 2) %>%
  cols_label(Alder = md("Alder<br><small>(år)"),
             Høgde = md("Høgde<br><small>(cm)"),
             Vekt = md("Vekt<br><small>(kg)"))
