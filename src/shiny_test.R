# load libraries ####
rm(list = ls())
library(bupaR)
library(edeaR)
library(processmapR)
library(eventdataR)
library(readr)
library(tidyverse)
library(DiagrammeR)
library(ggplot2)
library(stringr)
library(lubridate)

getwd()

library(data.table)
library(highcharter)
library(ggplot2)
library(flexdashboard)
library(rmarkdown)
library(dplyr)
library(plyr)
library(leaflet)
#install.packages("TraMineR")
library(TraMineR)
#install.packages("pipeR")
library(pipeR)
library(sunburstR)

# 참고 사이트

# https://onesixx.com/flexdashboard1/

a=1:5
b=3:5

events = patients
events
getwd()
save(events, file = "events_data.RData")



events %>% 
  process_map(performance(mean, "mins"),
              render = T) 

pm = events %>%
  filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
  filter_trace_frequency(percentage = .80) %>%    # show only the most frequent traces
  process_map(performance(mean, "mins"),
              render = T) 


precedence_matrix <- events %>%
  filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
  filter_trace_frequency(percentage = .80) %>%    # show only the most frequent traces
  precedence_matrix() %>% 
  plot()


events %>%
  filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
  filter_trace_frequency(percentage = .80) %>%    # show only the most frequent traces
  throughput_time('case', units = 'hours')

resource_matrix <- events %>%
  filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
  filter_trace_frequency(percentage = .80) %>%    # show only the most frequent traces
  resource_matrix() %>% 
  plot()

# trace explorer
trace_explorer <- events %>%
  trace_explorer(coverage = 1.0)
trace_explorer

events %>%
  filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
  filter_trace_frequency(percentage = .40) %>% 
  dotted_chart()


events %>%
  resource_matrix() %>%
  plot()


performance_dashboard(events)
activity_dashboard(events)
rework_dashboard(events)
resource_dashboard(events)

library(leaflet)

my_map <- leaflet() %>% 
  addTiles()
my_map


leaflet() %>%
  addTiles %>% # Add default OpenStreetMap map tiles
  setView(lng = 5.0, lat = 51.0, zoom = 6)

install.packages("rdevteam")
saveWidget(pm, "E:/data-analysis/messy/shiny_markdown/tt.html")


rmarkdown::html_notebook_output_html("E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd")



leaflet() %>%
  setView(lng=126.9784, lat=37.566, zoom=7) %>%
  addTiles()




markdown::markdownToHTML("test_v1.Rmd", 
          output  = "test_v1.html")

knitr::knit2html("E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd")

library(knitr)
library(markdown)

library(flexdashboard)

knit('E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd', 'E:/data-analysis/messy/shiny_markdown/out/test_v1.md') # creates md file

rmarkdown::render(
  input = "E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd", 
  output_file = "E:/data-analysis/messy/shiny_markdown/out/html_doc",
  output_format = "flex_dashboard")



rmarkdown::run("E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd")
rmarkdown::ru
library(rmarkdown)
sessionInfo()

install.packages("rmd2html")

library(htmlwidgets)

#install.packages("xaringan")
library(xaringan)
library(markdown)
library(rmarkdown)

install.packages("stationery")
library(stationery)

rmd2html("test_v1.Rmd", "E:/data-analysis/messy/shiny_markdown/out/")
rmd2ht

rmd2h
library(htmltools)
htmltools::htmlDepend



rmarkdown::draft("E:/data-analysis/messy/shiny_markdown/out/test_v2.Rmd", template = "flex_dashboard", package = "flexdashboard")


render("E:/data-analysis/messy/shiny_markdown/out/test_v1.Rmd", output_format = "word_document")






library(tidyverse)
install.packages("sf")
install.packages("class")
install.packages("KernSmooth")
library(class)
library(sf)

sigungu_shp <- st_read("E:/data-analysis/messy/process_map/map_shp/CTPRVN.shp")

sigungu_shp$CTP_KOR_NM <- iconv(sigungu_shp$CTP_KOR_NM, from = "CP949", to = "UTF-8", sub = NA, mark = TRUE, toRaw = FALSE)

library(stringr)
## 시각화
sigungu_shp %>% 
  #dplyr::filter(str_detect(CTPRVN_CD, "11")) %>% 
  select(CTP_KOR_NM) %>% 
  plot()
  


library(dplyr)  # tidy data manipulation
library(leaflet)  # interative mapping
library(DT)  # interactive tables
library(crosstalk)  # inter-widget interactivity

a = readRDS("E:/data-analysis/messy/shiny_markdown/in/gias_sample.RDS")
a %>% class
