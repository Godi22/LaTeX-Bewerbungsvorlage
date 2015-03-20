#!/bin/bash

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Dieses Skript Kompiliert/Erstellt das Bewerbungsschreiben in Windows
#
# Damit dieses Skript richtig funktioniert muss der relative Pfad zur Hauptdatei (Bewerbung.tex) angegeben werden
# Es kann auch der Pfad und der Name für das generierte PDF angegeben werden.
#
# Autor: Gottfried Schrittwieser
# Lizenzhinweis: Siehe License.txt im Wurzelverzeichnis
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Aktueller Pfad in dem das Skript liegt
currPath=$PWD


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Einstellungen für die Pfade
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Pfadangabe zur Hauptdatei (Bewerbung.tex); Der relative Pfad bezieht sich auf den Ordner in dem das Skript liegt
pfadZurMain=../Main/


# Alle weiteren relativen Pfadangaben beziehen sich auf den Main Ordner

# Pfadangabe zum Inhalt
# pfadInhalt=$currPath 
# Absoluter Pfad funktioniert leider nicht (Leerzeichen, Sonderzeichen und Laufwerksbuchstabe beißen sich mit Latex)
pfadInhalt=../InhaltTest/

# Pfadangabe und Name des generierten PDF's
pfadUndNamePDF=${pfadInhalt}Max_Musterfrau_Bewerbung.pdf

# build Ordner
pfadBuild=build/



# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Erstellen des PDFs
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Erstelle PDF
cd $pfadZurMain
mkdir $pfadBuild
# pdflatex command


# führe pdflatex 2mal aus wenn aux nicht existiert, somit wird Seitenanzahl gleich richtig dargestellt.
if [ ! -f ${pfadBuild}Bewerbung.aux ]; then
    pdflatex -output-directory $pfadBuild '\newcommand{\pfadInhaltExt}{'${pfadInhalt}'} \input Bewerbung.tex'
fi
# führe pdflatex aus
pdflatex -output-directory $pfadBuild '\newcommand{\pfadInhaltExt}{'${pfadInhalt}'} \input Bewerbung.tex'
cp ${pfadBuild}Bewerbung.pdf $pfadUndNamePDF
