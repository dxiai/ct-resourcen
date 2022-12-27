# Lambda-Kalkül

Der Lambda-Kalkül beschreibt alle Operationen als eine Verkettung von Funktionen. 

Es werden zwei Arten des Lambda-Kalküls unterschieden: 

1. Lambda-Kalkül der theoretischen Informatik, das alle Operationen aus ein-Parametrischen Funktionen herleitet. Dieser Kalkül ist vor allem für die Kombinatorik und Berechenbarkeitstheorie von Bedeutung.
2. Lambda-Kalkül als funktionales Programmierkonzept. Dieser Kalkül verwendet Funktionen als eigenen Datentyp, der wie alle anderen Datentype an geeignete Funktionen übergeben werden kann.

Beide Arten sind konzeptionell eng miteinander verbunden. Für die Praktische Arbeit hat nur die zweite Variante eine Bedeutung.

Der Lambda-Kalkül erfordert, dass alle Funktionen nur die Parameter verarbeiten aber nicht verändern. Eine Operation über einen Vektor oder eine andere Datenstruktur liefert deshalb immer eine neue Datenstruktur als Ergebnis zurück und lässt die als Parameter angegebene Datenstruktur unverändert. Diese Eigenschaft von Funktionen wird als *frei von Nebeneffekten* bezeichnet. 

Im Zentrum des Lambda-Kalküls stehen drei Arten der Funktionsverknüpfung: 

- Composting
- Callbacks
- Closures

## Composting

Als **Composting** (deutsch: Schichtung) wird die Verkettung von Funktionen bezeichnet. Diese Schichtung legt die Reihenfolge der Funktionsausführung fest. Dabei werden zwei Varianten zum Schreiben der Funktionen unterschieden. 

1. Das Forward-Composting oder chaining, bei dem die Funktionen in der Reihenfolge ihrer Ausführung geschrieben werden. Wir haben das Forward Composting bei der Funktionsverkettung bereits kennengelernt.  
2. Das Backward-Composting, bei dem die Funktion entsprechend ihrer Schachtelung von aussen nach innen notiert werden. Das Backward-Composting entspricht den verschachtelten Funktionsaufrufen.

<p class="alert alert-warning" markdown="1">
**Achtung:** In der Literatur und im Internet wird oft *Composting* synonym mit *Backward Composting* verwendet. Den Begriff *Forward Composting* findet man sehr selten. Stattdessen werden die Begriffe *Chaining* oder *Piping* verwendet. 
</p>

## Callbacks

<p class="alert alert-primary" markdown="1">
Callbacks sind Funktionen, die als Parameter an eine andere Funktion übergeben werden und von der anderen Funktion ausgeführt werden.
</p>

Wir haben das äussere Produkt im Zusammenhang mit logischen Ausdrücken kennengelernt. Die R-Funktion `outer()` akzeptiert als dritten Parameter eine beliebige Operatorfunktion, die mit den ersten beiden Parametern ausgeführt wird. 

**Beispiel**

```R
paarOperation = function(a, b, op)
   op(a, b)

paarOperation(1:8, 8:1, `<`) 
   # ergibt TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE

paarOperation(1:8,8:1, `+`)
   # ergibt 9 9 9 9 9 9 9 9 
```

Wir können einer Funktion, die eine Callback-Funktion akzeptiert, auch eine anonyme Funktion übergeben. 

```R
paarOperation(1:8, 8:1, function (a, b) { 3 * a + 4 * b }) 
    # ergibt  35 34 33 32 31 30 29 28 
```

<p class="alert alert-warning" markdown="1">
In Excel sind keine direkten Callbacks möglich. 
</p>

## Closures

<p class="alert alert-primary" markdown="1">
Closures sind Funktionen, die von einer Funktion erstellt werden und auf deren Parameter zugreifen können.
</p>

Closures können dazu verwendet werden, Funktionen mit mehreren Parametern in Funktionen mit jeweils einen Parameter umzuformen. Diese Technik wird als *Currying* (Nach dem Mathematiker Haskell Curry) bezeichnet.

**Beispiel**

```R
multiplizierer = function(faktor1) 
    function(faktor2)
       faktor1 * faktor2

verdoppeln = multiplizierer(2)
verdreifachen = multiplizierer(3)

verdoppeln(1) # ergibt 2
verdoppeln(2) # ergibt 4
verdreifachen(3) # ergibt 9
```

In Excel können wir diese Technik ebenfalls anwenden. Die folgende Operation nutzt Currying und kommt auf das Ergebnis 6.

```
= LAMBDA(a; LAMBDA(b; a + b))(4)(2)
```

<p class="alert alert-warning" markdown="1">
Currying kann in Excel nicht zur dynamischen Programmierung verwendet werden. 
</p>
