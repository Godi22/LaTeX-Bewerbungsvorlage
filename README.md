# LaTeX-Bewerbungsvorlage
Dies ist eine durchgängige LaTeX-Bewerbungsvorlage auf Basis des ModernCV style.

## Kaffeespende
Da ich einiges an Zeit in dieses Projekt investiert habe und du dir bei der Verwendung der Vorlage einiges an Zeit ersparst bitte ich um eine [Kaffeespende](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=gottfried%40schrittwieser%2enet&lc=AT&item_name=Bewerbungsvorlage%20by%20godi&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest).


## Anlegen einer neuen Bewerbung
Zum Erstellen einer neuen Bewerbung kann der Inhalt des Ordner InhaltTest herangezogen werden.
##### Folgende Punkte sollten durchgeführt werden:
1. Ordner InhaltTest kopieren und ausserhalb des Projektordners mit dem Name Inhalt einfügen. Es kann auch ein anderer Name vergeben werden, jedoch muss dann der Pfad in der Datei Main/Projektpfade.sty angepasst werden, oder es wird das Batch/Bash Skript mit korrigiertem Pfad verwendet.
2. Wenn gewünscht Pfade in der Datei PfadeInhalt.sty anpassen. Wird das Skript Bewerbung.bat (Windows) bzw Bewerbung.sh (Ubuntu) zum kompilieren verwendet, dann muss in dieser ebenfalls der Pfad angepasst werden.
3. Bewerbung.sh bzw .bat ausführen. Wenn dies ohne Fehler durchläuft dann wird eine .pdf Datei in dem angegebenen Pfad erstellt.
4. Datei PersonenbezogeneDaten.tex anpassen. => Personalisiert die Bewerbung.
5. Im Ordner Dateien die Unterschrift, Foto und Anlagen einfügen. Die Dateinamen sollten kein Leerzeichen oder Sonderzeichen beinhalten.
6. Datei Anlagen.tex anpassen.
7. Datei Lebenslauf.tex anpassen. Mit dem Kommando \enclRef{Dateiname}{Sonstiger Text} kann eine Referenz auf die Anlage gesetzt werden.
	Weitere Befehle sind dem Test-Lebenslauf zu entnehmen.
8. Dateien im Ordner Anschreiben laut Vorlage anpassen.
9. Die Einstellungen in der Datei Einstellungen.sty anpassen. Genaueres ist in der Test Datei beschrieben.
10. Kompilieren mit beliebigen Programm oder den Skript Bewerbung.sh bzw .bat.
11. Eventuell noch das Deckblatt anpassen.

Dies ist nur eine grobe Übersicht über die Punkte die erledigt werden müssen. Ab Punkt 3 kann die Reihenfolge beliebig ausgeführt werden. 
Jedoch sollte Punkt 3 bzw 10 öfters durchgeführt werden, damit Fehler schnell erkannt werden, und dadurch die Fehlersuche nicht zu kompliziert wird.


## Ordnerstruktur
### InhaltTest
In diesem Ordner befinden sich alle Dateien die sich bei einer Bewerbung verändern / ändern können. Dieser beinhaltet Testdaten die nicht verändert werden sollten, sondern als Vorlage dienen.
### Main
Im Main Ordner befinden sich die Hauptdateien Bewerbung.tex und Bewerbung_komplett.tex. Diese können kompiliert werden. Weiters befindet sich die Datei Projektpfade.sty, die die relevanten Pfade für das Projekt beinhaltet.
### Vorlagen
In diesem Ordner befinden sich die Vorlagen für das Projekt.
### Symbole
Dieser Ordner beinhaltet die Symbole für Adresse und Fax. Andere Symbole werden mit MarVoSym dargestellt.
