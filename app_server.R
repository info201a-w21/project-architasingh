library(dplyr)
library(shiny)
library(tidyverse)
library(lintr)
library(plotly)
source("pie_chart.R")
source("bargraph.R")
source("ReviewScatterplot.R")

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

server <- function(input, output) {
    output$movies_piechart <- renderPlot({
        pie_chart()
    })
    output$movies_bargraph <- renderPlotly({
        bar_graph <- plot_ly(movies_data, x = ~streaming_services,
                             y = ~number_of_movies, type = 'bar', color = I(input$color))
        bar_graph <- bar_graph %>%
            layout(title = "Amount of Movies Per Streaming Service",
                   xaxis = list(title = "Streaming Services"),
                   yaxis = list(title = "Number of Movies"))
    })
    output$movies_scatterplot <- renderPlot({
        scatterplot()
    })
}

# Below is necessary code for our 'movies_bar_graph'
netflix_sum <- sum(movies$Netflix)
hulu_sum <- sum(movies$Hulu)
prime_video_sum <- sum(movies$Prime.Video)
disney_sum <- sum(movies$Disney.)

streaming_services <- c('Netflix', 'Hulu', 'Prime Video', 'Disney')
number_of_movies <- c(netflix_sum, hulu_sum, prime_video_sum, disney_sum)

movies_data <- data.frame(streaming_services, number_of_movies)