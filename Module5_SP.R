### Description: "Tidying Sweet Potato Data"
### Takes data based on sweet potatoes and creating visual components   
### Author: Riley Nelson
### Date created: September 18, 2022
### Last updated : September 21, 2022

# Installing Packages 
install.packages("tidyverse")
library("tidyverse")

install.packages("janitor")
library("janitor")

# Reading in data
sweet_potatoes <- read_csv("C:/BAE_455/Module5/sp_usda_nass.csv")


# Inspecting Data 
head(sweet_potatoes)
tail(sweet_potatoes)
glimpse(sweet_potatoes)

# Change the column names to lower snake case ----
sweet_potatoes <- clean_names(sweet_potatoes)

colnames(sweet_potatoes)

# Selecting Columns

sweet_potatoes <- dplyr:: select(sweet_potatoes, year, state, ag_district, county, data_item, value)


# Filter to keep NC data 

sweet_potatoes %>% 
  filter ( state == "NORTH CAROLINA") -> sweet_NC

glimpse(sweet_NC)

# Separating Data Item Column 
sweet_NC %>% 
  separate(data_item, into = c("crop", "measure"), sep = "-") -> sweet_NC

# Converting value to numeric
sweet_NC %>% 
  filter ( value != "(D)") -> sweet_NC_clean

sweet_NC_clean$value <- as.numeric(sweet_NC_clean$value)
sweet_NC_clean

# Creating a plot

sweet_NC_clean %>%
   ggplot() +
   geom_point(mapping = aes(x = year,
                            y = value, 
                            ),
              stat = "identity",
              position =  "dodge") +
        facet_grid(measure ~ ag_district, scales = "free_y") +
        theme_minimal() + 
  labs(title = "Sweet Potato Production Trends in North Carolina")

# Summarize 2018 Data 

sweet_NC_clean %>% 
   filter(year == 2018) %>%
   pivot_wider(, names_from = measure) %>%
   clean_names() %>% 
  group_by(ag_district) %>%
  summarise(total_cwt_district = acres_harvested * yield_measured_in_cwt_acre) %>%
  summarise(total_lb_district = sum(total_cwt_district * 112)) -> total_sweetpots
   
  
   