---
title       : Tidy Data
description : Look into tidy data properties on data sets from fivethirtyeight.com in the fivethirtyeight package


--- type:NormalExercise lang:r xp:100 skills:1 key:fa48676309
## Joining data frames

Recall the `police_locals` data frame you worked with in **Applying R Basics**.  There has been much discussion about
the political divide that exists in the US.  A separate data frame has been loaded with the name `ideology` that lists cities, their state, and the political ideology of the state.  Created somewhat naively, a description of this `state_ideology` variable follows.

`state_ideology`:  For each city in the dataset, a lookup of how the state the city resides in and the results 2012 Presidential election were given.  If Clinton won the state in 2016, `"Liberal"` is the value for `state_ideology`.  If Trump won the state in 2012, `"Conservative"` is the value for `state_ideology`.



*** =instructions
- Use the `inner_join` function in the `dplyr` package to add the `state` and `state_ideology` columns to the `police_locals` 
where the key variable is `city` in both data frames.  
- Assign the name `police_join` to this expanded data frame.
- Think about why it might be of value to link these two data sets together to analyze the relationship between `state_ideology` and percentage of police officers residing in the cities they serve by race.


*** =hint
- Remember to use `?inner_join` to get help as to what to provide as arguments to the function.


*** =pre_exercise_code
```{r}
library(readr)
police_locals <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/police_locals.csv")
ideology <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/ideology.csv")
```

*** =sample_code
```{r}
library(dplyr)
# Join police_locals with ideology by city
# Provide police_join as the name
police_join <- inner_join(x =  ,
                          y =  ,
                          by = " ")
```

*** =solution
```{r}
library(dplyr)
# Join police_locals with ideology by city
# Provide police_join as the name
police_join <- inner_join(x = police_locals, y = ideology, by = "city")
```

*** =sct
```{r}
test_object("police_join")
test_error()
test_function("inner_join", args = "x")
test_function("inner_join", args = "y")
test_function("inner_join", args = "by")
```




--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:4399375881
## Is it tidy?

Recall that a *tidy* data frame must have three properties:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

Is the `police_join` data frame created in the last exercise tidy?

(Recall that you can just enter `police_join` in the R Console and it will by default print the first
few rows of the data frame for you.)

*** =instructions
- Yes, it is neat and easy-to-read.
- Yes, it follows all of the requirements of a tidy data set as given above.
- No, it does not meet all of the requirements of a tidy data set.
- None of the above are correct.


*** =hint
- You might want to use `names(police_join)` to get a listing of the different column names.
- Is each column of `police_join` a variable? Or is one variable spread across multiple columns?


*** =pre_exercise_code
```{r}
# You can also prepare your dataset in a specific way in the pre exercise code
# library(fivethirtyeight)
# data(police_locals)
library(tibble)
library(readr)
library(dplyr)
police_locals <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/police_locals.csv")
ideology <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/ideology.csv")
police_join <- inner_join(x = police_locals, y = ideology, by = "city")
```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki

msg_bad <- "That is not correct!"
msg_success <- "This is not tidy. The `race` variable is distributed across multiple columns and, thus, violates 'Each variable forms a column.'"
test_mc(correct = 3, feedback_msgs = c(msg_bad, msg_bad, msg_success, msg_bad))
```



--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:285e794c07
## Is this tidy?

Read over another 2014 article from FiveThirtyEight.com entitled "The Dollar-And-Cents Case Against Hollywood’s Exclusion of Women" [here](https://fivethirtyeight.com/features/the-dollar-and-cents-case-against-hollywoods-exclusion-of-women/). We'll be working with a data frame used in this story called `bechdel` in the `fivethirtyeight` package throughout this DataCamp course.

Is the `bechdel` data frame tidy?  

*** =instructions
- Yes, it is neat and easy-to-read.
- Yes, it follows all of the requirements of a tidy data set as given above.
- No, it does not meet all of the requirements of a tidy data set.
- None of the above are correct.

*** =hint
- You can find help on `bechdel` on page 6 [here](https://cran.r-project.org/web/packages/fivethirtyeight/fivethirtyeight.pdf) or by using `?bechdel`.

*** =pre_exercise_code
```{r}
# library(fivethirtyeight)
# data(bechdel)
bechdel <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/bechdel.csv"
```

*** =sct
```{r}
msg_bad <- "That is not correct!"
msg_success <- "This is tidy. Each of the three conditions for a tidy data set are met."
test_mc(correct = 2, feedback_msgs = c(msg_bad, msg_success, msg_bad, msg_bad))
```


--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:262a102cfb
## What's the observational unit?

What is the observational unit in the `bechdel` data frame?

*** =instructions
- Budget of the movie
- Movie
- Whether or not a movie passes the Bechdel Test
- None of the above

*** =hint

*** =pre_exercise_code
```{r}
# library(fivethirtyeight)
# data(bechdel)
bechdel <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/bechdel.csv"
```

*** =sct
```{r}
msg_bad <- "That is not correct!"
msg_success <- "Each row corresponds to a different movie and the columns are measurements/characteristics of that movie."
test_mc(correct = 2, feedback_msgs = c(msg_bad, msg_success, msg_bad, msg_bad))
```
