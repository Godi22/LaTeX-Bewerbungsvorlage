# LaTeX-Bewerbungsvorlage
Dies ist eine durchgängige LaTeX-Bewerbungsvorlage auf Basis des ModernCV style und der Bewerbung von [Stefanqn](https://github.com/Stefanqn/Bewerbung).

Diese Vorlage bietet viele Einstellungsmöglichkeiten zur Anpassung des Designs. Ein Muster kann [hier](https://github.com/Godi22/LaTeX-Bewerbungsvorlage/blob/master/InhaltTest/Beispiel_pdf/Max_Musterfrau_Bewerbung.pdf) angesehen werden.

## Kaffeespende
Da ich einiges an Zeit in dieses Projekt investiert habe und du dir bei der Verwendung der Vorlage einiges an Zeit ersparst bitte ich um eine [Kaffeespende](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=gottfried%40schrittwieser%2enet&lc=AT&item_name=Bewerbungsvorlage%20by%20godi&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest).


## Kompilieren der Bewerbungsunterlagen
Grundlegend können die Bewerbungsunterlagen auf zwei Arten kompiliert werden:
1. Durch Ausführen des Batch/Bash Skript Bewerbung.bat (Windows) bzw Bewerbung.sh (Ubuntu) welche in dem InhaltTest Ordner hinterlegt sind.
2. Durch öffnen von der Main Datei Bewerbung bzw. Bewerbung_komplett im LaTeX Ordner mit z.B. Texmaker und pdfLaTeX in der graphische Benutzeroberfläche ausführen.
Diese Vorgehensweise ist aber nicht komfortable, da die Pfade zum Inhalt und dem Anschreiben jedesmal in den cfg/sty (LaTeX/Projektpfade.sty und PfadeInhalt.cfg) Files geändert oder der Inhalt/Anschreiben pro Firma ausgetauscht werden müsste.


## Anlegen einer neuen Bewerbung
Zum Erstellen einer neuen Bewerbung kann der Inhalt des Ordner InhaltTest herangezogen werden. Im folgenden werden die Punkte beschrieben welche nötig sind um eine Bewerbung mit dem Batch/Bash Skript zu erstellen.

#### Folgende Punkte sollten durchgeführt werden:
1. Ordner InhaltTest kopieren und ausserhalb des Bewerbungsvorlage-Ordners mit dem Name Inhalt, oder auch anderen Namen, einfügen. Den Subordner MusterFirma in den realen Firmennamen umbenennen.
2. Pfad zum Inhalt und Anschreiben (Firmenname) in dem Batch/Bash Script anpassen. Ebenfalls kann der Name für das generierte pdf geändert werden. Somit können mehrere Firmen Ordner leicht angelegt werden, da zu jeder ein eigenes Skript existiert.
3. Bewerbung.sh bzw .bat ausführen. Wenn dies ohne Fehler durchläuft dann wird eine .pdf Datei in dem angegebenen Pfad für das Anschreiben/Firma erstellt.
4. Datei PersonenbezogeneDaten.tex anpassen. => Personalisiert die Bewerbung.
5. Im Ordner Dateien die Unterschrift, Foto und Anlagen einfügen. Die Dateinamen sollten kein Leerzeichen oder Sonderzeichen beinhalten.
6. Datei Anlagen.tex anpassen.
7. Datei Lebenslauf.tex anpassen. Mit dem Kommando \enclRef{Dateiname}{Sonstiger Text} kann eine Referenz auf die Anlage gesetzt werden.
	Weitere Befehle sind dem Test-Lebenslauf zu entnehmen.
8. Dateien im Ordner Anschreiben laut Vorlage anpassen.
9. Die Einstellungen in der Datei Einstellungen.sty anpassen. Genaueres ist in der Test Datei beschrieben. Es kann eine globale Einstellungen.sty Datei angelegt werden welche sich im Ordner Inhalt befindet bzw auch pro Anschreiben/Firma eine erstellt werden. Die Einstellungen.sty im Anschreiben/Firmenordner wird beforzugt geladen. Wenn dies nicht existiert, dann wird auf die vom Inhalt zurückgegriffen.
10. Neu kompilieren mit dem Skript Bewerbung.sh bzw .bat.
11. Eventuell noch das Deckblatt anpassen falls gewünscht und neu kompilieren.

Dies ist nur eine grobe Übersicht über die Punkte die erledigt werden müssen. Ab Punkt 3 kann die Reihenfolge beliebig ausgeführt werden. 
Jedoch sollte Punkt 3 bzw 10 öfters durchgeführt werden, damit Fehler schnell erkannt werden, und dadurch die Fehlersuche nicht zu kompliziert wird.


## Ordnerstruktur
### InhaltTest
In diesem Ordner befinden sich alle Dateien die sich bei einer Bewerbung verändern / ändern können. Dieser beinhaltet Testdaten die nicht verändert werden sollten, sondern als Vorlage dienen. Ebenfalls beinhaltet dieser Ordner den Subordner MusterFirma als Vorlage für das Anschreiben. Dieser Ordner kann dann beliebig kopiert werden und an den echten Firmennamen angepasst werden.
### LaTeX
Im LaTeX bzw. Main Ordner befinden sich die Hauptdateien Bewerbung.tex und Bewerbung_komplett.tex. Diese können kompiliert werden. Weiters befindet sich die Datei Projektpfade.sty, die die relevanten Pfade für das Projekt beinhaltet. Ebenfalls beinhaltet dieser Ordner den Unterordner Vorlagen indem sich die LaTeX sty Files für die einzelnen Module (Anschreiben, Lebenslauf, ...) befinden.
### Symbole
Dieser Ordner beinhaltet die Symbole für Adresse und Fax. Andere Symbole werden mit MarVoSym bzw fontawesome dargestellt.


## Version
* V1.1 Anlagenverzeichnis und externe Pfadvorgabe.
	* Zu Anlagenverzeichnis Titel/Überschriften hinzugefügt, so dass diese Gruppiert werden können.
	* Linkedin Link hinzugefügt.
	* Externe Pfadvorgabe für Inhalt implementiert und Skripte zum kompilieren erweitert.
	* Ordnerstruktur geändert für bessere Übersicht.
	* Bug in Fußzeile behoben (Schrift für Seitenanzahl wurde manchmal nicht richtig Positioniert).
* V1.0 Initial-Version
