# load libraries ####
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

# 참고 사이트

# https://onesixx.com/flexdashboard1/

a=1:5
b=3:5

events = patients
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
