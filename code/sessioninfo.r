sessionInfo()

foo = "bar"

library(readr)
read_csv2("beispiele/Bestellungen_2.csv", locale = locale(decimal_mark = "."))
library(jsonlite)
read_file("beispiele/daten.json") |> fromJSON()
read_json("beispiele/daten.json", simplifyVector = T)


scan("beispiele/daten.json", what = character(), sep= "\n")
readLines(con = file("beispiele/daten.json"), warn = F)
read_lines("beispiele/daten.json")

library(Matrix)
Diagonal(4, 3:2)

sum(c(2,3, NA))

c(FALSE, 1, 2, TRUE, FALSE)
c(TRUE, "Hallo", 1)

list(1 , TRUE, "Daten und Information", 2, 3) -> foo

list(1,2,3) -> foo

foo

c(1,2,3) -> foo
c(3,4,5) -> bar
c(foo, bar)
list(
    matrix(c(foo, bar), ncol = 2), 
    matrix(c(bar,foo), ncol = 2)
)

is.vector(1)

is.vector(matrix(c(bar,foo), ncol = 2))

list(list(1,2,3), list(4,5,6))

foo
bar
foo %o% bar

install.packages("renv")
renv::init()
mtcars |> dplyr::filter(hp > 200)


function (parameter) {
    stopifnot(is.numeric(parameter))
    parameter ^ 2 - 1
}
foo("bar")


'%foo%' = function (a, b) {
    stringr::str_detect(a, b)
}

"hello1world" %foo% "o\\dw"
?setGeneric

foo()
foo = function () 3
foo()
foo

??apply
`??`
?filter dplyr
?filter

iris |>
    filter(Species == "setosa") |>
    arrange(desc(Petal.Length)) -> 
        sortierteSetosaWerte
