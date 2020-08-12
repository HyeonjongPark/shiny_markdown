---
title: "Shiny with Flexboard"
output: 
    flexdashboard::flex_dashboard:
    orientation: rows
runtime: shiny
vertical_layout: fill
---
    


Sidebar {.sidebar}
===========================================================
Shiny wideget {.no-title}
-------------------------------------------------
### Input widget {.no-title}

```r
inputPanel(
  sliderInput("act", label = "act_freq:",
              min = 0.1, max = 1, value = 0.4, step = 0.1),
  sliderInput("trace", label = "trace_freq:",
              min = 0.1, max = 1, value = 0.4, step = 0.1)  
)
```

<!--html_preserve--><div class="shiny-input-panel">
<div class="shiny-flow-layout">
<div>
<div class="form-group shiny-input-container">
<label class="control-label" for="act">act_freq:</label>
<input class="js-range-slider" id="act" data-min="0.1" data-max="1" data-from="0.4" data-step="0.1" data-grid="true" data-grid-num="9" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
</div>
<div>
<div class="form-group shiny-input-container">
<label class="control-label" for="trace">trace_freq:</label>
<input class="js-range-slider" id="trace" data-min="0.1" data-max="1" data-from="0.4" data-step="0.1" data-grid="true" data-grid-num="9" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
</div>
</div>
</div><!--/html_preserve-->

Page 1
=========================================================== 
TAB {.tabset}
-------------------------------------------------
### component1

```r
renderPlot({
precedence_matrix <- events %>%
  filter_activity_frequency(percentage = input$act) %>% # show only most frequent activities
  filter_trace_frequency(percentage = input$trace) %>%    # show only the most frequent traces
  precedence_matrix() %>%
  plot()
precedence_matrix
})
```

<!--html_preserve--><div id="outa2dfc65d38a415de" class="shiny-plot-output" style="width: 100% ; height: 400px"></div><!--/html_preserve-->

### component2

```r
# trace explorer
renderPlot({
trace_explorer <- events %>%
  trace_explorer(coverage = input$trace)
trace_explorer
})
```

<!--html_preserve--><div id="outc54997530724ccc8" class="shiny-plot-output" style="width: 100% ; height: 400px"></div><!--/html_preserve-->

### component3

```r
#dotted charts
renderPlot({
events %>%
  filter_activity_frequency(percentage = input$act) %>% # show only most frequent activities
  filter_trace_frequency(percentage = input$trace) %>% 
  dotted_chart()
})
```

<!--html_preserve--><div id="out8f35955681e8438a" class="shiny-plot-output" style="width: 100% ; height: 400px"></div><!--/html_preserve-->


Page 2
===========================================================     
row1 {data-height=80%}
-------------------------------------------------
### Histogram {.no-title}

```r
renderProcessanimater({
  events %>%
  filter_activity_frequency(percentage = input$act) %>% # show only most frequent activities
  filter_trace_frequency(percentage = input$trace) %>% 
  animate_process()
})
```

<!--html_preserve--><div id="out70583089f196d07a" style="width:100%; height:400px; " class="processanimateR html-widget html-widget-output"></div><!--/html_preserve-->
