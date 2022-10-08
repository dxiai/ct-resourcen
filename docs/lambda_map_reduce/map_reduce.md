# Das Map-Reduce-Prinzip

Map-Reduce beschreibt eine Klasse von Algorithmen über Vektoren. Alle Map-Reduce-Algorithmen bestehen im Kern aus zwei Arbeitsschritten: Dem **Abbildungs**schritt (Abbildung von engl. *to map*) und dem **Reduktions**schritt (engl. *to reduce*). Diese Algorithmen kombinieren also immer eine **Konvertierung** mit einer **Aggregation**. Die beiden Arbeitsschritte erfolgen in der Regel nacheinander. Bei konsequenter Umsetzung lassen sich komplexere Algorithmen durch Folgen aus abwechselnden Abbildungen und Reduktionen aufbauen.

Die Map-Reduce-Strategie erlaubt es, viele Lösungsstrategien für Vektoroperationen in einem Grundmuster zu vereinen. Die Idee hinter Map-Reduce besteht aus zwei Grundgedanken. 

1. Die Operationen für jeden einzelnen Wert werden logisch von den Operationen getrennt, die die Werte zusammenfassen. Dadurch können beide Schritte unabhängig voneinander umgesetzt und optimiert werden.
1. Die spezielle Logik eines Algorithmus wird in Callback-Funktionen zusammengefasst. Die gemeinsamen Aspekte dieser Algorithmen werden in den aufrufenden Funktionen gebündelt. 

<p class="alert alert-primary" markdown="1">
Das Zusammenfassen von Operationen in getrennte Funktionen wird auch als **Kapselung** bezeichnet. In diesem Zusammenhang spricht man auch von ***gekapselter Logik*** (gekapselt im Sinne von abgekapselt).  
</p>

Diese Strategie isoliert die Gemeinsamkeiten dieser Algorithmen. Diese können anschliessend unabhängig von der speziellen Programmlogik optimiert werden.

Ein Map-Reduce-Algorithmus besteht immer aus zwei Schritten. 

Beim ersten Schritt wird eine sog. *Abbildungsfunktion* für jeden Wert eines Vektors ausgeführt. Mit dieser Funktion werden die Werte des Vektors umgewandelt. Das Ergebnis dieser Abbildung ist ein neuer Vektor mit der gleichen Länge wie der Ursprungsvektor. 

Beim zweiten Schritt wird der im ersten Schritt erzeugte neue Vektor mit Hilfe einer sog. *Kombinationsfunktion* zum gewünschten Ergebnis *reduziert*. Dabei wird für jeden Kombinationsschritt das Zwischenergebnis über einen sog. *Akkumulator* an den nachfolgenden Kombinationsschritt weitergereicht.

Das folgende Beispiel in R veranschaulicht dieses Vorgehen mit der Berechnung der Quadratsumme eines Vektors. 

```R
library(tidyverse)

ursprungsVektor = 1:10

ursprungsVektor %>% map(function(wert) wert ** 2) -> abgebildeterVektor
abgebildeterVektor %>% reduce(function(akkumulator, wert) akkumulator + wert)

# oder als Funktionskette

ursprungsVektor %>% 
    map(function(wert) wert ** 2) %>% 
    reduce(function(akkumulator, wert) akkumulator + wert)
```
