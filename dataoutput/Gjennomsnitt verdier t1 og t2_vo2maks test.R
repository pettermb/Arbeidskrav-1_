library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)
reablitet2 <- read_excel("data/reablitet2.xls") 



reablitet2 %>%
  select (timepoint, hr.max, w.max, vo2.rel.max, rer.max, ve.max, bf.max)%>%
  group_by(timepoint)%>%
  summarise(w.max = mean(w.max) ,
            VO2maks = mean(vo2.rel.max) , 
            RER = mean(rer.max) ,
            VE = mean(ve.max) ,
            BF = mean(bf.max)) %>%
  gt(caption = md("VO<sub>2max Test"))%>%
  fmt_number(columns = w.max:BF,
             decimals = 1)%>%
  cols_label(timepoint = "Tidspunkt",
             w.max = md("W<sub>max</sub><br><small>"),
             VO2maks = md("VO<sub>2max</sub><br><small>(ml/kg/min<sup>-1</sup>)"),
             RER = md("RER"),
             VE = md("VE<sub></sub><br><small>(l/min<sup>-1</sup>)"),
             BF = md("BF"))%>%
  tab_header(title = "Gjennomsnitt for t1 og t2") 
