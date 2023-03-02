# Second chart 

# install required packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

# Load required libraries
library(tidyr)
library(dplyr)
library(ggplot2)

# Load data from a CSV file
data <- read.csv("/Users/stlp/desktop/2017-2023-10-Checkouts-SPL-Data.csv")

# Filter the data for relevant mediums
mediums <- c("BOOK", "EBOOK", "AUDIOBOOK", "MUSIC", "MOVIE")
medium_data <- data %>% filter(MaterialType %in% mediums)

# Group by checkout year and material type and summarize checkouts
yearly_medium_checkouts <- medium_data %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(TotalCheckouts = sum(Checkouts), .groups = "drop_last")

# Create a line chart to visualize the data
ggplot(yearly_medium_checkouts, aes(x = CheckoutYear, y = TotalCheckouts, color = MaterialType)) +
  geom_line(size = 1.5, aes(linetype = MaterialType)) +
  labs(title = "Yearly Circulation Trends by Medium",
       y = "Checkouts",
       x = "Year",
       color = "Medium") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank())
