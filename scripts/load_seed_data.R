library(stringr)

data_path <- "./data/playoff_seeding"

data_list <- list.files(path = data_path)

seasons <- paste(data_list)

data_list <- paste0(data_path, "/", data_list)

data_list <- lapply(data_list, read_csv)


names(data_list) <- seasons

names(data_list)

for (i in seq_along(data_list)) {
  data_list[[i]] <- data_list[[i]][3:33, c(1, 2, 8)]
}

df_seeds <- bind_rows(data_list, .id = "season") %>% 
  rename(rank = X1,
         team = X2,
         points = X8) %>% 
  filter(team != "League Average") %>% 
  mutate(team = str_replace(team, "\\*", ""))

rm(list = c("data_list", "data_path"))

