# First chart 
# install required packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load data from a CSV file
data <- read.csv("/Users/stlp/desktop/2017-2023-10-Checkouts-SPL-Data.csv")

# Filter the data for fiction and non-fiction books

material_data <- data %>% filter(MaterialType %in% c("BOOK", "EBOOK"))


# Group by checkout year and material type and summarize checkouts
yearly_material_checkouts <- material_data %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(TotalCheckouts = sum(Checkouts), .groups = 'drop')

# Pivot the data to make it wide

yearly_material_checkouts_wide <- yearly_material_checkouts %>%
  pivot_wider(names_from = MaterialType, values_from = TotalCheckouts)

# Create a line chart to visualize the data

ggplot(data = yearly_material_checkouts_wide,
       aes(x = CheckoutYear, y = EBOOK, group = 1)) +
  geom_line(color = "blue", linewidth = 1.5) +
  geom_line(aes(y = BOOK), color = "green", size = 1.5) +
  labs(title = "Yearly Circulation Trends of BOOK and EBOOK",
       y = "Checkouts", x = "Year") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank())