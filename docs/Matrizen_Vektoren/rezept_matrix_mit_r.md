# Matrizen mit R erzeugen

## Problem

Es soll eine Matrix mit beliebigen Werten erzeugt werden. 

## Lösung

Die Matrix-Funktion mit einem Vektor verwenden. 

```
c(1,4,2,0,13,5) |> matrix(3)        # erzeugt eine 3 x 2 Matrix 
c(1,4,2,0,13,5) |> matrix(nrow = 3) # erzeugt die gleiche 3 x 2 Matrix 

c(1,4,2,0,13,5) |> matrix(ncol = 3) # erzeugt eine 2 x 3 Matrix 
```

Oder die gleiche Logik mit der Funktionsverkettung von `tidyverse`

```
library(tidyverse)

c(1,4,2,0,13,5) %>% matrix(3) # erzeugt eine 3 x 2 Matrix 
c(1,4,2,0,13,5) %>% matrix(nrow = 3) # erzeugt die gleiche 3 x 2 Matrix 

c(1,4,2,0,13,5) %>% matrix(ncol = 3) # erzeugt eine 2 x 3 Matrix 
```

## Erklärung

Die `matrix()`-Funktion erzeugt eine Matrix aus einem Vektor. Die Funktion erwartet zwei Parameter: Den Vektor sowie eine Zeilenanzahl (via `nrow`) oder eine Spaltenanzahl (`ncol`). Falls für den zweiten Parameter nur eine  Zahl eingegeben wird, wird diese als Zeilenanzahl behandelt. 

Für den eingegebenen Vektor muss gelten, dass dessen Vektorlänge genau durch die angegebene Anzahl von Zeilen oder Spalten teilen lässt. 

Um eine Matrix sauber einzugeben, bietet es sich an, dass der Vektor wie eine Matrix eingegeben wird. Dabei nutzen wir aus, dass Zeilenumbrüche und Leerzeichen für R keine Bedeutung haben. 

```
c(
    1,  4, 2
    0, 13, 5
) %>% 
    matrix(ncol = 3)
```

Mit dieser Schreibweise ist sichergestellt, dass die Anforderungen an die gewünschte Matrix erfüllt sind. 

Theoretisch könnten wir die Parameter `ncol` und `nrow` gemeinsam angeben. Es reicht aber einer der beiden Parameter, weil R den zweiten Parameter aus dem ersten automatisch ableitet. Der zusätzliche Parameter ist in diesem Fall *redundant*. 