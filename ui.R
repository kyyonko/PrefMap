library(shiny)
library(ggplot2)
library(leaflet) 

ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("mymap", width = "100%", height = "100%"),
  
  absolutePanel(bottom = 30, right = 20,
                h3("各年齢層が各都道府県の人口に占める割合"),
                selectInput("age", "年齢層を選択", choices = ages_choice, width = 600), 
                plotOutput("graph", width = 600)
  )
)

