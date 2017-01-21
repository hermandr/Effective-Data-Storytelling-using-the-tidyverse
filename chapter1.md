---
title       : Applying R basics
description : Exploring the basics of R on a fivethirtyeight data set


--- type:NormalExercise lang:r xp:100 skills:1 key:c306f947db
## Most Police Don’t Live In The Cities They Serve

Read over the 2014 article from FiveThirtyEight.com entitled "Most Police Don’t Live In The Cities They Serve" [here](http://fivethirtyeight.com/datalab/most-police-dont-live-in-the-cities-they-serve/).  This article serves as an example of what I'd like you to be able to create by the end of the semester for your final project.  Police and their relationships with citizens has been a controversial topic for many years and has come to the forefront of American culture since the events of Ferguson, Missouri mentioned in this article.

The dataset corresponding to this article from the `fivethirtyeight` package has been loaded as a data frame called, `police_locals`, and is available in the workspace.

*** =instructions
- Check out the properties of `police_locals` using the `glimpse` function in the `tibble` package.
- After running the code, think about why the variables in `police_locals` are the specific `class` they are coded as here (`char`, `int`, `double`).

*** =hint
- Use `glimpse()`.  Note that what goes inside the `()` is the name of the data frame you'd like to examine the properties of.
- Note that you should NOT put the name of the data frame in quotation marks.  Use `?tibble::glimpse` for more information.

*** =pre_exercise_code
```{r}
# You can also prepare your dataset in a specific way in the pre exercise code
# library(fivethirtyeight)
# data(police_locals)
library(tibble)
library(readr)
police_locals <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/police_locals.csv")
```

*** =sample_code
```{r}
# library(fivethirtyeight)
# data(police_locals)
library(tibble)
# police_locals is available in your workspace
# Check out the properties of police_locals
```

*** =solution
```{r}
library(tibble)
# police_locals is available in your workspace
# Check out the properties of police_locals
glimpse(police_locals)
```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki

test_function("glimpse", args = "x",
              not_called_msg = "You didn't call `glimpse()`!",
              incorrect_msg = "You didn't call `glimpse(object = ...)` with the correct argument, `x`.")

#test_object("police")

#test_function("plot", args = "x")
#test_function("plot", args = "y")
#test_function("plot", args = "col")

#test_error()

success_msg("Good work!")
```

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:792856c06f
## Identify observational unit

What is the observational unit in this `police_locals` data frame?  You can run the `head(police_locals)` code to check out
the first five rows of the data frame.

*** =instructions
- Percentage of officers
- City
- Police force
- Race

*** =hint
What is being measured along each row?  Remember that variables (unless they are identification variables) cannot be the same
as the *observational unit*.

*** =pre_exercise_code
```{r}
# You can also prepare your dataset in a specific way in the pre exercise code
# library(fivethirtyeight)
# data(police_locals)
library(tibble)
library(readr)
police_locals <- read_csv("https://raw.githubusercontent.com/ismayc/Effective-Data-Storytelling-using-the-tidyverse/master/datasets/police_locals.csv")
```

*** =sample_code
```{r}
head(police_locals)
```


*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki

msg_bad <- "That is not correct!"
msg_success <- "Exactly! The observational unit here is city.  Percentage of officers, police force, and race are all variables/characteristics about the city."
test_mc(correct = 2, feedback_msgs = c(msg_bad, msg_success, msg_bad, msg_bad))
```

