rm(list = ls())

data_path <- "./data/results"

data_list <- list.files(path = data_path)

seasons <- paste(data_list)

data_list <- paste0(data_path, "/", data_list)

data_list <- lapply(data_list, read_csv)


names(data_list) <- seasons

names(data_list)

for (i in seq_along(data_list)) {
  x <- nrow(data_list[[i]])
  data_list[[i]] <- data_list[[i]][2:x,]
}

df_results <- bind_rows(data_list, .id = "season") %>% 
  rename(date = Date,
         away = Visitor,
         g_away = G,
         home = Home,
         g_home = G_1) %>% 
  select(season, date, away, g_away, home, g_home) %>% 
  mutate(result = ifelse(g_home > g_away, "home", "away"))

df_results <- df_results %>% 
  gather(type, team, -c(season, date, g_home, g_away, result)) %>% 
  select(-c(g_home, g_away)) %>% 
  mutate(win = ifelse(result == type, 1, 0))

df_results <- df_results %>% 
  group_by(season, team) %>% 
  summarize(wins = sum(win)) %>% 
  arrange(season, desc(wins))
