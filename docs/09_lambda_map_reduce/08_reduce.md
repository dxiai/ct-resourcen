# Reduzieren bzw. Aggregieren

Der zweite Schritt von Map-Reduce-Algorithmen ist das Reduzieren. Beim Reduzieren werden die Werte eines Vektors schrittweise zu einem Gesamtergebnis *reduziert*. Einen Arbeitsschritt beim Reduzieren bezeichnen wir als *Reduktionsschritt*. Dieser Reduktionsschritt *kombiniert* den aktuellen Vektorwert (\\( v_n \\)) mit einem **Akkumulator** (A) mit Hilfe eines Kombinierenoperators (\\( \odot \\)). Wir können also einen Reduktionsschritt wie folgt beschreiben: 

$$
A \odot  v_n
$$

Anders als die bisherigen Operatoren ist für der Kombinierenoperator (\\( \odot \\)) kein spezielles Verhalten vorgegeben. Dieses Verhalten wird erst durch eine **Kombinations*funktion*** festgelegt. Weil die Kombinationsfunktion als binärer Operator verwendet wird, hat diese Funktion genau zwei Parameter: 

- den Akkumulator
- den Vektorwert

Das Ergebnis der Kombinationsfunktion muss ein gültiger Akkumulator für die Kombinationsfunktion sein, weil dieses Ergebnis für den ersten Parameter der folgenden Kombinationsfunktion dient. 

Die oben gezeigte Operation bedeutet, dass der Akkumulator A alle vorangegangenen Reduktionsschritte in sich vereinigt. Das könnten wir auch wie folgt beschreiben: 

$$
A \odot  v_n \Leftrightarrow (v_1 \odot v_2  \odot \cdots v_{n-1}) \odot v_n
$$

Für einen Vektor der Länge `4` würden die Reduktionsschritte wie folgt aussehen.

1. \\( v_1 \\)
1. \\( v_1 \odot v_2 \\)
1. \\( v_1 \odot v_2 \odot v_3 \\)
1. \\( v_1 \odot v_2 \odot v_3 \odot v_4 \\)

Aus dieser Vorgehensweise für den Vektor mit der Länge 4 wird deutlich, dass die Kombinationsfunktion **nicht** mit dem ersten Wert ausgeführt wird. Es fehlt nämlich der notwendige Verknüpfungsoperator. 

Dieses Verhalten ist nicht immer erwünscht. 
Damit die Kombinationsfunktion auch auf den ersten Vektorwert angewendet wird, müssen wir sicherstellen, dass bereits ein Wert für den Akkumulator vorliegt, damit dieser an die Kombinationsfunktion übergeben werden kann. Das kann bei bestimmten Kombinationsfunktionen zu Problemen führen. Aus diesem Grund führen wir einen initialen Akkumulator ein (\\( A_0 \\)). Die Beschreibung der Reduktion verändert sich dadurch wie folgt. 

$$
A_0 \odot v_1  \odot \cdots v_{n-1} \odot v_n
$$

Die Reduktionsschritte für einen Vektor der Länge 4 werden folgenderweise angepasst.

1. \\( A_0 \odot v_1 \\)
1. \\( A_0 \odot v_1 \odot v_2 \\)
1. \\( A_0 \odot v_1 \odot v_2 \odot v_3 \\)
1. \\( A_0 \odot v_1 \odot v_2 \odot v_3 \odot v_4\\)

Jetzt ist der Kombinierenoperator auch beim ersten Wert vorhanden. Erst ein initialer Akkumulator stellt sicher, dass unsere Kombinationsfunktion auch mit dem ersten Wert ausgeführt wird.

<p class="alert alert-danger" markdown="1">
Der initiale Akkumulator ist in Excel und R *optional*. Die Kombinationsfunktion wird mit dem ersten Wert **nur dann ausgeführt**, wenn ein initialer Akkumulator angegeben wurde.
</p>

**Triviale Beispiele:**

```
1:10 %>% reduce(`+`) # Kein initialer Akkumulator notwendig

# Ergebnis ist 0 und nicht 1, initialer Akkumulator erforderlich
0:5 %>% reduce(function(akkumulator, wert) akkumulator ^ wert ) 

# Ergebnis ist 1
0:5 %>% reduce(function(akkumulator, wert) akkumulator ^ wert, .init = 0 ) 
```
<p class="alert alert-success" markdown="1">
Häufig sind die Kombinationsfunktionen für den Reduce-Schritt sehr einfach. Dadurch lassen sich Standardfunktionen als Kombinatoren verwenden. 
</p>

<div class="alert alert-secondary" markdown="1">
In R dürfen Akkumulatoren einen anderen Datentyp als die Werte haben. So können Werte beim Reduzieren in komplexe Datentypen eingebettet werden.

*Beispiel: Alle Werte verdoppeln, die kleiner als `6` sind und alle anderen entfernen* 

```R
Werte = c(
             5,14,7,9,14,12,2,4, 9, 9,6,5,13,12,2,
            10, 7,8,8, 5, 5,1,9,10,12,4,4,12, 2,1
         ) 

Werte %>% 
     map(function(wert) if (wert < 6) 2 * wert) %>%
     reduce(c)
```

> 10, 4, 8, 10, 4, 10, 10, 2, 8, 8, 4, 2


In diesem Beispiel verwenden wir Rs [`c()`-Funktion](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/c) als Kombinationsfunktion. Dabei nutzen wir beim Reduzieren aus, dass die Funktion den Wert `NULL` ignoriert und nur gültige Werte in den Ergebnisvektor einbettet.
</div>

<p class="alert alert-success" markdown="1">
In Excel bieten sich oft die normalen Aggregatoren für den Reduce-Schritt an. Damit kann man sich eine komplizierte Lambda-Funktion oft sparen. 
</p>

<p class="alert alert-danger" markdown="1">
In Excel dürfen Akkumulartoren nur die atomaren Datentypen  `Zahl`, `Zeichenkette` (Text) oder `Wahrheitswert` (Logisch)  haben.
</p>
