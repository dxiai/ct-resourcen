library(tidyverse)


mtcars |> ggplot(aes(mpg, qsec, color = cyl |> factor() , size = hp)) +
    geom_point()

View(mtcars)
