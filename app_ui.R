library(dplyr)
library(shiny)
library(tidyverse)
library(lintr)
library(plotly)

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

ui <- fluidPage(
    
    page_one <- tabPanel(
        "Introduction",
        titlePanel("Introduction"),
            
        mainPanel(
                p(
                "When we think about watching movies in the modern world, especially during the pandemic, we think about watching them from 
                the comfort of our homes. The popularity of Netflix, Amazon Prime, Disney +, and Hulu has rocketed in recent years due to 
                the convenience of streaming platforms as well as the quality content they provide to users." 
                ),
                
                p(
                "Our team is curious about the difference among these 4 major platforms and what specific characteristics set them apart 
                from each other. Our data set contains information about the movies available on Netflix, Amazon Prime, Disney +, and Hulu 
                and we found it on Kaggle."
                ), 
                
                a("https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney"),
               
                br(""),
                
                p("We chose to work with this data set because it provides a wide range of information to work with, including everything 
                from the directors to the countries the movies are available in. With the different types of data available, we were able 
                to take a deeper look at what proportion of movies were intended for each age group, cross reference IMDb and Rotten Tomato 
                ratings, and see the amount of movies available on each streaming service."
                ),
        )
        
    ),
    
    page_two <- tabPanel(
        "Interactive Page 1",
        titlePanel("Interactive Page 1"),
        
        sidebarLayout(
            sidebarPanel(
            ),
            
            mainPanel(
                plotOutput("movies_piechart"),
                p("Creates a well laid out page with a set of 1+ controls that configure a chart. 
                  Chart must be intentionally designed to reveal particular patterns in the data, 
                  and meet course standards of labeling // clarity."),
            )
        )
    ),
    
    page_three <- tabPanel(
        "Interactive Page 2",
        titlePanel("Interactive Page 2"),
        
        sidebarLayout(
            sidebarPanel(
                selectInput(inputId = "color",
                            choices = c("red", "blue", "green"),label = "Choose a color")
            ),
            
            mainPanel(
                plotlyOutput(outputId = "movies_bargraph"),
                p("Our team decided to create this bar graph to show the number
                  of movies that are currently being streamed among the different 
                  streaming services. As seen above, Amazon Prime Video is currently streaming
                  the most movies out of all the streaming services. The chart organizes each
                  streaming service from most streamed movies to least, from left to right."),
            )
        )
    ),
    
    page_four <- tabPanel(
        "Interactive Page 3",
        titlePanel("Interactive Page 3"),
        
        sidebarLayout(
            sidebarPanel(
                selectInput(inputId = "IMDb_Min",
                            choices = c("5", "6", "7", "8", "9", "10"),
                            label = "IMDb Minimum Review Score"
                ),
                selectInput(inputId = "RT_Min",
                            choices = c("50", "60", "70", "80", "90", "100"),
                            label = "Rotten Tomatoes Minimum Review Score")
            ),
            
            mainPanel(
                plotlyOutput("movies_scatterplot"),
                p("Creates a well laid out page with a set of 1+ controls that configure a chart. 
                  Chart must be intentionally designed to reveal particular patterns in the data, 
                  and meet course standards of labeling // clarity."),
            )
        )
    ),
    
    page_five <- tabPanel(
        "Conclusion",
        titlePanel("Conclusion"),
       
        mainPanel(
                p("Presents 3+ *specific takeaways* from the analysis, tying the project 
                  back to the intention set out in the introduction."),
        )
    )
)

ui <- navbarPage(
    "Movies on Different Streaming Platforms", 
    page_one,         
    page_two,
    page_three,
    page_four,
    page_five
)