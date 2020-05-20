# recht Plugin for ZSH

Erlaubt das schnelle Anzeigen von deutschen Rechtstexten bereitgestellt durch gesetze-im-internet.de. Gesetzestexte werden lokal gespeichert und können dann ohne Internetverbindung erneut aufgerufen werden.

**EN**: This ZSH plugin targets German users only because the used service targets German users only.

## Repository Klon

Das originale Repository wird auf [GitHub](https://github.com/Zocker1999NET/zsh-recht) gespeichert,
von welchem natürlich das Plugin für die Verwendung in ZSH heruntergeladen werden kann.
Issues und Pull Requests werden auf GitHub für alle gesammelt.

Das Repository wird auf meinen eigenen Server geklont,
von welchem dieses auch gerne geklont werden kann (siehe [Klon](https://git.banananet.work/zsh-plugins/recht)).

## Installation

### Benötigte Drittprogramme

- `curl`

### zsh (ohne Plugin Manager)

1. Projekt klonen
2. Folgende Zeile zur `.zshrc` hinzufügen:
```sh
SOURCE "path/to/repo/recht.plugin.zsh"
```

### oh-my-zsh

1. Projekt nach `~/.oh-my-zsh/custom/plugins/recht` klonen
2. `recht` zur Pluginliste hinzufügen
```sh
plugins=(… recht …)
```

### Antigen

1. Folgende Zeile zur `.zshrc` hinzufügen:
```sh
antigen bundle Zocker1999NET/zsh-recht # GitHub if default repository unchanged
antigen bundle https://git.banananet.work/zsh-plugins/recht # Own Server
```

or

1. Repository zur Pluginliste hinzufügen
```sh
antigen bundles <<EOBUNDLES
  …
  Zocker1999NET/zsh-recht # GitHub if default repository unchanged
  https://git.banananet.work/zsh-plugins/recht # Own Server
  …
EOBUNDLES
```

### Antibody

1. Folgende Zeile zur `.zshrc` hinzufügen:
```sh
antibody bundle Zocker1999NET/zsh-recht # GitHub if default repository unchanged
antibody bundle https://git.banananet.work/zsh-plugins/recht # Own Server
```

or

1. Repository zur Pluginliste hinzufügen
```sh
antibody bundles <<EOBUNDLES
  …
  Zocker1999NET/zsh-recht # GitHub if default repository unchanged
  https://git.banananet.work/zsh-plugins/recht # Own Server
  …
EOBUNDLES
```

## Konfiguration

- `ZSH_PLUGIN_RECHT_DOCS_DIR`: Der Ordner, in welchem die Gesetze gespeichert werden, `<GESETZ-ABK>.pdf` benannt, standardmäßig in `~/.zsh-recht-docs`
- `ZSH_PLUGIN_RECHT_DOC_VIEWER`: Das Programm, in welchem der Gesetzestext geöffnet werden soll, standardmäßig `xdg-open` (also Standardviewer durch Desktopumgebung gegeben)

Zusätzlich sind folgende Werte konfigurierbar für seltene Ausnahmefälle:
- `ZSH_PLUGIN_RECHT_SERVER_URL`: Die URL des Servers, welche die Rechtsdokumente bereitstellt. Diese müssen in einem ähnlichen Format wie `gesetze-im-internet.de` bereitgestellt werden, daher ist der Standardwert `https://www.gesetze-im-internet.de`

## Verwendung

```sh
recht <GESETZ-ABK>
```
Dabei muss *GESETZ-ABK* die offizielle Abkürzung des Namen des Gesetzes sein.
Die Groß-/Kleinschreibung muss die der offiziellen Abkürzung entsprechen.

Wird dem Gesetz eine Jahreszahl angehängt (Bsp: [BSV 1999](https://www.gesetze-im-internet.de/bsv_1999/)), so muss diese Jahreszahl mit einen Unterstrich `_` (vgl. URL zum Gesetz) angehängt werden, hier also `recht BSV_1999`.

Gab es ein Gesetz bereits in mehreren Neu-Fassungen (siehe [BSIG](https://www.gesetze-im-internet.de/bsig_2009/)),
wird manchmal auf dem Server die Jahreszahl beim Namen des Ordners,
jedoch nicht beim Name der PDF (somit auch nicht Teil der Abkürzung des Gesetzes),
angehängt (URL zur PDF: [`/bsig_2009/BSIG.pdf`](https://www.gesetze-im-internet.de/bsig_2009/BSIG.pdf)).
Bei solchen Fällen muss das Gesetz entweder manuell heruntergeladen und im Ordner abgelegt werden,
oder, wenn einem die PDF URL bekannt ist,
kann diese verwendet werden: `recht bsig_2009/BSIG`.
Nach dem Herunterladen kann die heruntergeladene PDF Datei durch beide Befehlsvarianten ohne Internetverbindung angezeigt werden:
```sh
recht bsig_2009/BSIG # ist eine BSIG.pdf vorhanden, wird diese bevorzugt
recht BSIG # nur, wenn BSIG.pdf vorhanden
```

## Lizenz

Das Plugin ist lizensiert unter der WTFPL.
Es darf frei verwendet, bearbeitet und verbreitet werden.
Es wird gerne gesehen, dass Verbesserungen am Plugin wieder zurück zu diesem Repository finden.

## Verbesserungen

Wer einen Bugfix oder eine Verbesserung betragen möchte,
einfach einen Pull Request erstellen.
Code bitte auf Englisch kommentieren.
