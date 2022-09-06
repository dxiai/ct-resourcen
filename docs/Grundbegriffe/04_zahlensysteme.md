### Zahlensysteme

<p class="alert alert-primary" markdown="1">
Als **Zahlensystem** wird die Schreibweise für Zahlenwerte bezeichnet. 
</p>

In der Regel verwenden wir das sog. Dezimalsystem, um Zahlen darzustellen. Das Dezimalsystem hat 10 mögliche Symbole um Zahlenwerte abzubilden. Diese Symboles sind `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9` und `0`. Damit können wir mit einem Symbol Zahlenwerte zwischen `0` und `9` abbilden. 

Gelegentlich lassen sich bestimmte Phänomene nicht gut im Dezimalsystem abbilden. Dadurch lassen sich Werte nur schwer interpretieren. In solchen Fällen hilft der Wechsel in ein anderes Zahlensystem.

<p class="alert alert-success" markdown="1">
**Merke:**  Durch den Wechsel des Zahlensystems ändert sich nur die Darstellung aber nicht der Wert einer Zahl! 
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Die Zahl, die als Grundlage für ein Zahlensystem dient,  wird als **Basis** des Zahlensystems bezeichnet. 
</p>

Beim in der Schulmathematik üblichen Dezimalsystem ist die Basis `10`.

<p class="alert alert-primary" markdown="1">
**Definition:** **Zahlensysteme** kodieren Zahlenwerte zu einer gegebenen Basis. 
</p>

### Die wichtigsten Zahlensysteme 

| Name | Basis | Symbole |
| :--- | :--- | :--- |
| Binärsystem | `2` | `0`, `1` |
| Octalsystem | `8` | `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7` |
| Dezimalsystem | `10` | `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9` |
| Duodezimalsystem | `12` | `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `A`, `B` |
| Hexadezimalsystem | `16` |  `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `A`, `B`, `C`, `D`, `E`, `F` |
| Sexagesimalsystem | `60` | - |

Das Duodezimalsystem und das Sexagesimalsystem treffen wir im Alltag bei Datums- und Zeitwerten, bei Winkeln sowie in der Musik an. Im Deutschen lässt sich das Duodezimalsystem noch an den Zahlworten elf (`11`) und zwölf (`12`) erkennen.

Das Binäre Zahlensystem stellt die Grundlage für digitale Computer dar, weil es nur zwei Werte für die Darstellung von Zahlen benötigt. D.h. alle Werte lassen sich als Vielfache von zweier-Potenzen abbilden. Claude Shannon hat bereits 1938 erkannt, dass diese Darstellung sich direkt die Zustände "ein" und "aus" von Schaltern übersetzen lässt, so dass sich alle Berechnungen mit Hilfe der [*Boolschen Algebra*]() mit einfachen Schaltungen realisieren lassen. Daraus ergibt sich, dass das kleinste Bit der Informationstheorie sich im Binären-Zahlensystem abbilden lässt. 

Die Zahlensysteme Octal und Hexadezimal sind für die Abbildung von Werten in Digitalcomputern von besonderer Bedeutung, weil es sich jeweils um ganzzahlige 2er Potenzen handelt. 

| Name | Basis | 2er-Potenz |
| :--- | :--- | :--- |
| Binär | `2` |\\(2^1\\)|
| Octal | `8` |\\(2^3\\)|
| Hexadezimal | `16` |\\(2^4\\)=\\(2^{2^2}\\)|

Der Exponent der 2er-Potenz der Basis zeigt an, wie viele Stellen im Binärsystem (Bits) mit dem jeweiligen System abgebildet werden können. Ein Byte bildet per Konvention zwei Stellen im Hexadezimalsystem oder 8 Bit ab. 

<p class="alert alert-success" markdown="1">
Hexadezimal-Werte werden recht häufig beim Programmieren verwendet, wie z.B. für das Kodieren von Buchstaben und Satzzeichen. Damit diese Werte leichter von Werten im Dezimalsystem unterscheiden werden können wird Werten im Hexadezimalsystem per Konvention die beiden Symbole `0x` vorangestellt
</p>

