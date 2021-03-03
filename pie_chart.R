# This file contains the code that creates a pie chart
# The continuous variable that is being used is: Age

library("ggplot2") 
library("dplyr")
library("tidyr")

#load csv file

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

pie_chart <- function() {
  #count how many movies were intended for people of each age group
  num_seven <- movies %>%
    filter(Age == "7+") %>%
    nrow()
  num_thirteen <- movies %>%
    filter(Age == "13+") %>% 
    nrow()
  num_sixteen <- movies %>%
    filter(Age == "16+") %>% 
    nrow()
  num_eighteen <- movies %>%
    filter(Age == '18+') %>% 
    nrow()
  num_all <- movies %>%
    filter(Age == "all") %>% 
    nrow()
  
  #total amount of movies with listed age groups
  total <- num_seven + num_thirteen + num_sixteen + num_eighteen + num_all
  
  #create table with age groups, movie amount in each age group, and 
  #proportion of each age group
  age_group_amt.data <- data.frame(Age_Group = c("7+", "13+", "16+", "18+", "all"),
                                   Amount = c(num_seven, num_thirteen, num_sixteen, num_eighteen, num_all),
                                   prop = c(round(num_seven/total * 100, 2), round(num_thirteen/total* 100, 2), round(num_sixteen/total * 100, 2), round(num_eighteen/total * 100, 2), round(num_all/total * 100, 2)))
  age_group_amt.data
  
  #add label position
  age_group_amt.data <- age_group_amt.data %>%
    arrange(desc(Age_Group)) %>%
    mutate(lab.ypos = round(cumsum(prop) - 0.5*prop, 2))
  age_group_amt.data
  
  mycols <- c("#031A6B", "#004385", "#033860", "#087CA7", "#05B2DC")
  
  #create pie chart
  pie_chartt <- ggplot(age_group_amt.data, aes(x = "", y = prop, fill = Age_Group)) +
    geom_bar(width = 1, stat = "identity", color = "white") +
    coord_polar("y", start = 0)+
    geom_text(aes(y = lab.ypos, label = prop), color = "white") +
    scale_fill_manual(values = mycols) +
    labs (title = "Movie Distribution Across Different Age Groups") +
    labs(fill = 'Age Groups') +
    theme_void()
  return(pie_chartt)
}