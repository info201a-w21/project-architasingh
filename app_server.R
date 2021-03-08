library(dplyr)
library(shiny)
library(tidyverse)
library(lintr)
source("pie_chart.R")
source("bargraph.R")
source("ReviewScatterplot.R")

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

server <- function(input, output) {
    output$movies_piechart <- renderPlot({
        pie_chart()
    })
    output$movies_bargraph <- renderPlot({
        bargraph()
    })
    output$movies_scatterplot <- renderPlot({
        scatterplot()
    })
}
