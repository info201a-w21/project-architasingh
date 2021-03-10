library(dplyr)
library(shiny)
library(tidyverse)
library(lintr)
library(plotly)
source("bar_chart.R")
source("bargraph.R")
source("ReviewScatterplot.R")

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

movies$Rotten.Tomatoes <- as.numeric(sub("%", "", movies$Rotten.Tomatoes))
movies_filtered <- movies %>%
    filter(!is.na(IMDb)) %>%
    filter(!is.na(Rotten.Tomatoes))


server <- function(input, output) {
    output$movies_barchart <- renderPlotly({
        
        # Create the bar chart
        barchart <- ggplot(df, aes(x = ages, y = num_movies)) +
            geom_col(aes(fill = platform), width = 0.6) +
            xlab("Age Groups") +
            ylab("Number of Movies") +
            ggtitle("Movie Distribution Across Each Age Group") +
            labs (fill = "Streaming Platforms") +
            scale_size_area() +
            theme (
                legend.title = element_text(color = "black", size = 9.5),
                legend.text = element_text(color = "black", size = 8)
            )
    })
    output$movies_bargraph <- renderPlotly({
        bar_graph <- plot_ly(movies_data, x = ~streaming_services,
                             y = ~number_of_movies, type = 'bar', color = I(input$color))
        bar_graph <- bar_graph %>%
            layout(title = "Amount of Movies Per Streaming Service",
                   xaxis = list(title = "Streaming Services"),
                   yaxis = list(title = "Number of Movies"))
    })
    
    output$movies_scatterplot <- renderPlotly({
        movies_filtered_input <- movies_filtered %>% 
            filter(IMDb >= as.numeric(input$IMDb_Min) & Rotten.Tomatoes >= as.numeric(input$RT_Min))
        
        scatterplot <- ggplot(data = movies_filtered_input) +
            geom_point(
                mapping = aes(x = IMDb, y = Rotten.Tomatoes),
                alpha = .15
            ) +
            ggtitle("Rotten Tomatoes vs IMDb Review") +
            xlab("IMDb Score") +
            ylab("Rotten Tomatoes Score") +
            scale_size_area()
        ggplotly(scatterplot)
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