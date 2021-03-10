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

# Below is necessary code for our 'movies_barchart'

# count how many movies belong to each age group for each platform
prime_num_seven <- movies %>%
    filter(Age == "7+") %>%
    filter(Prime.Video == "1") %>% 
    nrow()

prime_num_thirteen <- movies %>%
    filter(Age == "13+") %>% 
    filter(Prime.Video == "1") %>% 
    nrow()

prime_num_sixteen <- movies %>%
    filter(Age == "16+") %>%
    filter(Prime.Video == "1") %>% 
    nrow()

prime_num_eighteen <- movies %>%
    filter(Age == '18+') %>%
    filter(Prime.Video == "1") %>% 
    nrow()

prime_num_all <- movies %>%
    filter(Age == "all") %>%
    filter(Prime.Video == "1") %>% 
    nrow()

netflix_num_seven <- movies %>%
    filter(Age == "7+") %>%
    filter(Netflix == "1") %>% 
    nrow()

netflix_num_thirteen <- movies %>%
    filter(Age == "13+") %>% 
    filter(Netflix == "1") %>% 
    nrow()

netflix_num_sixteen <- movies %>%
    filter(Age == "16+") %>%
    filter(Netflix == "1") %>% 
    nrow()

netflix_num_eighteen <- movies %>%
    filter(Age == '18+') %>%
    filter(Netflix == "1") %>% 
    nrow()

netflix_num_all <- movies %>%
    filter(Age == "all") %>%
    filter(Netflix == "1") %>% 
    nrow()

hulu_num_seven <- movies %>%
    filter(Age == "7+") %>%
    filter(Hulu == "1") %>% 
    nrow()

hulu_num_thirteen <- movies %>%
    filter(Age == "13+") %>% 
    filter(Hulu == "1") %>% 
    nrow()

hulu_num_sixteen <- movies %>%
    filter(Age == "16+") %>%
    filter(Hulu == "1") %>% 
    nrow()

hulu_num_eighteen <- movies %>%
    filter(Age == '18+') %>%
    filter(Hulu == "1") %>% 
    nrow()

hulu_num_all <- movies %>%
    filter(Age == "all") %>%
    filter(Hulu == "1") %>% 
    nrow()

disney_num_seven <- movies %>%
    filter(Age == "7+") %>%
    filter(Disney. == "1") %>% 
    nrow()

disney_num_thirteen <- movies %>%
    filter(Age == "13+") %>% 
    filter(Disney. == "1") %>% 
    nrow()

disney_num_sixteen <- movies %>%
    filter(Age == "16+") %>%
    filter(Disney. == "1") %>% 
    nrow()

disney_num_eighteen <- movies %>%
    filter(Age == '18+') %>%
    filter(Disney. == "1") %>% 
    nrow()

disney_num_all <- movies %>%
    filter(Age == "all") %>%
    filter(Disney. == "1") %>% 
    nrow()

# total amount of movies with listed age groups
total <- prime_num_seven + prime_num_thirteen + prime_num_sixteen + 
    prime_num_eighteen + prime_num_all + netflix_num_seven + 
    netflix_num_thirteen + netflix_num_sixteen + netflix_num_eighteen + 
    netflix_num_all + hulu_num_seven + hulu_num_thirteen + hulu_num_sixteen + 
    hulu_num_eighteen + hulu_num_all + disney_num_seven + 
    disney_num_thirteen + disney_num_sixteen + disney_num_eighteen + 
    disney_num_all

# make data frame with platform and age group data
df <- data.frame(
    platform = rep(c("Amazon Prime", "Netflix","Hulu","Disney"), each = 5),
    ages = rep(c("7+","13+","16+", "18+", "all"), 4),
    num_movies = c(prime_num_seven, prime_num_thirteen, prime_num_sixteen,
                   prime_num_eighteen, prime_num_all, netflix_num_seven, 
                   netflix_num_thirteen, netflix_num_sixteen, netflix_num_eighteen,
                   netflix_num_all, hulu_num_seven, hulu_num_thirteen, 
                   hulu_num_sixteen, hulu_num_eighteen, hulu_num_all, 
                   disney_num_seven,disney_num_thirteen, disney_num_sixteen, 
                   disney_num_eighteen, disney_num_all)
)
df$ages <- factor(df$ages, levels=c("7+", "13+", "16+", "18+", "all"), 
                    labels=c("7+", "13+", "16+", "18+", "all"))