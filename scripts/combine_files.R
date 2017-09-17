library(tidyverse)
library(viridis)

set.seed(1234)

rm(list = ls())

source("scripts/load_results_data.R")
source("scripts/load_seed_data.R")

df_team_abbr <- read_csv("data/NHL_team_names_abbr.csv")

df <- df_seeds %>% 
  left_join(df_team_abbr)

df

df_seeds

df <- df %>% 
  left_join(df_results)
df

df %>% 
  count(rank, wins) %>% 
  filter(!is.na(wins)) %>% 
  ggplot(aes(rank, wins, fill = n)) +
  geom_tile() +
  geom_smooth() +
  scale_fill_viridis() +
  #coord_cartesian(xlim = c(0, 21)) +
  scale_x_continuous(expand = c(0,0), breaks = 1:20) +
  scale_y_continuous(expand = c(0,0), breaks = c(0, 4, 8, 12, 16)) +
  coord_equal() +
  theme(panel.grid = element_blank())

df %>% 
  filter(!is.na(wins)) %>% 
  ggplot(aes(rank, wins)) +
  geom_jitter(height = .1, width = .1, alpha = .3) +
  geom_smooth() +
  scale_x_continuous(breaks = 1:20) +
  scale_y_continuous(breaks = c(0, 4, 8, 12, 16)) + 
  theme(panel.grid = element_blank())

df %>% 
  filter(season != "20122013") %>% 
  ggplot(aes(points, wins)) + 
  geom_point(alpha = .3) +
  geom_smooth() +
  scale_y_continuous(breaks = c(0, 4, 8, 12, 16)) +
  coord_cartesian(xlim = c(85, 130))
