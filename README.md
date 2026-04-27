# mental-health-social-media-analysis
Exploring how social media usage patterns influence stress, sleep, and happiness using R

# Mental Health and Social Media Usage Analysis 

## Overview
This project explores how social media usage patterns influence mental health indicators such as **stress level**, **sleep quality**, and **happiness index** using R programming language.

The analysis is based on a publicly available dataset and includes data cleaning, exploratory data analysis (EDA), and data visualization.

## Objectives
- Analyze the relationship between daily screen time and stress level
- Explore sleep quality variations across gender
- Compare happiness index across different social media platforms
- Understand the impact of digital detox (days without social media)

## Dataset
- **Source:** Kaggle – Mental Health & Social Media Balance Dataset
- **Observations:** 500 users
- **Features:** Age, gender, screen time, stress, sleep quality, exercise, platform usage, happiness

> Dataset link: https://www.kaggle.com/datasets/prince7489/mental-health-and-social-media-balance-dataset

## Tools & Technologies
- R (RStudio)
- Packages: `dplyr`, `ggplot2`, `readxl`, `tidyverse`

## Project Structure
data/       -> Raw and cleaned datasets
scripts/    -> R scripts for analysis
outputs/    -> Generated plots
report/     -> Project report (PDF)

## Key Findings
- Increased screen time is associated with higher stress levels
- Users with more days off social media tend to report lower stress
- Sleep quality varies slightly across gender groups
- Social media platform choice shows differences in happiness and stress

## How to Run
1. Clone this repository
2. Open RStudio
3. Run scripts in order:
   - `01_data_import_cleaning.R`
   - `02_exploratory_data_analysis.R`
   - `03_visualization.R`

## Author
**Sadikuzzaman Rakib**  
Department of Computer Science  
American International University-Bangladesh (AIUB)

## License
This project is licensed under the MIT License.
