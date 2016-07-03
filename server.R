library(shiny)
library(leaflet)
library(dplyr)
library(DT)
library(ggplot2)

server <- function(input, output) {
  # 年齢層の選択
  selectAge <- reactive({
    df <- data.frame("都道府県" = PrefMap$都道府県, 
                     "lon" = PrefMap$lon, 
                     "lat" = PrefMap$lat, 
                     "age" = PrefMap[, input$age])
  })
  
  # 地図
  output$mymap <- renderLeaflet({
    leaflet(selectAge()) %>% 
      addTiles() %>%
      # 中心、ズームサイズを調整
      setView(lng = 142, lat = 38, zoom = 6) %>%
      # 人口の総数ごとにプロットサイズを変える
      addCircles(lng = ~lon, lat = ~lat, weight = 1,
                 radius = ~sqrt(age) * 10000, 
                 # プロットをクリックしたら都道府県名と人口の数が表示されるようにする
                 popup = ~paste(都道府県, paste(round(age, digits = 2), "%", sep=""), sep=": "))
  })
  
  # グラフ
  output$graph <- renderPlot({
    g <- ggplot(selectAge(), aes (x = 都道府県, y = age)) + 
      geom_bar(width = 0.8, stat = "identity", fill="steelblue") +
      theme_bw(base_family = "HiraKakuProN-W3") +
      ylab("age(%)") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
    plot(g)
  })
}
