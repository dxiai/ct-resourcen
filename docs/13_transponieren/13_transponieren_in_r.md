<p class="alert alert-danger" markdown="1">
Im Internet finden Sie viele Beispiele mit den Funktionen `melt()`, `gather()` oder `spread()`. Diese Funktionen sind seit mehreren Jahren veraltet und sollen nicht mehr in neuen Code verwendet werden, weil die Parameter-Verwendung und die Parameternamen inkonsistent zu anderen Teilen von R  ist. **Wir verwenden ausschliesslich die aktuellen Funktionen `pivot_longer()` und `pivot_wider()`.**
</p>

## Pivot-Tabellen in R

Dieses Dokument zeigt ein vollständiges Beispiel mit den [Umfragedaten](https://moodle.zhaw.ch/mod/resource/view.php?id=635242) aus der Warm-Up-Umfrage am Anfang des Semesters. 

<p class="alert alert-warning" markdown="1">
Die Beispiele wurden mit einer anderen Stichprobe berechnet. Wenn Sie die Daten nachvollziehen, werden Sie andere Werte erhalten. Betrachten Sie die Reflexionsfrage am Ende dieser Seite.
</p>

```R
library(tidyverse)

umfrageDaten = read_csv2("umfragedaten.csv")
```  

### Warum brauchen wir Pivot-Tabellen?

Diese Frage beantworte ich mit Hilfe eines Beispiels: 

Im Folgenden untersuchen wir die beiden Vektoren `q02_demo_workload` und `q03_demo_studyworkload`. In diesen Vektoren sind die Nennungen zum Umfang einer Berufstätigkeit und dem Studienmodus (Vollzeit oder Teilzeit) dokumentiert. 

```R
umfrageDaten %>% 
    count(q02_demo_workload)
```

<div class="alert alert-secondary">
<table>
<thead>
	<tr><th scope=col>q02_demo_workload</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Teilzeit bis 25% </td><td> 33</td></tr>
	<tr><td>2 : Teilzeit bis 50% </td><td> 12</td></tr>
	<tr><td>3 : Teilzeit über 50%</td><td>  4</td></tr>
	<tr><td>4 : Vollzeit         </td><td>  1</td></tr>
	<tr><td>NA                   </td><td>150</td></tr>
</tbody>
</table>
</div>


```R
umfrageDaten %>% 
    count(q03_demo_studyload)
```

<div class="alert alert-secondary">
<table>
<thead>
	<tr><th scope=col>q03_demo_studyload</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Vollzeit</td><td>168</td></tr>
	<tr><td>2 : Teilzeit</td><td> 32</td></tr>
</tbody>
</table>
</div>


Aus diesen Auswertungen können wir nicht gut ablesen, wie sich die Werte der beiden Vektoren zueinander verhalten. Wir haben also kein Gefühl dafür, ob Vollzeitstudierende tatsächlich nur studieren und nur Teilzeitstudierende arbeiten, oder ob und in welchem Umfang beide Gruppen berufstätig sind. Für die Analyse nutzen wir aus, dass wir mehrere Vektoren auf einmal gruppieren können. So finden wir heraus, welche Werte wie oft gemeinsam auftreten.


```R
umfrageDaten %>% 
    count(q03_demo_studyload, q02_demo_workload)
```

<div class="alert alert-secondary">
<table>
<thead>
	<tr><th scope=col>q03_demo_studyload</th><th scope=col>q02_demo_workload</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Vollzeit</td><td>1 : Teilzeit bis 25% </td><td> 25</td></tr>
	<tr><td>1 : Vollzeit</td><td>2 : Teilzeit bis 50% </td><td>  2</td></tr>
	<tr><td>1 : Vollzeit</td><td>4 : Vollzeit         </td><td>  1</td></tr>
	<tr><td>1 : Vollzeit</td><td>NA                   </td><td>140</td></tr>
	<tr><td>2 : Teilzeit</td><td>1 : Teilzeit bis 25% </td><td>  8</td></tr>
	<tr><td>2 : Teilzeit</td><td>2 : Teilzeit bis 50% </td><td> 10</td></tr>
	<tr><td>2 : Teilzeit</td><td>3 : Teilzeit über 50%</td><td>  4</td></tr>
	<tr><td>2 : Teilzeit</td><td>NA                   </td><td> 10</td></tr>
</tbody>
</table>
</div>

In R erhalten wir bei solchen Auswertungen immer die Langform einer Stichprobe. Diese Darstellung ist für uns aber schwierig zu lesen und zu interpretieren. Eine *Kreuztabelle* (d.h. die Breitform) würde uns hier die Interpretation der Werte erleichtern. Deshalb transponieren wir die beiden Vektoren `q02_demo_workload` und `q03_demo_studyload` in einer Kreuztabelle gegenüber. In R überführen wir eine Stichprobe mit der `pivot_wider()`-Funktion von der Langform in die Breitform und erhalten so eine Kreuztabelle. 

<p class="alert alert-warning" markdown="1"> 
**Achtung:** Bei Sauer (2019) und in vielen Internetforen wird die Funktion ``spread()`` und nicht ``pivot_wider()`` verwendet. Die ``pivot_longer()``-Funktion heisst dort ``gather()``. ``spread()``und ``gather()`` gelten jedoch als veraltet ("superseded") und **sollen nicht mehr für neue Projekte verwendet werden!** Ersetzen Sie deshalb die  Funktionen ``spread()`` und ``gather()`` aus dem Lehrbuch durch ``pivot_wider()`` und ``pivot_longer()``.
</p>

Mit `pivot_wider()` übernehmen wir die Werte aus einer Spalte als Vektorennamen für die Breitform. Diese Namen übergeben wir mit dem `names_from`-Parameter. Mit Hilfe des `values_from`-Parameters geben wir den Vektor an, aus dem die Werte für die neuen Vektoren genommen werden sollen.

Im nächsten Beispiel verwende ich zusätzlich den Parameter `names_prefix`, um allen neuen Vektoren einen einheitlichen Namensanfang zu geben.

```R
umfrageDaten %>% 
    count(q03_demo_studyload, q02_demo_workload) %>% 
    pivot_wider(names_from = q02_demo_workload,
                values_from = n, 
                names_prefix = "workload_")
```

<div class="alert alert-secondary">
<table border="1">
<thead>
	<tr><th scope=col>q03_demo_studyload</th><th scope=col>workload_1 : Teilzeit bis 25%</th><th scope=col>workload_2 : Teilzeit bis 50%</th><th scope=col>workload_4 : Vollzeit</th><th scope=col>workload_NA</th><th scope=col>workload_3 : Teilzeit über 50%</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Vollzeit</td><td>25</td><td> 2</td><td> 1</td><td>140</td><td>NA</td></tr>
	<tr><td>2 : Teilzeit</td><td> 8</td><td>10</td><td>NA</td><td> 10</td><td> 4</td></tr>
</tbody>
</table>
</div>

Hier fällt auf, dass die ``pivot_wider()``-Funktion `NA` Werte erzeugt, falls für bestimmte Wertepaare keine Werte in der Langform vorlagen. Diese Werte sind nicht sehr schön und irritieren beim Lesen. Mit der Funktion `replace_na()` können wir diese Werte zum Beispiel in den Wert `0` in allen Vektoren umwandeln. Diese Umwandlung ist aber kompliziert und muss oft durchgeführt werden. Deshalb hat die Funktion `pivot_wider()` den zusätzlichen Parameter `values_fill`. Diesem Parameter können wir einen Wert zuweisen, der eingefügt wird, falls Werte in Datensätzen nicht vorhanden sind. 

```R
umfrageDaten %>% 
    count(q03_demo_studyload, q02_demo_workload) %>% 
    pivot_wider(
        names_from = q02_demo_workload, 
        names_prefix = "workload_",
        values_from = n,
        values_fill = 0
    )
```

<div class="alert alert-secondary">
<table border="1">
<thead>
	<tr><th scope=col>q03_demo_studyload</th><th scope=col>workload_1 : Teilzeit bis 25%</th><th scope=col>workload_2 : Teilzeit bis 50%</th><th scope=col>workload_4 : Vollzeit</th><th scope=col>workload_NA</th><th scope=col>workload_3 : Teilzeit über 50%</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Vollzeit</td><td>25</td><td> 2</td><td> 1</td><td>140</td><td>0</td></tr>
	<tr><td>2 : Teilzeit</td><td> 8</td><td>10</td><td>0</td><td> 10</td><td> 4</td></tr>
</tbody>
</table>
</div>

### Transponieren in die Langform mit `pivot_longer()`

Wir können eine breite Stichprobe mit der Funktion `pivot_longer()` in ihre Langform überführen. Dabei handelt es sich um die Umkehrfunktion von `pivot_wider()`. Aus den Parametern `names_from` und `values_from` wird `names_to` und `values_to`. Ausserdem müssen wir `pivot_longer()` mitteilen, welche Vektoren berücksichtigt werden sollen. Dazu können wir z.B. die `starts_with()`-Funktion verwenden, um alle Vektoren mit dem gleichen Präfix auszuwählen.

<p class="alert alert-info"> <code>starts_with()</code> ist eine Hilfsfunktion zur Auswahl von Vektoren. Die Funktion haben wir bereits beim Auswählen von Vektoren zum horizontalen Filtern kennengelernt (Logische Ausdrücke).</p>

Der folgende Code wandelt eine Kreuztabelle wieder zurück in das Langformat der Stichprobe.

```R
umfrageDaten %>% 
    count(q03_demo_studyload, q02_demo_workload) %>% 
    pivot_wider(names_from = q02_demo_workload,
                values_from = n, 
                names_prefix = "workload_"
               )  %>%
    pivot_longer(
               starts_with("workload_"),
               names_to = "q02_demo_workload",
               values_to = "n"
               )
```

Das ist natürlich kein sehr sinnvolles Beispiel. *In der Praxis verwenden wir `pivot_longer()`, um Werte aus mehreren Vektoren zusammenzufassen.* In unserem Beispiel haben wir eine solche Situation für die beiden Vektoren `q14_m_ver_android` und `q15_m_ver_ios`. In diesen Vektoren sind die Nennungen der Versionsnummern des Smartphone-Betriebssystems gesammelt. Falls eine Person nicht wusste, welche Version das eigene Smartphone verwendet, findet sich hier der Wert `1: Weiss nicht`. 

Je nachdem ob im Vektor `q11_mob_typ` "Android Smartphone" oder "iPhone" angegeben wurde, steht in diesen Vektoren entweder ein Wert oder `NA` oder die jeweilige Versionsnummer. Für Auswertungen ist diese Trennung aber hinderlich. Deshalb fassen wir die beiden Vektoren wie folgt zusammen. 

```R
umfrageDaten %>%
    pivot_longer(contains("m_ver"), 
                 names_to = "m_ver_typ", 
                 values_to = "q14_m_ver",
                 values_drop_na = TRUE) -> versionenZusammengefasst
```

Weil wir in unserem Fall nur Nennungen in einem der beiden Vektoren haben, weisen wir mit dem `values_drop_na`-Parameter `pivot_longer()` an, keine zusätzlichen Datensätze für diese `NA` zu erzeugen.

Jetzt können wir bestimmen, welche Werte wie viele Nennungen erhalten haben.


```R
versionenZusammengefasst %>%
    count(q11_mob_typ, q14_m_ver) %>%
    # Berechnen des Prozentanteils je Gruppe
    group_by(q11_mob_typ) %>%
    mutate(prozent = round(n / sum(n) * 100, 0)) %>%
    # Nur die "Weiss nicht" Nennungen anzeigen
    filter(q14_m_ver %>% str_detect("Weiss nicht"))
```

<div class="alert alert-secondary">
<table>
<thead>
	<tr><th scope=col>q11_mob_typ</th><th scope=col>q14_m_ver</th><th scope=col>n</th><th scope=col>prozent</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>3 : Android Smartphone</td><td>1 : Weiss nicht</td><td>69</td><td>64</td></tr>
	<tr><td>4 : iPhone            </td><td>1 : Weiss nicht</td><td>31</td><td>40</td></tr>
</tbody>
</table>
</div>

Wir sehen, dass iPhone-Besitzende häufiger die Version ihres Smartphone-Betriebssystems kennen als Nutzende von Android-Smartphones. Nur 40% der iOS-Nutzenden kennen die Version ihres Smartphone-Betriebssystems nicht, im Vergleich zu  64% der Android-Nutzenden.

<p class="alert alert-info" markdown="1"> 
Die hier ausgewerteten Daten beziehen sich auf den Jahrgang UI 2020. Werten Sie die beiden Fragestellungen für Ihren Jahrgang aus. Was fällt Ihnen auf?
</p>

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=635242" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download"></i> Aktuelle Umfragedaten</a>