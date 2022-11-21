Neben der Abfragelogik müssen die Datenstrukturen einer Datenbank festgelegt werden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Schema** beschreibt alle Datenstrukturen und Beziehungen zwischen den Datensätzen in einer Datenbank. 
</p>

Ein Schema beschreibt also die **Struktur der Daten** in einer Datenbank. So kann mit Hilfe eines Schemas sowohl die Gültigkeit von Datensätzen überprüft als auch zulässige Anfragen an die Daten ermittelt werden.

<p class="alert alert-success" markdown="1">
Ohne die Kenntnis des Datenbankschemas ist es nicht möglich, die Daten einer Datenbank auszuwerten.
</p>

Das Schema einer Datenbank wird mittels einer sog. Datendefinitionslogik (engl. Data Definition Langauge; DDL) festgelegt. Für relationale Datenbanken ist die DDL Teil des SQL-Standards. 

Das Schema von Schlüssel-Wert-Speichern legt die zulässigen Datentypen für Schlüsselgruppen und ggf. die Hierarchie zwischen Schlüsseln fest.

Für Dokumentdatenbanken beschreibt das Schema, welche Datenstrukturen für welche Attribute zulässig sind. *Manche* Dokumentdatenbanken sind in der Lage, das Schema einer Datenbank aus den eingegebenen Datensätzen zu ermitteln. Deshalb werden solche Systeme als *schema-frei* bezeichnet.


<p class="alert alert-success" markdown="1">
Bei Schema-freien Datenbanken müssen die Datenstrukturen separat dokumentiert werden, damit eine Analyse möglich ist.
</p>

### Ein SQL-Schema lesen

Die Grundstruktur einer **SQL-Datenbank** ist eine *Tabelle*. 
- Eine Tabelle besteht aus mehreren Vektoren bzw. *Feldern*. 
- Ein Feld muss einen Datentyp haben. Mögliche Datentypen sind: 
  - `INTEGER` (Ganzzahl)
  - `REAL` (Fliesskommazahl)
  - `TEXT` (Zeichenkette)
  - `BLOB` (Binärdaten ohne Kodierung)
- Felder einer Tabelle können als durchsuchbar markiert werden. Diese Felder werden als *Schlüsselfelder* (engl. *Key*) bezeichnet und erhalten einen *Index* für den schnelleren Zugriff. 
- Identifiziert ein Schlüsselfeld jeden Datensatz eindeutig, dann wird dieser Schlüssel als *Primärschlüssel*  (engl. *Primary Key*) bezeichnet. 
- Zwei Tabellen können über ihre Felder verknüfpt werden. Dabei müssen die verknüpfenden Felder den gleichen Datentyp haben. Diese Felder werden als *Fremdschlüssel* (engl. *Foraign Key*) bezeichnet. 

Ein SQL-Schema definiert die einzelnen Elemente einer Datenbank. Das folgende Schema zeigt das Schema der [Beispieldatenbank](). 

```sql 
CREATE TABLE beispiel ( 
    name CHARACTER(255), -- TEXT-Feld mit fester Länge
    jahr INTEGER,
    studiengang VARYING CHARACTER(255), -- TEXT-Feld mit variabler Länge und Obergrenze
    PRIMARY KEY (name, jahr) -- Primärschlüssel aus mehreren Feldern
);

CREATE TABLE dozierende (
    name TEXT, -- TEXT-Feld mit variabler Länge ohne Obergrenze
    kuerzel CHARACTER(4) PRIMARY KEY -- TEXT-Feld als alleiniger Primärschlüssel
);

CREATE TABLE moduldozierende (
    modul_name CHARACTER(255),
    jahr INTEGER,
    kuerzel CHARACTER(4),
    FOREIGN KEY (kuerzel) REFERENCES dozierende (kuerzel), -- Fremdschlüssel für die Dozierenden
    FOREIGN KEY (modul_name, jahr) REFERENCES  beispiel (name, jahr) -- Fremdschlüssel für die Module
 );
```

<p class="alert alert-success">
Aus einem SQL-Schema gehen die Namen und Datentypen für die verschiedenen Datenfelder hervor. Ausserdem lässt sich aus einem SQL-Schema ablesen, welche Daten miteinander verknüpft sind. 
</p>

Aus einem Datenbank-Schema lässt sich nicht ablesen, falls nur bestimmte Werte zugelassen sind oder wie die Werte zu interpretieren sind.
