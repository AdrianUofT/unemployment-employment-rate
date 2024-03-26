#### Preamble ####
# Purpose: Tests the simulated and real data for any errors
# Author: Adrian Ly
# Date: 18 March 2024
# Contact: adrian.ly@mail.utoronto.ca
# License: MIT
# Pre-requisites: First run 01-simulate_data and download dataset
# Any other information needed? Real dataset can be downloaded at https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=1410002001


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

#### Test data ####

# Read in data

unemployed_data <- read_csv("data/analysis_data/cleaned_unemployment.csv")  
simulated_data <- read_csv("data/analysis_data/simulated_unemployed.csv")  
