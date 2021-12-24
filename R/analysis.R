# This script simulates a simple analysis step. 
# This script will generate a figure and fit a model

library(tidyverse)
library(lubridate) ## for dates
library(forecast)
library(kableExtra)

# load the pre-processed data for brewing materials from 2009-2014
brewing_materials <- read_csv(file = here::here("results", "brewing_materials_2009-2014.csv"))

# generate a summary table of the annual totals of the data

brewing_materials %>%
  filter(material_type %in% c("Total Grain products", "Total Non-Grain products")) %>%
  group_by(year, material_type) %>%
  summarize(total_amount = sum(month_current)) %>%  # generate the table
  pivot_wider(names_from = material_type, values_from = total_amount) %>% # make the table wide
  kable(format = "latex") %>% # generate a latex table
  writeLines(here::here("results", "total_amounts.tex")) # write the table to latex for inclusion in manuscript
  







# generate a figure of total amount of material over time

p1 <- brewing_materials %>%
  mutate(date = make_date(year, month)) %>% # convert to a date format for plotting
  filter(material_type %in% c("Total Grain products", "Total Non-Grain products")) %>%
  ggplot() +
  geom_line(aes(x = date, y = month_current, color = material_type)) +
  scale_color_viridis_d(end = 0.6) +
  theme_bw()
  
p1

# save the figure to the figures folder
ggsave(filename = here::here("figures", "producs-vs-time.png"),
       plot = p1, width = 16, height = 9, units = "in")

# generate a table from an ARIMA model fit to Total Grain products
dat <- brewing_materials %>%
  mutate(date = make_date(year, month)) %>% # convert to a date format for plotting
  filter(material_type == "Total Grain products") %>%
  select(month_current, date)

y <- ts(dat$month_current, deltat = 1/12, start = 2009)
#-- remove the last year to generate a forecast for 2014
y_fit <- window(y, end = 2013.99)

mod <- auto.arima(y_fit)


# generate the forecast from the model
preds <- forecast(y_fit, h = 12)

# convert the forecast data
dat_pred <- data.frame(y_pred = preds$mean,
                       lower_80 = preds$lower[, 1],
                       lower_95 = preds$lower[, 2],
                       upper_80 = preds$upper[, 1],
                       upper_95 = preds$upper[, 2],
                       date = as_date(date_decimal(c(time(preds$mean)))))


p2 <- p1 +
  geom_line(data = dat_pred, aes(x = date, y = y_pred), col = "red") +
  geom_ribbon(data = dat_pred, aes(x = date, ymin = lower_80, ymax = upper_80), 
              fill = "red", alpha = 0.6) +
  geom_ribbon(data = dat_pred, aes(x = date, ymin = lower_95, ymax = upper_95), 
              fill = "red", alpha = 0.4)
  
p2

# save the figure to the figures folder
ggsave(filename = here::here("figures", "forecasted-products-vs-time.png"),
       plot = p2, width = 16, height = 9, units = "in")




