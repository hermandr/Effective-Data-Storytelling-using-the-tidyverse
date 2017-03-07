library(fivethirtyeight)
library(dplyr)
library(ggplot2)

# filter
US_births_weekdays_2013 <- US_births_2000_2014 %>% 
  filter(year == 2013) %>% 
  filter(!(day_of_week %in% c("Sat", "Sun")))

# Make plot based on filter
## Make an appropriate plot to analyze the trend in births across 2013
ggplot(data = US_births_weekdays_2013, mapping = aes(x = date, y = births)) +
  geom_line(aes(color = day_of_week))


# summarize without group_by
## Calculate the mean and the median births by day_of_week
US_births_weekdays_2013 %>% 
  summarize(mean_births = mean(births),
    median_births = median(births))

# group_by / summarize
US_births_weekdays_2013 %>% group_by(day_of_week) %>% 
  summarize(mean_births = mean(births),
    median_births = median(births))

# Same thing for all years and all days
avg_by_day <- US_births_2000_2014 %>% group_by(day_of_week) %>% 
  summarize(mean_births = mean(births),
    median_births = median(births))
## Think about it How do they compare?

# Make plot after summarizing
# Use `geom_col`
ggplot(data = avg_by_day, mapping = aes(x = day_of_week, y = median_births)) +
  geom_col()

# Calculate proportion using mean(var == )

# mutate

# Make plot after mutate