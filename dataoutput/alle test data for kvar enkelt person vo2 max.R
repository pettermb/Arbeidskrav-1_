
library(gt)
library(exscidata)
library(readxl)
library(ggplot2)
library(tidyverse)

reablitet2 <- read_excel("data/reablitet2.xls") 

reablitet2 %>%
  select (id, timepoint, hr.max, w.max, vo2.rel.max, rer.max, ve.max, bf.max)%>%
  group_by(timepoint)%>%
  gt(caption = "Alle testdata for kvar enkelt person")%>%
  fmt_number(columns = w.max:bf.max,
             decimals=1)%>%
  cols_label(timepoint = "Tidspunkt",
             hr.max = md("HR<sub>max</sub><br><small>"),
             w.max = md("W<sub>max</sub><br><small>"),
             vo2.rel.max = md("VO<sub>2max</sub><br><small>(ml min<sup>-1</sup>)"),
             rer.max = md("RER"),
             ve.max = md("VE<sub></sub><br><small>(l/min<sup>-1</sup>)"),
             bf.max = md("BF"))%>%
  tab_header(title = "VO2maks test")