**Beispiele**

| Dezimal  | Hexadezimal |
| ---: | ---: |
| `0`  | `0x0` |
| `1` | `0x1` |
| `2` | `0x2` |
| `3` | `0x3` |
| `4` | `0x4` |
| `8` | `0x8` |
| `9` | `0x9` |
| `10` | `0xA` | 
| `15` | `0xF` | 
| `16` | `0x10` |

<p class="alert alert-warning" markdown="1">
**ACHTUNG!** EXCEL hält sich nicht an diese Konvention. Hexadezimalwerte werden direkt eingegeben und müssen anschliessend in Zahlenwerte mit der Funktion `HEXINDEZ()` konvertiert werden. 
</p>

### 2er-Potenzen und Speichergrössen

Nach diesem Prinzip werden auch die Kapazitäten von Datenspeichern als 2er-Potenzen beschrieben.

| Name | Abkürzung | gespeicherte Byte |
| :--- | :--- | :--- |
| Byte | B |\\(2^0 = 1\\)|
| Kilobyte | KB |\\(2^{10} = 1024^1\\)|
| Megabyte | MB |\\(2^{20} = 1024^2 = 1048576\\)|
| Gigabyte | GB |\\(2^{30} = 1024^3 = 1073741824\\)|
| Terabyte | TB |\\(2^{40} = 1024^4 = 1099511627776\\)|


<p class="alert alert-warning" markdown="1">
Die *wissenschaftliche Schreibweise* ist **kein eigenes Zahlensystem**.  Sie ist nur eine *Vereinheitlichung* der Schreibweise im Dezimalsystem, um sehr grosse und/oder sehr kleine Zahlen kompakt darstellen zu können. 
</p>

### Winkelangaben als irrationales Zahlensystem

Winkelangaben werden oft als Vielfache von\\(\pi\\)angegeben. Diese Werte werden auch als *Radiant* anstatt als Grad bezeichnet. Dabei handelt es sich um ein Zahlensystem zur Basis\\(\pi\\).

-\\(\frac{\pi}{6}\\) = 30°
-\\(\frac{\pi}{4}\\) = 45°
-\\(\frac{\pi}{3}\\) = 60°
-\\(\frac{\pi}{2}\\)= 90°
-\\(\frac{2\pi}{3}\\)= 120°
-\\(\pi\\)= 180° 
-\\(\frac{3\pi}{2}\\)= 270°
-\\(2\pi\\)= 360°

### Prinzip eines Zahlensystems

Die in der Mathematik verwendeten Zahlensysteme sind sog. *additive Zahlensysteme*. Die Schreibweise wird durch Addition und Multiplikation mit der jeweiligen Basis bestimmt. 

Das Zählen funktioniert dabei wie folgt: 

1. Es wird bei `0` gestartet. 
2. Die nächste Ganzzahl wird durch Addition mit `1` erreicht. 
3. Es wird das nächste Ziffernsymbol ausgewählt. 
4. Gibt es für die jeweilige Basis keine Ziffernsymbole für die Ganzzahl mehr, wird die nächst höhere Stelle um `1` erhöht. 

**Beispiele**

| Dezimal | Binär | Octal | Hexadezimal |
| ---: | ---: | ---: | ---: |
| `0` | `0` | `0` | `0x0` |
| `1` | `1` | `1` | `0x1` |
| `2` | `10` | `2` | `0x2` |
| `3` | `11` | `3` | `0x3` |
| `4` | `100` | `4` | `0x4` |
| `8` | `1000` | `10` | `0x8` |
| `9` | `1001` | `11` | `0x9` |
| `10` | `1010` | `12` | `0xA` | 
| `15` | `1111` | `17` | `0xF` | 
| `16` | `10000` | `100` | `0x10` |
| `255` | `11111111` | `377` | `0xFF` |
| `256` | `100000000` | `400` | `0x100` |
