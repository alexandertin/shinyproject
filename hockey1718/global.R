

library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(ggplot2)
library(dplyr)
library(data.table)
library(tidyverse)
library(plotly)
library(data.table)
library(DT)


# Importing dataframe



################ Load datasets


#data for team stats in regular season
team2018reg <- read_csv(file='./data/NHLReg.csv',col_names = TRUE)

#data for player stats in playoffs (basic) - convert to team stats
team2018playoff <- read_csv(file='./data/NHLPlayoffs_Basic.csv',col_names=TRUE)

#data for player stats in playoffs (advanced) - convert to team stats
team2018playoffadv <- read_csv(file='./data/NHLPlayoffs_Advanced.csv',col_names=TRUE)

# Historical team data - from hockey-reference
#https://www.hockey-reference.com/play-index/tpbp_finder.cgi
teamhistreg <- read_csv(file='./data/Team2010_2019.csv',col_names=TRUE)
teamhistreg$`Eventual Champion` <- as.factor(teamhistreg$`Eventual Champion`)


# Teams for each division
Atlantic = c('BOS','TBL','TOR','FLA','MTL','BUF','OTT','DET')
Metro = c('WSH','PHI','PIT','CAR','CBJ','NYI','NYR','NJD')
Central = c('STL','COL','DAL','WPG','NSH','MIN','CHI')
Pacific = c('VEG','EDM','CGY','VAN','ARI','ANA','LAK','SJS')


fifty = 50

#Add divisions for all datasets
teamhistreg <- teamhistreg %>% mutate(., Division = ifelse(Tm %in% Atlantic,'Atlantic', ifelse(Tm %in% Metro, 'Metropolitan', ifelse(Tm %in% Central, 'Central','Pacific'))))





################ Regular season table
regtbl = playerreg %>% select(
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

# Teams for each division
Atlantic = c('BOS','TBL','TOR','FLA','MTL','BUF','OTT','DET')
Metro = c('WSH','PHI','PIT','CAR','CBJ','NYI','NYR','NJD')
Central = c('STL','COL','DAL','WPG','NSH','MIN','CHI')
Pacific = c('VEG','EDM','CGY','VAN','ARI','ANA','LAK','SJS')







######## Choices to select

vars <- c(
 'Total shots taken (CF)' = 'CF',
 'Total shots faced (CA)' = 'CA',
 'Corsi For %' = 'CF%',
 'Shots fired towards net (FF)' = 'FF',
 'Goals Percentage' = 'oiSH%',
 'Offensive Zone Start %' = 'oZS%',
 'Defensive Zone Start %' = 'dZS%',
 'Face-off Wins (FO%)' = 'FO%',
 'Goalie Save Percentage' = 'oiSV%',
 'Hits' = 'HIT',
 'Blocks' = 'BLK'
)













