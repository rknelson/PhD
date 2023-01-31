### Description: "Wrangling Colorado River Data"
### Takes data based on Colorado River and creating visual components   
### Author: Riley Nelson
### Date created: October 2, 2022
### Last updated : October, 2022
rm(list=ls())
# Installing Packages 
install.packages("tidyverse")
library("tidyverse")

install.packages("janitor")
library("janitor")

install.packages("lubridate")
library("lubridate")

# Installing Data

border_flow <- read_csv("C:/BAE_455/Module6/data/data/border_flow.csv")

lake_mead_depth <- read_csv("C:/BAE_455/Module6/data/data/lake_mead_depth.csv")

lake_powell_flow <- read_csv("C:/BAE_455/Module6/data/data/lake_powell_flow.csv")

lees_ferry_flow <- read_csv("C:/BAE_455/Module6/data/data/lees_ferry_flow.csv")
