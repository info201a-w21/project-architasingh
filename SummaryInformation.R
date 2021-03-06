# This file contains analysis on the datasets themselves. 
# One example would be numbers of rows/columns in the dataset.
library(dplyr)
movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

# Create a list to store basic information like number of rows and 
# features, then see what those features are.
summary_info <- list()
summary_info$num_observations <- nrow(movies)
summary_info$num_features <- ncol(movies)
summary_info$feature_names <- colnames(movies)

# Investigating the highest rating for IMDb and Rotten Tomates, then
# counting the number of these high ratings.

summary_info$IMDb_highest_rating <- movies %>%
  filter(IMDb == max(IMDb, na.rm = TRUE)) %>%
  pull(IMDb)

summary_info$num_IMDb_highest_rating <- movies %>%
  filter(IMDb == max(IMDb, na.rm = TRUE)) %>%
  count()

summary_info$RT_highest_rating <- movies %>%
  filter(Rotten.Tomatoes == max(Rotten.Tomatoes)) %>%
  pull(Rotten.Tomatoes)

summary_info$num_RT_highest_rating <- movies %>%
  filter(Rotten.Tomatoes == max(Rotten.Tomatoes)) %>%
  count()