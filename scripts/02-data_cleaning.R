#### Preamble ####
# Purpose: Cleans the raw dataset for employed and unemployed people
# Author: Adrian Ly
# Date: 18 March 2024
# Contact: adrian.ly@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(readr)
library(lubridate)
library(tidyverse)
library(dplyr)
library(knitr)
library(janitor)
library(scales)
library(RColorBrewer)
library(ggplot2)
library(kableExtra)
library(here)
library(arrow)

# READ IN UNEMPLOYED AND EMPLOYED DATA

unemployed_data <- read_csv("data/raw_data/unemployment.csv", skip = 11)  
employed_data <- read_csv("data/raw_data/employment.csv", skip = 11)  

# CLEAN NAMES

unemployed_data <- unemployed_data %>% clean_names()
employed_data <- employed_data %>% clean_names()

# RENAME COLUMNS

unemployed_data <- unemployed_data %>%
  rename(
    education_level = x1,
    reference_period = age_group,
    youth_unemployment = x15_to_24_years,
    adult_unemployment = x25_to_44_years,
    senior_unemployment = x45_years_and_over
  )

employed_data <- employed_data %>%
  rename(
    education_level = x1,
    reference_period = age_group,
    youth_employment = x15_to_24_years,
    adult_employment = x25_to_44_years,
    senior_employment = x45_years_and_over
  )

# Remove unwanted rows from the bottom, assuming you want to remove the last 5 rows as an example
unemployed_data <- unemployed_data %>%
  slice(1:(n() - 13))

unemployed_data <- unemployed_data %>%
  slice(-1:-2)  # This removes the first and second rows

unemployed_data <- unemployed_data %>%
  fill(education_level, .direction = "down")

employed_data <- employed_data %>%
  slice(1:(n() - 13))

employed_data <- employed_data %>%
  slice(-1:-2)  # This removes the first and second rows

employed_data <- employed_data %>%
  fill(education_level, .direction = "down")

# Convert reference_period to numeric if it only contains years
unemployed_data$reference_period <- as.numeric(unemployed_data$reference_period)
employed_data$reference_period <- as.numeric(employed_data$reference_period)

# In case of conversion errors due to non-numeric characters, use this to force conversion
unemployed_data$youth_unemployment <- as.numeric(as.character(unemployed_data$youth_unemployment))
unemployed_data$adult_unemployment <- as.numeric(as.character(unemployed_data$adult_unemployment))
unemployed_data$senior_unemployment <- as.numeric(as.character(unemployed_data$senior_unemployment))

unemployed_data <- unemployed_data %>%
  mutate(education_level = sub("\\s+\\d+$", "", education_level))

employed_data$youth_employment <- as.numeric(as.character(employed_data$youth_employment))
employed_data$adult_employment <- as.numeric(as.character(employed_data$adult_employment))
employed_data$senior_employment <- as.numeric(as.character(employed_data$senior_employment))

employed_data <- employed_data %>%
  mutate(education_level = sub("\\s+\\d+$", "", education_level))



#### Save data ####
write_csv(unemployed_data, here::here("data/analysis_data/cleaned_unemployed_data.csv"))
write_csv(employed_data, here::here("data/analysis_data/cleaned_employed_data.csv"))
