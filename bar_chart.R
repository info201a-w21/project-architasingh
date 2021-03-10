library("ggplot2") 
library("dplyr")
library("tidyr")

#load csv file
movies <- read.csv("Data/MoviesOnStreamingPlatforms_updated.csv", header = TRUE)

bar_chart <- function() {
  
  #count how many movies belong to each age group for each platform
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
  
  #total amount of movies with listed age groups
  total <- prime_num_seven + prime_num_thirteen + prime_num_sixteen + 
    prime_num_eighteen + prime_num_all + netflix_num_seven + 
    netflix_num_thirteen + netflix_num_sixteen + netflix_num_eighteen + 
    netflix_num_all + hulu_num_seven + hulu_num_thirteen + hulu_num_sixteen + 
    hulu_num_eighteen + hulu_num_all + disney_num_seven + 
    disney_num_thirteen + disney_num_sixteen + disney_num_eighteen + 
    disney_num_all

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
  
  return(barchart)
}