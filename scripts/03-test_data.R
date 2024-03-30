#### Preamble ####
# Purpose: Tests the simulated and real data for any errors
# Author: Adrian Ly
# Date: 18 March 2024
# Contact: adrian.ly@mail.utoronto.ca
# License: MIT
# Pre-requisites: First run 00-install_packages.R and 01-simulate_data and download the dataset
# Any other information needed? Dataset can be downloaded at https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=1410002001


#### Workspace setup ####
library(readr)
library(lubridate)
library(tidyverse)
library(dplyr)
library(tidyr)
library(knitr)
library(janitor)
library(scales)
library(RColorBrewer)
library(ggplot2)
library(kableExtra)
library(here)
library(arrow)

#### Test data ####

# Read in data

unemployed_data <- read_csv("data/analysis_data/cleaned_unemployed_data.csv")  
simulated_data <- read_csv("data/analysis_data/simulated_unemployed_data.csv")  

# Test Simulated Data

# 1. Check for Missing Values
missing_values <- sum(is.na(simulated_data))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values in the dataset."))
} else {
  print("No missing values found in the dataset.")
}

# 2. Validate Data Ranges (assuming unemployment rates should be between 0 and 100)
invalid_unemployment_rates <- simulated_data %>%
  filter(youth_unemployment < 0 | youth_unemployment > 100 |
           adult_unemployment < 0 | adult_unemployment > 100 |
           senior_unemployment < 0 | senior_unemployment > 100)

if (nrow(invalid_unemployment_rates) > 0) {
  print(paste("There are", nrow(invalid_unemployment_rates), "rows with invalid unemployment rates."))
} else {
  print("All unemployment rates are within valid ranges.")
}

# 3. Consistency Check (for example, ensuring 'reference_period' is within the expected range)
# Assuming the reference period should be between 2019 and 2023
invalid_reference_periods <- simulated_data %>%
  filter(reference_period < 2019 | reference_period > 2023)

if (nrow(invalid_reference_periods) > 0) {
  print(paste("There are", nrow(invalid_reference_periods), "rows with invalid reference periods."))
} else {
  print("All reference periods are within the expected range.")
}

# Test Actual Data

# 1. Check for Missing Values
missing_values <- sum(is.na(unemployed_data))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values in the dataset."))
} else {
  print("No missing values found in the dataset.")
}

# 2. Validate Data Ranges (assuming unemployment rates should be between 0 and 100)
invalid_unemployment_rates <- unemployed_data %>%
  filter(youth_unemployment < 0 | youth_unemployment > 100 |
           adult_unemployment < 0 | adult_unemployment > 100 |
           senior_unemployment < 0 | senior_unemployment > 100)

if (nrow(invalid_unemployment_rates) > 0) {
  print(paste("There are", nrow(invalid_unemployment_rates), "rows with invalid unemployment rates."))
} else {
  print("All unemployment rates are within valid ranges.")
}

# 3. Consistency Check (for example, ensuring 'reference_period' is within the expected range)
# Assuming the reference period should be between 2019 and 2023
invalid_reference_periods <- unemployed_data %>%
  filter(reference_period < 2019 | reference_period > 2023)

if (nrow(invalid_reference_periods) > 0) {
  print(paste("There are", nrow(invalid_reference_periods), "rows with invalid reference periods."))
} else {
  print("All reference periods are within the expected range.")
}

