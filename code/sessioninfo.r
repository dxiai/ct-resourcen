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
