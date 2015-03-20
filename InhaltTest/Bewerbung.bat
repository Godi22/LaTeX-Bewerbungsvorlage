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
set pfadZurMain=..\Main\


REM Alle weiteren relativen Pfadangaben beziehen sich auf den Main Ordner

REM Pfadangabe zum Inhalt
REM set pfadInhalt=%currPath% 
REM Absoluter Pfad funktioniert leider nicht (Leerzeichen, Sonderzeichen und Laufwerksbuchstabe beißen sich mit Latex)
set pfadInhalt=..\InhaltTest\

REM Pfadangabe und Name des generierten PDF's
set pfadUndNamePDF="%pfadInhalt%Max_Musterfrau_Bewerbung.pdf"

REM build Ordner
set pfadBuild=build\




REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REM Erstellen des PDFs
REM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

REM Ersetze \ durch / in pfadInhalt
set pfadInhaltLatex=%pfadInhalt:\=/%

REM Erstelle PDF
cd %pfadZurMain%
mkdir %pfadBuild%
REM führe pdflatex 2mal aus wenn aux nicht existiert, somit wird Seitenanzahl gleich richtig dargestellt.
if NOT exist %pfadBuild%Bewerbung.aux pdflatex \newcommand{\pfadInhaltExt}{%pfadInhaltLatex%} \input Bewerbung.tex -output-directory %pfadBuild%
REM führe pdflatex aus
pdflatex \newcommand{\pfadInhaltExt}{%pfadInhaltLatex%} \input Bewerbung.tex -output-directory %pfadBuild%
copy %pfadBuild%Bewerbung.pdf %pfadUndNamePDF%
