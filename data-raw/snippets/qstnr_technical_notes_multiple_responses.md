### `Mehrfachnennungen`

Die Spalte `Mehrfachnennungen` gibt an, ob es den Befragten möglich ist, mehrere der `Antwortoptionen` gleichzeitig auszuwählen. Obschon versucht wurde, dies
tunlichst zu vermeiden, hat sich bei einigen Fragen ein solches Vorgehen als die praktikabelste Lösung herausgestellt. Die Spalte `Mehrfachnennungen` kennt die
beiden folgenden Werte:

-   **ja**: Mehrfachnennungen sind möglich und werden in der Analyse anteilsmässig gewichtet. Wählt eine Respondent:in also bspw. drei Antwortoptionen zugleich
    aus, wird jede davon zu einem Drittel gezählt, entscheidet sie sich hingegen nur für eine Antwortoption, zählt diese voll.

    Die Konvention zur Kodierung gewollter Mehrfachnennungen lautet, dass `#` einzelne Variablen benannt nach dem Schema `<VARIABLENNAME>_d#` statt der einen
    ursprünglichen Variable gemäss diesem Fragebogen resultieren, wobei `#` der Anzahl offerierter Antwortoptionen entspricht.

    **Beispiel:**

    Im Falle, dass `main_motive_cantonal_proposal_1_yes` Mehrfachnennungen erlaubt und insgesamt vier Antwortoptionen kennt, resultieren dementsprechend die
    folgenden vier dichotomen Variablen:

    1.  `main_motive_cantonal_proposal_1_yes_d1`: Weist die Ausprägung `1` auf im Falle, dass die 1. Antwortoption gewählt wurde, andernfalls `0`.
    2.  `main_motive_cantonal_proposal_1_yes_d2`: Weist die Ausprägung `1` auf im Falle, dass die 2. Antwortoption gewählt wurde, andernfalls `0`.
    3.  `main_motive_cantonal_proposal_1_yes_d3`: Weist die Ausprägung `1` auf im Falle, dass die 3. Antwortoption gewählt wurde, andernfalls `0`.
    4.  `main_motive_cantonal_proposal_1_yes_d4`: Weist die Ausprägung `1` auf im Falle, dass die 4. Antwortoption gewählt wurde, andernfalls `0`.

    (Im Falle, dass eine der Antwortoptionen von `main_motive_cantonal_proposal_1_yes_custom` ein [Freitextfeld](#freitextfelder) (Ausprägung `90`) vorsieht,
    resultiert zusätzlich noch die Variable `main_motive_cantonal_proposal_1_yes_custom`.)

-   **nein**: Mehrfachnennungen sind nicht vorgesehen und den Online-Respondenten auch technisch verunmöglicht. Sollten im Print-Fragebogen Mehrfachnennungen
    auftreten, wird in der Analyse auf reproduzierbare, *pseudo-zufällige* Weise (via Pseudozufallszahlengenerator [PCG64](https://www.pcg-random.org/)) eine
    der Nennungen ausgewählt.

    Während beim Online-Fragebogen ungewollte Mehrfachnennungen technisch verunmöglicht werden, lässt sich eine solche Einschränkung im Print-Fragebogen
    naturgemäss nicht durchsetzen. Dies hat im Falle ungewollter Mehrfachnennungen zur Folge, dass mehrere Variablen aus dieser Frage resultieren, deren genaue
    Anzahl (zumindest der nicht-leeren) allerdings nicht vorausgesagt werden kann (Maximum = Anzahl `Antwortoptionen`).

    Die Konvention lautet, dass der ursprünglichen Variable gemäss diesem Fragebogen bei Mehrfachnennungen der Wert `-8` zugewiesen wird und die zusätzlichen
    Variablen mit den konkreten Doppelnennungen nach dem Schema `<VARIABLENNAME>_d#` benannt werden.

    **Beispiel:**

    Bei einer maximalen Zahl von drei ungewollten Mehrfachnennungen in `employment_situation` resultieren dementsprechend die folgenden vier Variablen:

    1.  `employment_situation`: Weist im Falle einer Mehrfachnennung die Ausprägung `-8` auf, andernfalls die "normale" Ausprägung gemäss diesem Fragebogen.
    2.  `employment_situation_d1`: Weist im Falle einer Mehrfachnennung die Ausprägung der ersten gewählten `Antwortoption` auf, andernfalls keinen Wert (`NA`).
    3.  `employment_situation_d2`: Weist im Falle einer Mehrfachnennung die Ausprägung der zweiten gewählten `Antwortoption` auf, andernfalls keinen Wert
        (`NA`).
    4.  `employment_situation_d3`: Weist im Falle einer Mehrfachnennung die Ausprägung der dritten gewählten `Antwortoption` auf, andernfalls keinen Wert
        (`NA`).
