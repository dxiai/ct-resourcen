Neben der Abfragelogik müssen die Datenstrukturen einer Datenbank festgelegt werden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Schema** beschreibt alle Datenstrukturen und Beziehungen zwischen Datensätzen einer Datenbank. 
</p>

Ein Schema beschreibt also die **Struktur der Daten** in einer Datenbank. So kann mit Hilfe eines Schemas sowohl die Gültigkeit von Datensätzen überprüft als auch zulässige Anfragen an die Daten ermittelt werden.

<p class="alert alert-success" markdown="1">
Ohne die Kenntnis des Datenbankschemas ist es nicht möglich, die Daten einer Datenbank auszuwerten.
</p>

Das Schema einer Datenbank wird mittels einer sog. Datendefinitionslogik (engl. Data Definition Langauge; DDL) festgelegt. Für relationale Datenbanken ist die DDL Teil des SQL-Standards. 

Das Schema von Schlüssel-Wert-Speichern legt die zulässigen Datentypen für Schlüsselgruppen und ggf. die Hierarchie zwischen Schlüsseln fest.

Für Dokumentdatenbanken beschreibt das Schema, welche Datenstrukturen für welche Attribute zulässig sind. *Manche* Dokumentdatenbanken sind in der Lage, das Schema einer Datenbank aus den eingegebenen Datensätzen zu ermitteln. Deshalb werden solche Systeme als *schema-frei* bezeichnet.


<p class="alert alert-success" markdown="1">
Bei Schema-freien Datenbanken müssen die Datenstrukturen separat dokumentiert werden, damit eine Analyse ermöglicht wird.
</p>