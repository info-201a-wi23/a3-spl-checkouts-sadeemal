# Third chart

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

# Filter the data for relevant titles
data_filtered <- data %>%
  filter(Title == "The Great Gatsby")

# Aggregate the data by checkout month and checkout type
monthly_checkouts <- data_filtered %>%
  group_by(CheckoutMonth, CheckoutType) %>%
  summarize(total_checkouts = sum(Checkouts))

# Create a bar chart to display the data
ggplot(monthly_checkouts, aes(x = CheckoutMonth, y = total_checkouts, fill = CheckoutType)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Total Checkouts of The Great Gatsby by Month and Checkout Type") +
  xlab("Checkout Month") +
  ylab("Total Checkouts")
data_filtered
