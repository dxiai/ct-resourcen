library(pak)
install.packages(
        "pak",
        repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",
        .Platform$pkgType,
        R.Version()$os,
        R.Version()$arch),
        clean = TRUE
    )

pak::pkg_install("tidyverse")

library(tidyverse)

mtcars %>% head()


mtcars %>% 
    ggplot(aes(x = mpg, y = drat)) + geom_point()


pak::pkg_install("quarto")
