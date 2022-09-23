# Informationstheorie

Die Arbeit mit Daten schliesst immer die Frage ein, ob diese Daten relevante Information verbergen. Dazu müssen wir zwei Konzepte erfassen:  

1. Daten 
2. Information

Beide Konzepte sind für unseren Alltag fast durchgehend von Bedeutung und ein intuitives Verständnis der beiden Konzepte sollte jedem vertraut sein. Beim intuitiven Umgang mit Daten und Information fällt auf, dass die beiden Begriffe häufig synonym gebraucht werden. Hier stellt sich ein erstes Problem: 

<p class="alert alert-secondary" markdown="1">
**Problem:** Wenn Daten und Information im Kern identisch sind, warum verwenden wir zwei Begriffe?
</p>

Führen wir die beiden Begriffe auf ihren wörtlichen Ursprung zurück: 

- *Daten*: Pluralform von Datum, das sich auf das lateinische Verb *dare* zurückgeführt werden kann. *Dare* bedeutet *gegeben* und das von uns verwendete Substantiv bedeutet *das Gegebene* oder *die Gabe*. 
- *Information*: lässt sich ebenfalls auf das Lateinische zurückführen, wobei dieses Wort unverändert in unseren Wortschatz eingegangen ist. Die Bedeutung dieses Begriffs steht für *Auskunft* oder *Benachrichtigung*. 

Mit diesen beiden Ursprüngen können wir die Begriffe für Anwendungen vorläufig unterscheiden:

- *Daten* bezeichnen konkrete Werte.
- *Information* bezeichnet den "Sinn" hinter den Daten. 

## Shannon's Informationsproblem

Claude Shannon befasste sich in den 1940er Jahren mit den Herausforderungen (damals) moderner Kommunikationstechnologien (Telegraphie und Telefon). Diese Technologien übertragen Nachrichten über einen Nachrichten*kanal*. Ein solcher Kanal kann ein Kabel oder auch Funkfrequenzen sein. Dieser Nachrichtenkanal wird auch als *Medium* bezeichnet. 

Diese analogen Technologien haben das Problem, dass sich Signale über längere Distanzen abschwächen. Dieser Effekt ergibt sich aus dem "Medium", das für eine Kommunikation verwendet wird.  Ein Kabel hat z.B. eine Dämpfung, die mit der Länge des Kabels steigt. Je länger ein Kabel wird, desto grösser wird die Dämpfung. Die Dämpfung hat zur Folge, dass ein Signal leiser wird. Dadurch geht ein Teil des ursprünglichen Signals verloren. Dieser Prozess wird als "Equivocation" bezeichnet.

<p class="alert alert-success" markdown="1">
**Merke:** Durch *Equivocation* gehen Informationen verloren.
</p>

Ein zweites Problem analoger Kommunikationstechnologien sind äussere Störungen des Mediums. Wird z.B. ein Magnet an ein Kabel gehalten, werden die über das Kabel übertragenen Signale verzerrt. Solche Veränderungen des Signals werden als Rauschen (engl. *Noise*) bezeichnet. Rauschen entsteht auch zufällig mit zunehmender Länge eines Mediums. 

<p class="alert alert-success" markdown="1">
**Merke:** Durch Rauschen wird neue Information eingefügt. 
</p>

Shannon hat vor diesem Hintergrund die folgende Fragestellung untersucht:

<p class="alert alert-secondary" markdown="1">
**Problem** Wie kann eine Nachricht ein Ziel erreichen, wenn die Daten durch Rauschen und Equivocation verändert werden? 
</p>

Shannon gliedert diese Problemstellung in Teilprobleme, indem der Kommunikationsprozess in Teilschritte gegliedert wird. Dabei ist die "geschickte" Gliederung von Bedeutung. Shannon hat den Kommunikationsprozess in sieben Komponenten unterteilt, indem er die bekannten Störungen der Nachrichtenübertragungen verbunden hat.

- Eine Informationsquelle, die Information erzeugt
- Kodieren der Information in eine Nachricht für ein Medium
- Das Übertragen der Nachricht über einen Kanal
- Empfangen und dekodieren der Nachricht 
- Ein Informationsziel, die Information aufnimmt

Zusätzlich müssen 

- die Equivocation und 
- das Rauschen 

als eigenständige Elemente berücksichtigt werden.


```
                source
                  \/
             sender/encoder
                  \/
equivocation <- Channel   <- noise
                  \/
           receiver/decoder
                  \/
              destination
```

<!-- >
> *Übung:* Geben Sie eine Definition für **Daten** und für **Information**. Falls Sie einen Unterschied zwischen den beiden Konzepten erkennen, beschreiben Sie diesen Unterschied?

> *Übung:* Diskutieren Sie Ihre Definitionen in Kleingruppen und kommen zu einer gemeinsamen Definition auf Grundlage der ersten Übung.  

> *Übung:* Stille Post und Multi-Stille Post über Reihen. Kein Nachfragen!

-->

Shannon's besondere Leistung war, dass er diese Elemente als mathematische Funktionen über Wahrscheinlichkeiten (d.h. Werte zwischen `0` und `1`) formuliert und erkannt hat, dass Kommunikation dem Prinzip der **Entropie** folgt. Dieses Prinzip besagt, dass ein System mit einer niedrigen Entropie (d.h. einer geordneten Struktur) nur zu einer gleichbleibenden oder grösseren Entropie (d.h. zu mehr Unordnung) tendiert. 

Daraus ergibt sich für Shannon's Theorie als direkte Konsequenz, dass Information und Daten über die folgende Funktion verbunden sind: 

$$
I(D) = P(D) - \epsilon
$$

- ``D`` steht dabei für die empfangenen Daten und
- \\( \epsilon \\) ist die Summe der Wahrscheinlichkeiten aller Störungen im Kommunikationsprozess: 

$$
\epsilon = P(S) + P(E) + P(N) + P(R) = \sum_{a} P(n_a)
$$

Mit 
- S = Senden/Kodieren
- E = Equivocation
- N = Rauschen (Noise)
- R = Empfangen/Dekodieren (Receiving)


Umgangssprachlich lassen sich diese Terme folgenderweise umschreiben: 

<p class="alert alert-primary" markdown="1">
Information ergibt sich aus Daten, nachdem alle Fehler und Störungen in den Daten entfernt wurden.
</p>


### Das Shannon Limit

Weil `D` ebenfalls eine Wahrscheinlichkeit ist, ergibt sich daraus, dass Kommunikation nur möglich ist, solange die folgende Ungleichung gilt:

$$
P(D) \ge \epsilon
$$

Entsprechend wird \\( \epsilon \\) in der Datenverarbeitung auch als **Shannon Limit** bezeichnet, weil dieser Term die absolute Grenze beschreibt, bis zu der eine fehlerfreie Kommunikation möglich ist. 

<p class="alert alert-success" markdown="1">
Diese Ungleichung besagt umgangssprachlich, dass Kommunikation nur solange möglich ist, falls nicht mehr Fehler und Störungen als Daten übertragen werden. 
</p>

Shannon hat nachgewiesen, dass jeder Kanal eine Grenze hat, ab der keine Datenübertragung mehr möglich ist.
