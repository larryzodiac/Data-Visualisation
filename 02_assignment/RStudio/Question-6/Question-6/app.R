library(shiny)
library("leaflet")
library("tidyverse")

qpal <- colorFactor("Paired", tourism$Purpose)

ui <- fluidPage(
  titlePanel("Visitors to Ireland"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "purpose",
        "Purpose",
        choices =c(
          "Holiday Trips",
          "Business Trips",
          "VFR Trips"
        )
      ),
      selectInput(
        "brand",
        "Brand",
        choices =c(
          "Wild Atlantic Way",
          "Irelands Ancient East",
          "Dublin - Breath of Fresh Air"
        )
      )
    ),
    leafletOutput("map")
  )
)

server <- function(input, output) {
  
  output$map <- renderLeaflet({
    tourism = tourism[tourism$Purpose == input$purpose, ]
    tourism = tourism[tourism$Brand == input$brand, ]
    print(input$purpose)
    
    tourism %>%
      leaflet() %>%
      addTiles() %>%
      addCircleMarkers(lat = ~Latitude, lng = ~Longitude) %>%
      setView(lng = -6.157, lat = 53.289, zoom = 8) %>%
      addLegend(pal = qpal, value = ~Purpose, title= "Purpose Type")
    
  })
}

shinyApp(ui = ui, server = server)
