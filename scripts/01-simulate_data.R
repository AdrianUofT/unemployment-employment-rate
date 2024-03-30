#### Preamble ####
# Purpose: Simulates a dataset for the unemployment rates
# Author: Adrian Ly 
# Date: 18 March 2024
# Contact: adrian.ly@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 00-install_packages.R first

#### Workspace setup ####
library(readr)
library(lubridate)
library(tidyverse)
library(tidyr)
library(dplyr)
library(knitr)
library(janitor)
library(scales)
library(RColorBrewer)
library(ggplot2)
library(kableExtra)
library(here)
library(arrow)

#### Simulate data ####
# Define the structure of the dataset
education_levels <- c("0 to 8 years", "Above bachelor's degree", "Bachelor's degree",
                      "High school graduate", "Postsecondary certificate or diploma",
                      "Some high school", "Some postsecondary", "Total, all education levels",
                      "University degree")
years <- 2019:2023

# Simulate data
set.seed(123) # Setting seed for reproducibility
simulated_data <- expand.grid(education_level = education_levels, reference_period = years) %>%
  mutate(youth_unemployment = runif(n = n(), min = 5, max = 25),
         adult_unemployment = runif(n = n(), min = 5, max = 25),
         senior_unemployment = runif(n = n(), min = 5, max = 25))

write_csv(simulated_data, here::here("data/analysis_data/simulated_unemployed_data.csv"))

