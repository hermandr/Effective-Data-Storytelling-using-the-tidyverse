---
title       : Barplots
description : Generate and examine barplots displaying one categorical variable or relationships between multiple categorical variables via the ggplot2 package using datasets in and derived from the fivethirtyeight R package
attachments:
  slides_link: https://ismayc.github.io/moderndiver-book/4-viz.html
  
--- type:NormalExercise lang:r xp:100 skills:1
## Distribution of one categorical variable

When working with a qualitative variable (one in which the data falls into many different categories), the first plot you likely will make is a barplot.  This will show how many of each category there are for that particular categorical variable.

Recall the `bechdel` data frame that was introduced earlier in the course from the `fivethirtyeight` R package.  Suppose we are interested in analyzing the distribution of the `clean_test` variable.  

Observe **The Bechdel Test Over Time** image in the article ["The Dollar-And-Cents Case Against Hollywood’s Exclusion of Women"](https://fivethirtyeight.com/features/the-dollar-and-cents-case-against-hollywoods-exclusion-of-women/).  You can use this to get a better idea as to what the categories of `clean_test` represent.

To assist with the plotting, the `clean_test` variable has been converted to a `factor` with `levels` set corresponding to the order given in the plot in the article.

*** =instructions
- Produce an appropriate plot looking at the distribution of `clean_test` in the `bechdel` data frame.
- THINK ABOUT IT:  What does this plot tell us in terms of movies passing the Bechdel test or not since 1970?

*** =hint
- Remember that we use the `aes` function to map aesthetics.  Also be sure there are two `))` before the `+`:  one for the `ggplot` call and one for the `aes` call.

*** =pre_exercise_code
```{r}
library(fivethirtyeight)
data(bechdel)
```

*** =sample_code
```{r}
library(fivethirtyeight)

# Convert to factor
bechdel$clean_test <- factor(bechdel$clean_test,
    levels = c("nowomen", "notalk", "men", "dubious", "ok"))

# Produce an appropriate plot by filling in the entries correctly
library(ggplot2)
ggplot(data = ,
       mapping = aes(   ) +
  geom_   ()
```

*** =solution
```{r}
# Find what types of variables `all` and `index` are.

# Produce an appropriate plot by filling in the entries correctly below
library(ggplot2)
ggplot(data = bechdel,
       mapping = aes(x = clean_test)) +
  geom_bar()
```

*** =sct
```{r}
test_library_function("ggplot2")
test_ggplot(check_data = TRUE, check_aes = TRUE, check_geom = TRUE)

test_error()
```
