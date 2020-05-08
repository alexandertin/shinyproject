

library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(data.table)

# Importing dataframe



# Load datasets
nhlreg <- read_csv(file ="./data/NHLRegular_Total.csv")
nhlreg <- nhlreg[,0:204]








# Regular season table
regtbl = nhlreg %>% select(
  .,
  'DftYr',
  'Age',
  'Seasons',
  'H-Ref Name',
  'Team',
  'GP',
  'G',
  'A',
  'CPP',
  'CriG',
  'CruG',
  'CruA1',
  'CruA2'
)






















