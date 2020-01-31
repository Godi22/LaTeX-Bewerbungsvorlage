REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Dieses Skript Kompiliert/Erstellt das Bewerbungsschreiben in Windows
REM 
REM Damit dieses Skript richtig funktioniert muss der relative Pfad zur Hauptdatei (Bewerbung.tex) angegeben werden
REM Es kann auch der Pfad und der Name für das generierte PDF angegeben werden.
REM 
REM Autor: Gottfried Schrittwieser
REM Lizenzhinweis: Siehe License.txt im Wurzelverzeichnis
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

REM Aktueller Pfad in dem das Skript liegt
set pathFile=%~dp0
set currPath=%pathFile:~0,-1%\




REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Einstellungen für die Pfade
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

REM Pfadangabe zur Hauptdatei (Bewerbung.tex); Der relative Pfad bezieht sich auf den Ordner in dem das Skript liegt
set pfadZurMain=..\..\LaTeX\


REM Alle weiteren relativen Pfadangaben beziehen sich auf den LaTeX / Main Ordner
REM Pfadangabe zum Root-Ordner
set pfadRoot=..\

REM Pfadangabe zum Inhalt
REM Absoluter Pfad funktioniert leider nicht (Leerzeichen, Sonderzeichen und Laufwerksbuchstabe beißen sich mit Latex)
set pfadInhalt=%pfadRoot%InhaltTest\

REM Pfadangabe zum Anschreiben
REM Durch Angabe diesen Pfades kann das Skriptfile in den Ordner zum Anschreiben kopiert werden und dort direkt das PDF generiert werden.
REM Der Pfad in der Datei PfadeInhalt muss dann nicht angepasst werden und kann dadurch gleich bleiben.
set pfadAnschreiben=%pfadInhalt%MusterFirma\
REM Wird der Pfad nicht angegeben so wird der Pfad aus der Datei PfadeInhalt verwendet.
REM set pfadAnschreiben=""

REM Pfadangabe wohin das generierte PDF kopiert werden soll.
set pfadPDF=%pfadAnschreiben%

REM Name für das generierte PDF
set namePDF=Max_Musterfrau_Bewerbung.pdf


REM build Ordner (hier befinden sich die Dateien die LaTeX generiert)
REM Im Anschreiben Ordner
REM set pfadBuild=%pfadAnschreiben%build\
REM Im Main Ordner 
set pfadBuild=build\


REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Erstellen des PDFs
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


REM Ersetze \ durch / in pfadInhalt
set pfadInhaltLatex=%pfadInhalt:\=/%
set pfadAnschreibenLatex=%pfadAnschreiben:\=/%


REM Erstelle Latex Kommandos
set pfadInhaltExt="\newcommand{\pfadInhaltExt}{%pfadInhaltLatex%}"

IF NOT %pfadAnschreibenLatex%=="" (
	set pfadAnschreibenExt="\newcommand{\pfadAnschreibenExt}{%pfadAnschreibenLatex%}"
) ELSE (
	set pfadAnschreibenExt=""
)

REM Erstelle PDF
cd %pfadZurMain%
mkdir %pfadBuild%

REM führe pdflatex 2mal aus wenn aux nicht existiert, somit wird Seitenanzahl gleich richtig dargestellt.
if NOT exist %pfadBuild%Bewerbung.aux pdflatex %pfadInhaltExt% %pfadAnschreibenExt% -output-directory %pfadBuild% \input Bewerbung.tex

REM führe pdflatex aus
pdflatex %pfadInhaltExt% %pfadAnschreibenExt% -output-directory %pfadBuild% \input Bewerbung.tex

REM Kopiere PDF in angegebenen Ordner
copy %pfadBuild%Bewerbung.pdf %pfadPDF%%namePDF%

PAUSE
