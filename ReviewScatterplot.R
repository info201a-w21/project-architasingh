# This file contains the code that creates a scatterplot.
# The two continuous variables that are used are: Rotten Tomatoes reviews and
# the IMDb reviews

library(dplyr)
library(ggplot2)
movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

# Converting Rotten Tomatoes percentages to numeric type.
movies$Rotten.Tomatoes <- as.numeric(sub("%", "", movies$Rotten.Tomatoes))

scatterplot <- function() {
  # Filtering movies to make sure they have both a value for IMDb and 
  # a value for Rotten Tomatoes. This is because we're trying to see how well
  movies_filtered <- movies %>%
    filter(!is.na(IMDb)) %>%
    filter(!is.na(Rotten.Tomatoes))

# Code for the scatterplot. We figured there would be overlap so we added
# an alpha value.
  scatterplot <- ggplot(data = movies_filtered) +
    geom_point(
    mapping = aes(x = IMDb, y = Rotten.Tomatoes),
    alpha = .15
    ) +
  ggtitle("Rotten Tomatoes vs IMDb Review") +
  xlab("IMDb Score") +
  ylab("Rotten Tomatoes Score")
return(scatterplot)
}