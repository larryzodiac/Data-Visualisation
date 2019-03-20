library(shiny)
library("leaflet")
library("tidyverse")

qpal <- colorFactor("Set2", tourism$Purpose)

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
      ),
      selectInput(
        "nationality",
        "Nationality",
        choices =c(
          "British",
          "North American"
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
    tourism = tourism[tourism$Nationality == input$nationality, ]
    print(input$purpose)
    
    tourism %>%
      leaflet() %>%
      addTiles() %>%
      addCircleMarkers(
        lat = ~Latitude, lng = ~Longitude,
        label = ~paste("Label:", Town),
        radius = tourism$Number / 1500,
        color = qpal(tourism$Purpose),
        stroke = FALSE, fillOpacity = 0.5
      ) %>%
      setView(lng = -6.157, lat = 53.289, zoom = 6) %>%
      addLegend(pal = qpal, value = ~Purpose, title= "Purpose Type")
    
  })
}

shinyApp(ui = ui, server = server)
