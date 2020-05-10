

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

#data for advanced stats for players in regular season
playerreg <- read_csv(file ="./data/NHLRegular_Total.csv")
playerreg <- playerreg[,0:204]

#data for team stats in regular season
teamreg <- read_csv(file='./data/NHLReg.csv',col_names = TRUE)

#data for player stats in playoffs (basic) - convert to team stats
teamplayoff <- read_csv(file='./data/NHLPlayoffs_Basic.csv',col_names=TRUE)

#data for player stats in playoffs (advanced) - convert to team stats
teamplayoffadv <- read_csv(file='./data/NHLPlayoffs_Advanced.csv',col_names=TRUE)

# team aggregate stats for seasons 2010-2019
team2010_2019 <- read_csv(file='./data/Team2010_2019.csv',col_names=TRUE)





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

#Adding Divisions to player stats
playertbl <- playertbl %>% mutate(., Division = ifelse(Team %in% Atlantic,'Atlantic', ifelse(Team %in% Metro, 'Metropolitan', ifelse(Team %in% Central, 'Central','Pacific'))))

# Regular Season Team Comparison table

#adding Divisions to team 
teamregtbl <- teamreg %>% mutate(., Division = ifelse(Team %in% Atlantic,'Atlantic', ifelse(Team %in% Metro, 'Metropolitan', ifelse(Team %in% Central, 'Central','Pacific'))))

teamregtbl



#####################Playoff stats

##Manipulate colnames of stats

#add identifier as playoff stats ('playoff_'), and convert to lowercase
colnames(teamplayoff) <- paste0('playoff_',tolower(colnames(teamplayoff)))

#add identifier as playoff stats ('playoff_'), and convert to lowercase
colnames(teamplayoffadv) <- paste0('playoff_',tolower(colnames(teamplayoffadv)))

#remove duplicate column except for identifier to merge with teamplay
teamplayoffadvfin <- subset(teamplayoffadv,select=-c(playoff_rk,playoff_x3, playoff_player,playoff_age,playoff_tm,playoff_pos,playoff_gp))

#merge teamplayoffs
playofftotal <- bind_cols(teamplayoff, teamplayoffadvfin)

#add divisions
playofftotal <- playofftotal %>% mutate(., division = ifelse(playoff_tm %in% Atlantic,'Atlantic', ifelse(playoff_tm %in% Metro, 'Metropolitan', ifelse(playoff_tm %in% Central, 'Central','Pacific'))))



################# Team Stats


# Plotting champions of each year

champs1019 <- team2010_2019[team2010_2019$`Eventual Champion` ==1,]

# Overall average of metrics

avgseasonstat = team2010_2019 %>% group_by(., Season) %>% summarise_all(., mean)

avgseasonstat = subset(avgseasonstat, select = -c(Tm, `Eventual Champion`))



####

vars <- c(
 'Corsi For' = 'CF',
 'Corsi Against' = 'CA',
 'Corsi For %' = 'CF%',
 'Hits' = 'HIT',
 'Blocks' = 'BLK'
)













