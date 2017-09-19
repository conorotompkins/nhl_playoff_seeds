library(stringr)
library(tidyverse)

data_path <- "./data/playoff_results"

data_list <- list.files(path = data_path)

seasons <- paste(data_list)

data_list <- paste0(data_path, "/", data_list)

data_list <- lapply(data_list, read_csv)


names(data_list) <- seasons

names(data_list)

df_playoff_results <- bind_rows(data_list, .id = "season")
