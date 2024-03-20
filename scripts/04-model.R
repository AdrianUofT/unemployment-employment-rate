#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


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
library(lme4)

#### Read data ####
unemployment_data <- read_csv("data/analysis_data/cleaned_unemployed_data.csv")  
employment_data <- read_csv("data/analysis_data/cleaned_employed_data.csv")  

model <- lm(youth_unemployment ~ education_level + reference_period + adult_unemployment + senior_unemployment, data = unemployment_data)

model2 <- lm(youth_employment ~ education_level + reference_period + adult_employment + senior_employment, data = employment_data)

# Summary of the model
summary(model)

summary(model2)

#### Save model ####
saveRDS(
  model,
  file = "models/unemployed_model.rds"
)

saveRDS(
  model2,
  file = "models/employed_model.rds"
)

