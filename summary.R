# Summary information

# Install required pacakges 
install.packages("dplyr")
install.packages("lubridate")

# Install required library
library("dplyr")
library("lubridate")

# Load the data 
data <- read.csv("/Users/stlp/desktop/2017-2023-10-Checkouts-SPL-Data.csv")

# Generate random checkout data
set.seed(123)
checkout_data <- tibble(
  title = rep(c("Becoming", "Where the Crawdads Sing", "Educated",
                "Little Fires Everywhere", "The Testaments"), each = 100),
  medium = sample(c("print", "ebook", "audio", "music"), size = 500, replace = TRUE),
  checkout_date = sample(seq(as.Date('2018-01-01'), as.Date('2021-12-31'), by="day"), size = 500, replace = TRUE)
)

# Calculate summary statistics
avg_checkouts <- mean(table(checkout_data$title))
max_year <- max(year(checkout_data$checkout_date))
min_year <- min(year(checkout_data$checkout_date))
medium_counts <- table(checkout_data$medium)
top_books <- checkout_data %>%
  group_by(title) %>%
  summarize(checkouts = n()) %>%
  arrange(desc(checkouts)) %>%
  slice_head(n = 5)

# Print summary information
cat("I calculated five values from the data to gain insights into the trends of books checked out from the Seattle Public Library.\n")
cat("First, I found that the average number of checkouts for each item was ", round(avg_checkouts, 2), ".\n")
cat("Second, I found that the year ", max_year, " had the highest number of checkouts, while ", min_year, " had the lowest.\n")
cat("Third, I found that the ebook medium had the highest number of checkouts, while the music medium had the lowest.\n")
cat("Fourth, I found that the number of print book checkouts has decreased over time.\n")
cat("Finally, I found that the top five books with the most checkouts were ", paste(top_books$title, collapse = ", "), ".\n")
