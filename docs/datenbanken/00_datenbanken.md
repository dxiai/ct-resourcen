<p class="alert alert-primary" markdown="1">
**Definition:** Eine **Datenbank** ist ein System zum Speichern und Zugriff von strukturierten Daten.  
</p>

Datenbanken haben eine besondere Bedeutung in modernen Computing-Umgebungen. Sie erlauben die effiziente und dauerhafte Speicherung von sowie den systematischen Zugriff auf grosse Datenmengen. Eine Aufgabe von Datenbanken ist der leichte Zugriff auf Daten und auch Beziehungen zwischen den Daten. 

Es wird grob zwischen drei verschiedenen Arten von Datenbanken unterschieden. 

1. Relationale Datenbanken
2. Schlüssel-Wert-Speichern (Key-Value-Stores)
3. Dokumentdatenbanken

<p class="alert alert-primary" markdown="1">
**Relationale Datenbanken** unterstützen die Arbeit mit strukturierten Datensätzen. **Strukturierte Datensätze** bedeutet dabei, dass gleichartigen Datensätze aus den gleichen *Attributen* bestehen, denen im gleichen Datensatz genau ein *Wert* eines *atomaren Datentyps* zugewiesen ist. In relationalen Datenbanken können **Beziehungen zwischen verschiedenartigen Datensätzen** abgebildet werden.
</p>

<p class="alert alert-primary" markdown="1">
**Schlüssel-Wert-Speicher** (engl. Key-Value-Stores) sind Datenbanken in denen Datensätze aus einzelnen Schlüssel-Wert-Paaren bestehen. Übblicherweise haben die Werte in Schlüssel-Wert-Speichern *atomare Datentypen* Solche Schlüssel-Wert-Paare können zu Gruppen bzw. Strukturen zusammengefasst werden, so dass **hierarchische Beziehungen** zwischen Daten abgebildet werden können.
</p>

<p class="alert alert-primary" markdown="1">
**Dokumentdatenbanken** unterstützen die Arbeit mit sog. Datendokumenten. Datendokument sind strukturierte Datensätze aus Schlüssel-Wert-Paaren. Anders als relationale Datenbanken und Schlüssel-Wert-Speicher können die Attribute einer Dokumentdatenbank *komplexe Datentypen* haben. Dokumentdatenbanken bilden **Beziehungen zwischen komplexen Datentypen** ab.
</p>

Um auf die Datensätze einer Datenbank zuzugreifen, ist eine sog. **Abfragelogik** notwendig (Data Query Language; DQL). Die Abfragelogik definiert, nach welchen Kriterien Datensätze aus der Datenbank ausgelesen werden können. 

Für relationale Datenbanken existiert für die Abfragelogik der Standard **SQL** (ausgesprochen *Sequel*) [ISO/IEC 9075:2016](https://viewer.snv.ch/product/66148), der von *allen relationalen Datenbanken* unterstützt wird. SQL hat in der Datenverarbeitung damit eine so wichtige Rolle, dass in praktisch allen Unternehmen relationale Datenbanken eine zentrale Komponente des Daten-Managements sind.

Daraus folgt, dass eine moderne Datenbank, die SQL nicht unterstützt, *keine* relationale Datenbank ist. Weil das auf alle Dokumentdatenbanken zutrifft, werden diese häufig unter dem Sammelbegriff **NoSQL-Datenbanken** zusammengefasst.
