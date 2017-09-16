rm(list = ls())

source("scripts/load_data.R")
source("scripts/load_seed_data.R")
#df only starts at 20072008, so I need to filter out the other seasons

team_abbr <- unique(df$team)
team_abbr <- tibble(team_abbr = team_abbr)

team_names <- unique(team_seeds$team)
team_names[12] <- "Anaheim Ducks"
team_names[c(17, 31)] <- ""
team_names <- unique(team_names)
team_names
team_names[c("Detroit Red Wings")]

<- "Anaheim Ducks"
team_names <- unique(team_names)
team_names
#team_names <- tibble(team_name = team_names)
team_names$team_name[team_names$team_name == "Mighty Ducks of Anaheim"] <- 

team_abbr
team_names




df_names <- tibble(team = c("Anaheim Ducks")
