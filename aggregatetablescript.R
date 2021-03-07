# This file contains code that aggregates our 'movies' data set
# This file results in a data table that lists the top 10-ranked 
# IMDb movies
library(tidyverse)
library(knitr)

# This line downloads our 'movie' data set
movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

# 'highest_IMDb_movies' accesses the movies data set, it then groups the data set
# By the IMDb reviews column
# The next line arranges the reviews in descending order from highest to lowest
# The Last line in this section selects our desired observatons
highest_IMDb_movies <- movies %>%
  group_by(IMDb) %>%
  arrange(desc(IMDb)) %>%
  select(Title, IMDb) 

# The following code displays the first 10 indiciesin the newly arranged table
# This also happens to be the top 10 rated IMDb movies world wide
highest_IMDb_movies <- kable(head(highest_IMDb_movies, 10))
