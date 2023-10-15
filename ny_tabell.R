
reablitet2 |> 
  filter(timepoint == "t1") |> 
  select(timepoint, age:bodymass, vo2.rel.max, w.max) |> 
  pivot_longer(cols = !timepoint,
               names_to = "variabler", 
               values_to = "verdier") |> 
  mutate(variabel = factor(variabler, 
                           levels = c("age", 
                                      "bodyheight", 
                                      "bodymass", 
                                      "vo2.rel.max", 
                                      "w.max"), 
                           labels = c("Alder (år)", 
                                      "Høyde (cm)", 
                                      "Vekt (kg)", 
                                      "VO2maks", 
                                      "Wmaks")))  |> 
  
  summarise(m = mean(verdier), 
            s = sd(verdier), 
            .by = variabel) |> 
  gt() |> 
  fmt_number(decimals = 2) |> 
  cols_merge(columns = c(m, s), 
             pattern = "{1} &plusmn; {2}") |> 
  cols_label(m ="") |> 
  tab_footnote(footnote = md("*Dataene er presentert som gjennomsnitt &plusmn; 
                             standardavvik.*")) |> 
  cols_width(columns = everything() ~ px(120)) |> 
  tab_header("Karakteristikker av forsøkspersonene basert på første test") 
 
  
  
  
  



