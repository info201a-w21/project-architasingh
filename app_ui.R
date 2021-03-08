library(dplyr)
library(shiny)
library(tidyverse)
library(lintr)

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

ui <- fluidPage(
    
    page_one <- tabPanel(
        "Introduction",
        titlePanel("Introduction"),
            
        mainPanel(
                h3("Introduction"),
                p("Clearly introduces the purpose of the project (i.e., questions it seeks to answer) 
                  and what datasets it will use to do so. Some visual flare (e.g., background image) is present."),
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
            ),
            
            mainPanel(
                plotOutput("movies_bargraph"),
                p("Creates a well laid out page with a set of 1+ controls that configure a chart. 
                  Chart must be intentionally designed to reveal particular patterns in the data, 
                  and meet course standards of labeling // clarity."),
            )
        )
    ),
    
    page_four <- tabPanel(
        "Interactive Page 3",
        titlePanel("Interactive Page 3"),
        
        sidebarLayout(
            sidebarPanel(
            ),
            
            mainPanel(
                plotOutput("movies_scatterplot"),
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