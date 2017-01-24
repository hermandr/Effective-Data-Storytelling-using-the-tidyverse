---
title       : Scatterplots via ggplot2
description : In this chapter we will create and analyze different plots using datasets in and derived from the fivethirtyeight R package


--- type:NormalExercise lang:r xp:100 skills:1 key:bl30sh3qn6
## Looking at relationships in `police_join_cost` - `all` versus `index`

Suppose we are interested in analyzing the relationship between `all` and `index` in the
`police_join_cost`.

*** =instructions
- What types of variables are `all` and `index`?  Use the `glimpse` function in the `tibble` package to find out.
- Plot `index` on the horizontal axis and `all` on the vertical axis in an appropriate plot.
*** =hint

*** =pre_exercise_code
```{r}
library(fivethirtyeight)
data(police_locals)
library(readr)
library(dplyr)
ideology <- read_csv("http://ismayc.github.io/Effective-Data-Storytelling-using-the-tidyverse/datasets/ideology.csv")
police_join <- inner_join(x = police_locals, y = ideology, by = "city")
cost_of_living <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_3085/datasets/cost_of_living.csv")
police_join_cost <- inner_join(x = police_join, y = cost_of_living, by = "state")
```

*** =sample_code
```{r}
# Find what types of variables `all` and `index` are.

# Produce an appropriate plot by filling in the entries correctly
ggplot(data = ,
       aes(x = ,
           y = )) +
  geom_   ()
```

*** =solution
```{r}
# Find what types of variables `all` and `index` are.
library(tibble)
glance(police_join_cost)
# Produce an appropriate plot by filling in the entries correctly
ggplot(data = police_join_cost,
       aes(x = index,
           y = all)) +
  geom_point()
```

*** =sct
```{r}
test_library_function("tibble")

test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE)

test_error()
```
