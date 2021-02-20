# This file contains code that creates a bar graph
# The result of this bar chart will used use the different Streaming -
# Services column provided in the 'movies' data set
movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

library(ggplot2)

# This calculates the total number of Netflix movies in the data set
netflix_sum <- sum(movies$Netflix)

# This calculates the total number of Hulu movies in the data set
hulu_sum <- sum(movies$Hulu)

# This calculates the total number of Amazon Prime Video movies in the data set
prime_video_sum <- sum(movies$Prime.Video)

# This calculates the total number of Disney movies in the data set
disney_sum <- sum(movies$Disney.)
  
# The following creates a data frame used to create the bar chart
# The name of the streaming service will be displayed on the x-axis
# The number of movies are used to label the y-axis
movies_data <- data.frame(
  streaming_services = c("Netflix", "Hulu", "Prime.Video", "Disney."),
  number_of_movies = c(netflix_sum, hulu_sum, prime_video_sum, disney_sum)
)

# This code creates the bar chart itself
bargraph <- ggplot(movies_data, aes(x = streaming_services, y = number_of_movies)) +
  geom_bar(stat = "identity") +
  labs (
    title = "Amount of Movies Per Streaming Service"
  )