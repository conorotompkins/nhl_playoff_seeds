rm(list = ls())

source("scripts/load_data.R")
source("scripts/load_seed_data.R")

df_team_abbr <- read_csv("data/NHL_team_names_abbr.csv")

df_results <- df_results %>% 
  left_join(df_team_abbr) %>% 
  left_join(df_seeds)


