Excel verwendet zwei Symbole, um die Arbeitsweise einer Zelle zu verändern. Diese Symbole sehen für uns wie Operatoren aus, sind aber streng genommen *Pseudooperatoren* bzw. *syntaktische Dekorationen*. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Dekorator** bezeichnet Symbole oder Schlüsselwörter einer Programmiersprache, die das Verhalten der Programmiersprache für einen bestimmten Kontext anpassen. 
</p>

Neben regulären Operatoren werden in EXCEL zwei Symbole gelegentlich als Operatoren oder als **Dekoratoren** verwendet. Die Symbole signalisieren EXCEL, dass der Code in einer Zelle eine abweichende Bedeutung hat. Weil diese Symbole die Funktion von EXCEL steuern, werden sie gelegentlich auch als *Pseudo-Operatoren* bezeichnet. Diese Operatoren sind notwendig, weil EXCEL im Gegensatz zu R Werte und Code bei der Eingabe nicht unterscheidet. 

<p class="alert alert-success" markdown="1">
Die beiden Pseudo-Operatoren sind `=` (Gleich) und `'` (einfaches Anführungszeichen). Sie verhalten sich nur als *Dekoratoren*, wenn sie das **erste** Symbol in einer Zelle sind. In diesem Fall dürfen auch **keine** Leerzeichen vor dem Symbol stehen. 
</p>

Die Position der Dekoratoren als erstes Symbol in einer Zelle hat eine besondere Bedeutung für EXCEL. Um diese Bedeutung der Inhalte einer Zelle EXCEL zu signalisieren, müssen wir diese Dekoratoren dem Inhalt voranstellen. Solche Ergänzungen sind Teil der *Syntax* einer Programmiersprache. Die Dekoratoren sind also Teil der Programmiersprache von EXCEL und wir bezeichnen sie deshalb als *syntaktische Dekoratoren*.

<p class="alert alert-warning" markdown="1">
Wir können die beiden Dekoratoren nicht gemeinsam verwenden. 
</p>

Fehlt ein Dekorator, dann nimmt EXCEL an, dass die Zelle einen Wert enthält. 

### Der `=`-Dekorator

Der `=`-Dekorator signalisiert EXCEL, dass in dieser Zelle eine Formel steht. Danach **muss** eine gültige "Formel" folgen. 

<p class="alert alert-warning" markdown="1">
Das Gleich-Symbol hat in einer Formel eine andere Bedeutung als der Dekorator. Diese beiden Verwendungen dürfen Sie nicht verwechseln.
</p>

### Der `'`-Dekorator

Der `'`-Dekorator signalisiert EXCEL, dass in dieser Zelle eine Zeichenkette steht. Dieser Dekorator wird zwingend gebraucht, wenn unsere Werte am Anfang ein Gleichheitszeichen oder ein einfaches Anführungszeichen haben, da ansonsten der Wert von EXCEL falsch interpretiert wird. 

Wir benötigen diesen Dekorator auch, um bei der manuellen Eingabe zu verhindern, dass EXCEL Werte automatisch konvertiert. Das ist immer notwendig, wenn unsere Werte wie ein Datum, eine Zahl oder eine Uhrzeit aussehen können aber als Zeichenkette behandelt werden sollen. Eine automatische Konvertierung ist in solchen Fällen problematisch, weil EXCEL Datumsangaben und Uhrzeiten intern als Zahlenwerte behandelt, die sich von der gleich aussehenden Zeichenkette unterscheiden. 
