<p class="alert alert-primary" markdown="1">
**Definition:** Als **Kodieren** werden alle *Transformationsfunktionen* (Konvertierungsfunktionen) bezeichnet, die Werte eines Vektors durch andere (oft neue) Werte ersetzen.
</p> 

Über das *Kodieren* wissen wir bereits, dass wir beliebige Symbole in Zahlen kodieren können und dass wir beliebige Ziffern als Binärzahl darstellen können. 

<p class="alert alert-success" markdown="1">
**Merke:** Beim *Kodieren* beachten wir, dass alle Ersetzungen den gleichen Datentyp haben. D.h. alle Ersetzungen müssen entweder *Zahlen, Zeichenketten, Wahrheitswerte* oder ähnliche Formate haben. Wir dürfen Zahlen, Zeichenketten oder Wahrheitswerte **nicht** mischen!
</p>

### Problemstellung

Die Werte in einem Vektor liegen in einem falschen Format vor, als für ein Analyseverfahren gefordert ist.

### Idee

Wir brauchen Übersetzungsregeln für das ***Kodieren von Daten***. 

<p class="alert alert-primary" markdown="1">
**Definition:** Die Übersetzungsregeln werden in einer **Kodierungstabelle** festgehalten.
</p>

Beim Kodieren von Zeichenketten haben wir bereits die ASCII Kodierungstabelle kennengelernt. Das gleiche Prinzip wenden wir an, um unsere eigenen Werte zu *kodieren*.

Der einfachste Fall einer Kodierungstabelle unterscheidet zwischen zwei Fällen. Das Ergebnis solcher Kodierungen hat deshalb genau zwei Werte. Solche Kodierungen führen wir mittels der R-Funktion `ifelse()` bzw. der EXCEL-Funktion `WENN()`. Dabei verwenden wir einen logischen Ausdruck, um zwischen zwei Ergebniskodierungen zu unterscheiden. 

<p class="alert alert-warning" markdown="1">
Nicht alle Kodierungen ermöglichen es, die ursprünglichen Werte zu rekonstruieren.
</p>

<p class="alert alert-primary" markdown="1">
Kodierungen, die jeden Ausgangswert *eindeutig* einem Zielwert zuweisen, werden als **verlustfreie** Kodierungen bezeichnet. 
</p>

<p class="alert alert-primary" markdown="1">
Kodierungen, die mehreren Ausgangswerten den gleichen Zielwert zuweisen, werden als **verlustbehaftete (lossy)** Kodierungen bezeichnet, weil aus den Zielwerten die Ausgangswerte nicht mehr reproduziert werden können.
</p>

<p class="alert alert-warning" markdown="1">
Binäre Kodierungen können leicht zu verlustbehafteten Kodierungen führen. 
</p>

**Beispiel für eine verlustbehaftete binäre Kodierung.**  Im folgenden Beispiel wird ein `DatenVektor` mittels `ifelse()` in R umkodiert.

```
DatenVektor =  c(1,3,1,1,3,3,1,3,3,3,1,3,3,4,3) 

KodierterVektor = ifelse(DatenVektor == 1, "Damen", "Herren") 
```

Diese Kodierung ist verlustbehaftet, weil der Ausgangsvektor drei unterschiedliche Werte hat, die aber nur in zwei Zielwerte umgeformt werden. 

Das binäre Kodieren können wir auch beim Umformen von Stichproben einsetzen. 

```
mobilgeraete = read_csv("2022_adls_gender_devices.csv")

mobilgeraete %>% 
    mutate(
        Q01_Mob.Typ = ifelse(Q01_Mob.Typ == 3, "Android", "iPhone")
    ) -> UmgeformteMobilgeraete
```

### R's `recode()` und EXCEL's `ERSTERWERT()`-Funktion

Die R-Funktion `recode()` ermöglicht uns aus verschiedenen Optionen auszuwählen.

Die `recode()`-Funktion erwartet einen *Vektor* mit Vergleichswerten. Die restlichen Parameter der Funktion bestehen aus Wertepaaren, wobei der Namensteil (vor dem Gleichheitszeichen) den gesuchten Vergleichswert angibt und der Werteteil (nach dem Gleichheitszeichen) den Austauschwert, durch den der Vergleichswert ersetzt werden soll. 

Falls alle nicht explizit ersetzten Werte durch einen bestimmten Wert ersetzt werden sollen, ist der `.default`-Parameter zu verwenden.  Standardmässig ist die Identitätsfunktion als Vorgabewert konfiguriert.

**Beispiel 1: `recode()` mit Standardersetzung**

```
beispielWerte = c("a", "b", "c")

beispielWerte %>% recode("a" = "alpha",
                         "b" = "beta",
                         "c" = "gamma",
                         .default = "blabla") 
```

Beachten Sie den Parameter mit dem Namen `.default`. Dieser Wert wird für alle Werte zurückgegeben, die durch die anderen Werte nicht abgedeckt werden. 

Dieses Beispiel ist identisch mit dem folgenden Entscheidungsbaum: 

```
ifelse(beispielWerte == "a", "alpha", 
    ifelse(beispielWerte == "b", "beta",
        ifelse(beispielWerte == "c", "gamma", 
            "blabla")))
```

Besser ist die vereinfachte lineare Schreibweise mit `case_when()`:

```
case_when(
   beispielWerte == "a" ~ "alpha", 
   beispielWerte == "b" ~ "beta",
   beispielWerte == "c" ~ "gamma", 
   TRUE ~ "blabla"
)
```

### Kodieren von Zahlen

Wenn wir Zahlen kodieren möchten, dann müssen wir den **Namensteil** mit Akzenten angeben. Der Werteteil kann beliebige Werte enthalten (Zahlen, Wahrheitswerte, Zeichenketten usw.), die *nicht* besonders geschützt werden müssen. 

**Beispiel 2: Kodieren von Zahlenwerten**

```
beispielWerte = c(6, 5, 4, 3)

beispielWerte %>% recode(`6` = "Sehr gut", 
                         `5` = "Gut", 
                         `4` = "Genügend", 
                         `3` = "Ungenügend")
```

Die EXCEL-Funktion `ERSTERWERT()` arbeitet ganz analog, wobei die Werte natürlich nicht als Namen, sondern als eigene Parameter übergeben werden. EXCEL's `ERSTERWERT()`-Funktion hat keine Einschränkung des Datentypen für den Vergleichswert.

**Beispiel 3: Einfaches Kodieren in EXCEL**

```
= ERSTERWERT(A1:A4; 6; "Sehr gut";5; "Gut"; 4; "Genügend"; 3; "Ungenügend")
```

Dieses Beispiel ist analog zu Beispiel 2 in R und entspricht der längeren `WENNS()`-Schreibweise: 

```
= WENNS(A1:A4 = 6; "Sehr gut"; A1:A4 = 5; "Gut"; A1:A4 = 4; "Genügend"; A1:A4 = 3; "Ungenügend")
```

Auch bei der `ERSTERWERT()`-Funktion gibt es einen *Rückfallwert*. Dieser Wert wird verwendet, wenn Werte im Vektor nicht durch einen Vergleich ausgetauscht wurden. Dieser Rückfallwert wird immer ohne Referenzwert als letzter Parameter übergeben.

**Beispiel 4: Kodieren in EXCEL mit Rückfallwert**

```
=ERSTERWERT(A1:A4; "a"; "alpha"; "b"; "beta"; "c"; "gamma"; "blabla")
```
