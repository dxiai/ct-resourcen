### Komplexe Datentypen als Werte

In R gibt es neben den atomaren Datentypen die fundamentalen 1-dimensionalen Datentypen *Vektor* und *Liste*. 

Der zentrale Unterschied zwischen Vektoren und Listen ist, dass Vektoren nur den gleichen Datentyp enthalten dürfen und Listen beliebige Datentypen enthalten dürfen. 

Vektoren dürfen wiederum aus Vektoren und Listen gebildet werden. Sollen Vektoren in einen anderen Vektore eingebettet, dann kann der Vektor mit den eingebetteten Vektoren nicht direkt erzeugt werden. Der folgende Code ist erzeugt einen Vektor, der aus drei eingebetteten Vektoren besteht.

```R
beispielVektor1 = c()
beispielVektor1[[1]] = c(3,4) # Erzeugt einen Zahlenvektor
beispielVektor1[[2]] = c(2,1) # Erzeugt einen Zahlenvektor
beispielVektor1[[3]] = c(5,6,"7xx") # Erzeugt einen Zeichenkettenvektor
beispielVektor1
```

```
[[1]]
[1] 3 4

[[2]]
[1] 2 1

[[3]]
[1] "5"   "6"   "7xx"
```

Versuchen wir hingegen diesen Vektor direkt zu erzeugen, dann erhalten wir einen Zeichenkettenvektor:

```R
beispielVektor2 = c(
    c(3,4), # Erzeugt einen Zahlenvektor
    c(2,1), # Erzeugt einen Zahlenvektor
    c(5,6,"7xx") # Erzeugt einen Zeichenkettenvektor
)
beispielVektor2
```

```
"3",   "4",   "2",   "1",   "5",   "6",   "7xx"
```

Es ist auch nicht möglich einzelne Werte mit atomaren Datentypen in einem Vektor durch Vektoren zu ersetzen, selbst wenn die Vektoren vom gleichen Datentyp sind.

```R
beispielVektor3 = c(1,2)
beispielVektor3[[1]] = c(3,4)
```

<p class="alert alert-danger">
Fehler in beispielVektor3[[1]] = c(3, 4) : mehr Elemente gegeben als zu ersetzen sind
</p>

Ein weiteres Problem bei der Erstellung von Vektoren ergibt sich, bei komplexen Datentype. Der folgende Code erzeugt eine Liste mit vier Variablen, anstatt einen Vektor mit zwei Stichprobenobjekte, die je zwei Variablen enthalten.

```R
beispielVektor4 = c(
    tibble(a =  c(1,2,3), b = c( 4,3,2)), 
    tibble(c = c(2,3,1,4), d = c("a", "b", "c", "d"))
) 
```

Um das richtige Ergebnis zu erhalten, *muss* eine Liste verwendet werden. 


```R
beispielVektor5 = list(
    tibble(a =  c(1,2,3), b = c( 4,3,2)), 
    tibble(c = c(2,3,1,4), d = c("a", "b", "c", "d"))
) 
```

Nun liegt ein Vektor mit zwei Stichprobenobjekten vor. 

<p class="alert alert-warning" markdown="1">
Viele statistische Funktionen erzeugen sog. Ergebnisobjekte. Diese Objekte sind oft das Ergebnis einer Aggregation und müssen in einer Liste gespeichert werden, wenn mehrere dieser Objekte erzeugt werden.
</p>
