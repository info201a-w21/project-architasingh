# This file contains the code that creates a scatterplot.
# The two continuous variables that are used are: Rotten Tomatoes reviews and
# the IMDb reviews

movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

# Converting Rotten Tomatoes percentages to numeric type.
movies$Rotten.Tomatoes <- as.numeric(sub("%", "", movies$Rotten.Tomatoes))

# Filtering movies to make sure they have both a value for IMDb and 
# a value for Rotten Tomatoes. This is because we're trying to see how well
# these two reviews agreed
movies_filtered <- movies %>%
  filter(!is.na(IMDb)) %>%
  filter(!is.na(Rotten.Tomatoes))

# Code for the scatterplot. We figured there would be overlap so we added
# an alpha value.
scatterplot <- ggplot(data = movies_filtered, aes(x = IMDb, y = Rotten.Tomatoes)) +
  geom_point(alpha = 0.15
  ) +
  scale_x_continuous(limits = range(0,10)) +
  scale_y_continuous((limits = range(movies_filtered$Rotten.Tomatoes))) +
  ggtitle("Rotten Tomatoes vs IMDb Review") +
  xlab("IMDb") +
  ylab("Rotten Tomatoes")