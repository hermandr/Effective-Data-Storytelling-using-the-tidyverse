---
title       : Tidy Data
description : Look into tidy data properties on a data set based on the fivethirtyeight.com "Most Police Don’t Live In The Cities They Serve" article you worked with in **Applying R Basics**.


--- type:NormalExercise lang:r xp:100 skills:1 key:fa48676309
## Joining data frames

Recall the `police_locals` data frame you worked with in **Applying R Basics**.  There has been much discussion about
the political divide that exists in the US.  A separate data frame has been loaded with the name `ideology` that lists cities, their state, and the political ideology of the state.  Created somewhat naively, a description of this `state_ideology` variable follows.

`state_ideology`:  For each city in the dataset, a lookup of how the state the city resides in and the results 2012 Presidential election were given.  If Clinton won the state in 2016, `"Liberal"` is the value for `state_ideology`.  If Trump won the state in 2012, `"Conservative"` is the value for `state_ideology`.



*** =instructions
- Use the `inner_join` function in the `dplyr` package to add the `state` and `state_ideology` columns to the `police_locals` 
where the key variable is `city` in both data frames.  
- Assign the name `police_join` to this expanded data frame.


*** =hint
- Remember to use `?inner_join` to get help as to what to provide as arguments to the function.


*** =pre_exercise_code
```{r}
library(readr)
ideology <- read_csv("datasets/ideology.csv")
```

*** =sample_code
```{r}
library(dplyr)
# Join police_locals with ideology by city
# Provide police_join as the name

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

Is the `police_locals` data frame tidy?

(Recall that you can just enter `police_locals` in the R Console and it will by default print the first
few rows of the data frame for you.)

*** =instructions
- Yes, it is neat and easy-to-read.
- Yes, it follows all of the requirements of a tidy data set as given above.
- No, it does not meet all of the requirements of a tidy data set.
- None of the above are correct.


*** =hint
- Is each column of `police_locals` a variable? Or is one variable spread across multiple columns?


*** =pre_exercise_code
```{r}
# You can also prepare your dataset in a specific way in the pre exercise code
# library(fivethirtyeight)
# data(police_locals)
library(tibble)
library(readr)
police_locals <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/police_locals.csv")
```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki

msg_bad <- "That is not correct!"
msg_success <- "Exactly! The `race` variable is distributed across multiple columns and, thus, violates 'Each variable forms a column.'"
test_mc(correct = 3, feedback_msgs = c(msg_bad, msg_bad, msg_success, msg_bad))
```

