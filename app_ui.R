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
            p("When we think about watching movies in the modern world, especially during the pandemic, we think about watching them from 
            the comfort of our homes. The popularity of Netflix, Amazon Prime, Disney +, and Hulu has rocketed in recent years due to 
            the convenience of streaming platforms as well as the quality content they provide to users." 
            ),
                
            p("Our team is curious about the difference among these 4 major platforms and what specific characteristics set them apart 
            from each other. Our data set contains information about the movies available on Netflix, Amazon Prime, Disney +, and Hulu 
            and we found it on Kaggle:"
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
        "Barchart",
        titlePanel("Barchart"),
        
        sidebarLayout(
            sidebarPanel(
                selectInput(inputId = "Age Group",
                            choices = c("7+","13+","16+", "18+", "all"),
                            label = "Pick an Age Group")
            ),
            
            mainPanel(
                plotlyOutput(outputId = "movies_barchart"),
                br(""),
                p("Our team made this barchart so we could see what kind of
                  content was available for different age groups on each 
                  streaming platform. Since Amazon Prime has the most movies,
                  it makes sense that it has the most movies for each age group.
                  Netflix comes in second with a large amount of options for 
                  each age group aside from 16+."),
            )
        )
    ),
    
    page_three <- tabPanel(
        "Bargraph",
        titlePanel("Bargraph"),
        
        sidebarLayout(
            sidebarPanel(
                selectInput(inputId = "color",
                            choices = c("light blue", "light green", "pink", "purple"),label = "Choose a color")
            ),
            
            mainPanel(
                plotlyOutput(outputId = "movies_bargraph"),
                br(""),
                p("Our team decided to create this bar graph to show the number
                  of movies that are currently being streamed among the different 
                  streaming services. As seen above, Amazon Prime Video is currently streaming
                  the most movies out of all the streaming services. The chart organizes each
                  streaming service from most streamed movies to least, from left to right."),
            )
        )
    ),
    
    page_four <- tabPanel(
        "Scatterplot",
        titlePanel("Scatterplot"),
        
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
                br(""),
                p("Our team has created this scatterplot to compare reviews from
                  the provided sites, which in this case was Rotten Tomatoes and
                  IMDb. As seen above, the reviews can vary wildly, with some
                  movies receiving a perfect score from one site and receiving a
                  mediocre review from another."),
            )
        )
    ),
    
    page_five <- tabPanel(
        "Conclusion",
        titlePanel("Conclusion"),
       
        mainPanel(
            p(paste0("From our scatterplot that compares Rotten",
                      " Tomatoes and IMDb reviews, one key takeaway is that",
                      " review sites have wildly varying reviews. We observe",
                      " this by filtering a low minimum for IMDb such as 5,",
                      " and then filtering for a high minimum value such as",
                      " 100 on the Rotten Tomatoes review (and vice versa).",
                      " While we have not done formal testing, there are",
                      " clearly data points with these contrasting scores,",
                      " which could indicate that there are a significant number of films",
                      " where review sites have wildly varying scores for.",
                      
                      " Users of these sites should therefore be wary that",
                      " a film’s \"score\" from a review site is highly",
                      "subjective.")),
            p(paste0("Our barchart shows the amount of movies available for each age group
            across each streaming platform. One key takeaway from this chart is that the best
            platform for a younger audience is Disney, as it has primarily family-friendly content.
            Its movie age ratings primarily fall under the 7+, 13+, and all ages categories.
            All of the other platforms, Amazon Prime, Hulu, and Netflix, have a significant amount 
            of adult content available for viewers. This takeaway was not very surprising, as Disney
            is known to be a family-friendly brand, but it was interesting to directly compare its content
            with that of the other three big streaming platforms."))
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