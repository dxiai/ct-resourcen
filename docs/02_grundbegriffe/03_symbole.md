## Symbole und Kompression

Das zentrale Element von Shannon's Informationstheorie sind *Nachrichten*, die aus Symbolen bestehen. Entsprechend trägt jedes Symbol zur Information einer Nachricht (`N`) bei. Shannon versteht unter dem Begriff *Symbol* sowohl Zahlen, Buchstaben, Worte als auch Wortfolgen. Dabei lassen sich Wortfolgen in mehrere Worte und Worte in Buchstaben aufteilen. 

<p class="alert alert-primary" markdown="1">
Ein Symbol, das nicht in einfachere Symbole unterteilt werden kann, wird als (Informations-) *Bit* bezeichnet.
</p>

Sich wiederholende Bits oder Bitfolgen können abgekürzt werden, indem die Bitfolge nur einmal zusammen mit Anzahl der Wiederholungen angegeben wird. 

<p class="alert alert-primary" markdown="1">
Das Abkürzen einer Bitfolge wird als **Kompression** bezeichnet.
</p>

Veranschaulichen wir uns das mit Hilfe der Nachricht `"aaaaaaaaaa"`. Diese Bitfolge kann als `[a]`$^10$ abgekürzt werden. 

Der Exponent zeigt uns, wie stark eine Bitfolge komprimiert wurde. 

Mit diesem Wissen können wir die Nachricht `"ababababab"` komprimieren. Die Kompression ist in diesem Fall `[ab]`$^5$. 

Dieses Spiel können wir weiter treiben: Die Nachricht `"aber aber "` lässt sich als `[aber ]`$^2$ und die Nachricht `"aber hallo"` lässt sich als `[aber hallo]`$^1$ komprimieren.

Der *Kompressionsgrad* (`K`) ergibt sich aus der Länge der ursprünglichen Nachricht `l(N)` und der Kompression `k`: 

$$
K = \frac{k}{l(N)}
$$

In unserem Beispiel haben alle Nachrichten die Länge `10`. 

Daraus ergeben sich die folgenden Kompressionsgrade: 

| Nachricht | Kompressionsgrad |
| :--- | :--- |
| `"aaaaaaaaaa"` | 1 |
| `"ababababab"` | .5 |
| `"aber aber "` | .2 |
| `"aber hallo"` | .1 |

Die Kompressionsgrade stehen im umgekehrten Verhältnis zum Informationsgehalt ($I_g$) einer Nachricht. Es gilt also: 

$$
I_g = \frac{1}{K} = \frac{l(N)}{k}
$$

<p class="alert alert-success" markdown="1">
**Merke:** Je stärker eine Nachricht komprimiert werden kann, desto weniger Information enthält sie. 
</p>

<p class="alert alert-primary" markdown="1">
Eine Nachricht mit dem Kompressionsgrad `1` wird als *informationslos* bezeichnet. Sie enthält also *keine* Information.
</p>
