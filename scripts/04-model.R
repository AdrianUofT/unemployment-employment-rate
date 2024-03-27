#### Preamble ####
# Purpose: Models the Unemployment Rate 
# Author: Adrian Ly
# Date: 18 March 2024
# Contact: adrian.ly@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download the dataset and run 00-install_packages.R and 02-data_cleaning.R first
# Any other information needed? Dataset can be downloaded from https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=1410002001


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

model <- lm(youth_unemployment ~ education_level + reference_period + adult_unemployment + senior_unemployment, data = unemployment_data)

# Summary of the model
summary(model)

#### Save model ####
saveRDS(
  model,
  file = "models/unemployed_model.rds"
)



