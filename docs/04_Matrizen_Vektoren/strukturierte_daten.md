# Organisation von Daten

Dieser Artikel ergänzt das Video "Grundbegriffe" um die im Video nicht erwähnten Begriffe und führt die allgemeinen Kennwerte von Stichproben ein.

Uns begegnen meistens Daten in Form von Tabellen. Solche Tabellen repräsentieren **Messungen**, die wir auswerten und analysieren möchten. Diese Messungen bilden einen Ausschnitt einer **Grundgesamtheit** ab. Ohne an dieser Stelle genauer auf das statische Konzept der Grundgesamtheit einzugehen, sind Daten in der Regel eine *gemessene* **Stichprobe** einer Grundgesamtheit.

<p class="alert alert-info" markdown="1">
Die **Statistik** befasst sich mit den Methoden, um von Stichproben auf die ursprüngliche Grundgesamtheit zu schliessen. Aus Sicht der Daten und Datenverarbeitung ist die Grundgesamtheit **unerheblich**, weil wir die nicht gemessenen Aspekte nicht kennen können!
</p>

<p class="alert alert-primary" markdown="1">
**Definition**: Als **Stichprobe** wird die Gesamtheit der zusammengehörenden Daten bezeichnet.
</p>

In der Praxis sind Tabellen identisch mit der jeweiligen Stichprobe. 

<p class="alert alert-warning" markdown="1">
Stichproben werden in **R** als ``Data-Frame`` bezeichnet. Data-Frames werden mit der ``tibble()``- oder der ``data.frame()``-Funktion erzeugt.
</p>

<p class="alert alert-warning" markdown="1">
Stichproben werden in **Excel** oft als ``Tabelle`` bezeichnet. Excel-Tabellen werden nicht immer vom jeweiligen Arbeitsblatt unterschieden.
</p>

Wir repräsentieren Daten immer als eine Kombination aus Werten und Kontext, den sogenannten **Metadaten**. Zu den Metadaten gehören insbesondere Informationen über die *Bezeichnung*, den *Wertebereich* und die *Masseinheit*. Dabei kann es vorkommen, dass Wertebereich und Masseinheit nicht vorhanden sind. 

Die Metadaten einer Stichprobe werden in der Regel separat von der Stichprobe dokumentiert. Sie werden über die **Vektorennamen** in einer Tabelle referenziert. Als Vektorenname werden die Spaltenüberschriften bezeichnet. In einer Stichprobe haben die Werte in einer Spalte daher immer die gleichen Eigenschaften. 

<p class="alert alert-primary" markdown="1">
**Definition**: Stichprobenwerte mit den gleichen Metadaten werden als **Vektoren** bezeichnet.
</p>

Entsprechend bilden die Werte in der gleichen Spalte einen solchen Vektor.

<p class="alert alert-primary" markdown="1">
**Definition**: Die Zeilen einer Stichprobe beschreiben zusammengehörende Werte. Diese Werte werden als **Datensatz** bezeichnet.
</p>

<p class="alert alert-info" markdown="1">
Gelegentlich werden Stichproben zeilenweise erfasst. Solche Stichproben können durch **transponieren** in eine Spaltenform gebracht werden. In diesem Fall werden die Werte insgesamt um 90 Grad gedreht angeordnet.
</p>

Ein Datensatz kann Werte aus einer oder mehreren Messungen beinhalten. Das folgende Beispiel zeigt einen Datensatz mit Werten aus mehreren Messungen bzw. Messereignissen. Jeder Vektor in dieser Stichprobe entspricht dabei unabhängigen Messungen. 

<img src="https://github.com/dxiai/ct-resourcen/blob/main/bilder/stichprobe_nicht_normal.png?raw=true" alt="Stichprobe mit mehreren Messereignissen pro Datensatz" width="500" height="182" class="img-responsive atto_image_button_text-bottom">

Ein **Messereignis** bezeichnet das gleichzeitige Erheben zusammengehörender Daten. Wenn Sie beispielsweise das gleiche Objekt zu unterschiedlichen Zeitpunkten messen, dann liegen unterschiedliche Messereignisse vor. Diese Messungen sind entsprechend **unabhängig** voneinander. Wir können uns das an einem Raum veranschaulichen, dessen Temperatur und Helligkeit wir regelmässig messen. Die am Montag um 13 Uhr gemessene Temperatur und Helligkeit gehören zum gleichen Messereignis. Die beiden gemessenen Werte sind unabhängig von anderen Messungen zu früheren oder späteren Zeitpunkten.

<p class="alert alert-warning" markdown="1">
Beachten Sie, dass die Unabhängigkeit die Messereignisse betrifft und nicht mit *unabhängigen Variablen* in der Statistik verwechselt werden darf.
</p> 

<p class="alert alert-primary" markdown="1">
**Definition**: Beziehen sich alle Werte in den gleichen Datensätzen einer Stichprobe immer auf das gleiche *Messereignis*, dann liegt die Stichprobe in **Normalform** vor.
</p>

Das folgende Beispiel zeigt einen Ausschnitt einer Stichprobe in Normalform des oben dargestellten Beispiels.

[Stichprobe in Normalform](https://github.com/dxiai/ct-resourcen/blob/main/bilder/stichprobe_normalform.png?raw=true)

Die Anzahl der Datensätze in einer normalisierten Stichprobe entspricht der Anzahl der *unabhängigen* Messereignisse.
