# example script to process data
# this script loads the data and filter out only the years 2009-2014 and 
# save the output data. This mimics a data processing step

library(tidyverse)

# load the data using here to get file path
brewing_materials <- readr::read_csv(here::here("data", "brewing_materials.csv"))

# filter out years 2012-2016 and save the csv
brewing_materials %>%
  filter(between(year, 2009, 2014)) %>%
  write_csv(file = here::here("results", "brewing_materials_2009-2014.csv"))

