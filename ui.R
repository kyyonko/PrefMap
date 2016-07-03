library(shiny)
library(DT)
library(ggplot2)

ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("mymap", width = "100%", height = "100%"),
  
  absolutePanel(bottom = 30, right = 20,
                selectInput("age", "年齢層を選択", choices = ages_choice, width = 600), 
                plotOutput("graph", width = 600)
  )
)

