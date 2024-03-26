# Evaluating the Influence of Education on Current Unemployment Trends

## Statement on LLM Usage 

Aspects of the code and paper were written with the help of ChatGPT. Some of the data interpretation, introduction, abstract and discussion were also written using ChatGPT. The entire chat history is available in `other/llm/usage.txt`

## Overview

We examine data regarding unemployment rates for people with varying education levels and age groups. The dataset covers unemployment rates from 2019-2023. We're leveraging a multiple linear regression model to estimate the impact of various education levels on unemployment rates among the youth. The model incorporates age groups and education as predictors to understand their influence on unemployment trends. Our aim is to quantify these relationships and identify significant predictors that can inform policy decisions. This study also evaluates the net change in unemployment rates, providing a nuanced view of the labor market's evolution over the years specified.

## File Structure

The repo is structured as:

* `/other/sketches`: Contains sketches for the datasets.
* `/data/analysis_data`: Contains cleaned datasets.
* `/other/llm`: Contains LLM usage.
* `/models`: Contains models used in this paper.
* `/paper`: Documentation and final analysis report.
* `/data/raw_data`: Contains raw datasets.
* `/scripts`: R scripts used for data cleaning, processing, replication and analysis.

## How to Use
Clone the repository.
Install R and necessary packages.
Run the scripts in the `/scripts` directory to replicate the analysis.