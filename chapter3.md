---
title       : Scatter-plots and Line-graphs via ggplot2
description : In this chapter we will create and analyze different plots using datasets in and derived from the fivethirtyeight R package


--- type:NormalExercise lang:r xp:100 skills:1 key:bl30sh3qn6
## Relationship between quantitative variables

Suppose we are interested in analyzing the relationship between `all` and `index` in the
`police_join_cost` data frame.

*** =instructions
- What types of variables are `all` and `index`?  Use the `glimpse` function in the `tibble` package to find out.
- Plot `index` on the horizontal axis and `all` on the vertical axis in an appropriate plot.
- THINK ABOUT IT:  After looking over the plot, is it the type of relationship you expected (negative, positive, not much at all, etc.)?

*** =hint
- The horizontal axis is the `x` axis and the vertical axis is the `y` axis.
- Remember that we use the `aes` function to map aesthetics.  Also be sure there are two `))` before the `+`:  one for the `ggplot` call and one for the `aes` call.

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
library(ggplot2)
ggplot(data = ,
       mapping = aes(x = ,
           y = )) +
  geom_   ()
```

*** =solution
```{r}
# Find what types of variables `all` and `index` are.
library(tibble)
glimpse(police_join_cost)
# Produce an appropriate plot by filling in the entries correctly below
library(ggplot2)
ggplot(data = police_join_cost,
       mapping = aes(x = index,
           y = all)) +
  geom_point()
```

*** =sct
```{r}
test_library_function("tibble")
test_library_function("ggplot2")
test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE)

test_error()
```


--- type:NormalExercise lang:r xp:100 skills:1 key:ujio5pauwu
## Adding another variable

Let's further look into the relationship between `all` and `index` in
`police_join_cost`.  We also added the `state_ideology` variable with values of `"Conservative"` and `"Liberal"` using `inner_join` in a previous exercise.  Let's color
the points in the plot based on whether or not the city selected

*** =instructions
- Plot `index` on the horizontal axis and `all` on the vertical axis in an appropriate plot.
- Add `color` to the points based on values of `state_ideology`.
- Remember to add a call to `library` to include the specific package needed for graphics.
- THINK ABOUT IT:  What stands out to you as you look over this plot?  How does adding the
`state_ideology` help you better understand the relationships between the variables?

*** =hint
- The horizontal axis is the `x` axis and the vertical axis is the `y` axis.
- Remember that we also need to map aesthetics to the data using `aes`.  This is true for `x` and `y` and also for `color`.
- By default, `na.rm` is set to `FALSE` by default with `geom_point`.  You can specify it if you wish as `geom_point(na.rm = FALSE)` but you don't have to.

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
# Produce an appropriate plot looking at the relationship between
# `index` and `all` colored based on the values of `state_ideology`
# filling in the entries correctly below

ggplot(data = ,
       mapping = aes(x = ,
           y = )) +
  geom_point(aes(color = ))
```

*** =solution
```{r}
# Produce an appropriate plot by filling in the entries correctly
library(ggplot2)
ggplot(data = police_join_cost,
       mapping = aes(x = index,
           y = all)) +
  geom_point(aes(color = state_ideology))
```

*** =sct
```{r}
test_library_function("ggplot2")
test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE, check_geom_params = TRUE)

test_error()
```

--- type:NormalExercise lang:r xp:100 skills:1 key:mhza74qwhy
## Babies born over time (line-graph)

We now shift our analysis to looking at babies born in the US in 2014 by day.  This data is stored
in the `US_births_2000_2014` data frame in the `fivethirtyeight` package.  In order to isolate only
on the 2014 births we also introduce a new function called `filter` and the `%>%` (pipe) operator that you'll explore more later in the course.  You can view the resulting `US_births_2014` data frame interactively [here](https://ismayc.github.io/Effective-Data-Storytelling-using-the-tidyverse/US_births_2014.html)

*** =instructions
- Plot `births` on the vertical axis and `date` on the horizontal axis using a line for the geometry.
- THINK ABOUT IT:  This isn't a very pretty plot to look at. Why is there so much "up-and-down" in the plot?  What makes this plot hard to look at?

*** =hint
- The horizontal axis is the `x` axis and the vertical axis is the `y` axis.
- Remember that we also need to map aesthetics to the data using the `aes` function.

*** =pre_exercise_code
```{r}
library(fivethirtyeight)
data(US_births_2000_2014)
```

*** =sample_code
```{r}
library(dplyr)
library()
US_births_2014 <- US_births_2000_2014 %>% filter(year == 2014)

```

*** =solution
```{r}
# Produce an appropriate plot by filling in the entries correctly
library(dplyr)
library(ggplot2)
US_births_2014 <- US_births_2000_2014 %>% filter(year == 2014)
ggplot(data = US_births_2014,
       mapping = aes(x = date,
           y = births)) +
  geom_line()
```

*** =sct
```{r}
test_library_function("ggplot2")
test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE)

test_error()
```

--- type:NormalExercise lang:r xp:100 skills:1 key:v9lwv5gk0y
## Babies born over time (scatter-plot)

Recall that the line-graph in the last exercise had some strange features to it.  Let's explore what the points themselves look like and then color the points based on another variable in the second plot.  The `US_births_2014` data frame has been loaded for you already.

*** =instructions
- Plot `births` on the vertical axis and `date` on the horizontal axis using a point for the geometry.
- THINK ABOUT IT:  Now that you've produced this scatter-plot, why were the lines going up and down across the plot?
- Plot `births` on the vertical axis and `date` on the horizontal axis as a scatter-plot.  Then color the points based on `day_of_week`.
- THINK ABOUT IT:  How does this coloring help to understand the distribution of births across the year?  Can you identify the points that don't follow the patterns and what days they correspond to?

*** =hint
- The horizontal axis is the `x` axis and the vertical axis is the `y` axis.
- Remember that we also need to map aesthetics to the data using the `aes` function.

*** =pre_exercise_code
```{r}
library(dplyr)
US_births_2014 <- US_births_2000_2014 %>% filter(year == 2014)
```

*** =sample_code
```{r}


```

*** =solution
```{r}
# Produce an appropriate plot by filling in the entries correctly
library(ggplot2)
ggplot(data = US_births_2014,
       mapping = aes(x = date,
           y = births)) +
  geom_point()
ggplot(data = US_births_2014,
       mapping = aes(x = date,
           y = births)) +
  geom_point(aes(color = day_of_week))  
```

*** =sct
```{r}
test_library_function("ggplot2")
test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE)

test_error()
```
