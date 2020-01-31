#!/bin/bash

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Dieses Skript Kompiliert/Erstellt das Bewerbungsschreiben in Ubuntu
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
pfadZurMain=../../LaTeX/

# Alle weiteren relativen Pfadangaben beziehen sich auf den LaTeX / Main Ordner
# Pfadangabe zum Root-Ordner
pfadRoot=../

# Pfadangabe zum Inhalt
pfadInhalt=${pfadRoot}InhaltTest/

# Pfadangabe zum Anschreiben
# Durch Angabe diesen Pfades kann das Skriptfile in den Ordner zum Anschreiben kopiert werden und dort direkt das PDF generiert werden.
# Der Pfad in der Datei PfadeInhalt muss dann nicht angepasst werden und kann dadurch gleich bleiben.
pfadAnschreiben=${pfadRoot}InhaltTest/MusterFirma/
#pfadAnschreiben='' # Wird der Pfad nicht angegeben so wird der Pfad aus der Datei PfadeInhalt verwendet.


# Pfadangabe für das generierte PDF
pfadPDF='' # Pfad wohin das generierte PDF kopiert werden soll. Wird kein Pfad angegeben so wird der Pfad pfadAnschreiben verwendet. Ist pfadAnschreiben ebenfalls nicht angegeben dann wird der Pfad des Inhaltes verwendet.

# Name für das generierte PDF
namePDF=Max_Musterfrau_Bewerbung.pdf


# build Ordner (hier befinden sich die Dateien die LaTeX generiert)
#pfadBuild=${pfadAnschreiben}build/ # Im Anschreiben Ordner
pfadBuild=build/ # Im Main Ordner


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Erstellen des PDFs
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Erstelle Latex Kommandos
pfadInhaltExt='\newcommand{\pfadInhaltExt}{'${pfadInhalt}'}'

if [ -n "$pfadAnschreiben" ]; then
	pfadAnschreibenExt='\newcommand{\pfadAnschreibenExt}{'${pfadAnschreiben}'}'	
else
    	pfadAnschreibenExt=''	
fi


# Erstelle PDF
cd $pfadZurMain
mkdir $pfadBuild
# pdflatex command


# führe pdflatex 2mal aus wenn aux nicht existiert, somit wird Seitenanzahl gleich richtig dargestellt.
if [ ! -f ${pfadBuild}Bewerbung.aux ]; then
    pdflatex -output-directory $pfadBuild  $pfadInhaltExt $pfadAnschreibenExt ' \input Bewerbung.tex'
fi
# führe pdflatex aus
pdflatex -output-directory $pfadBuild  $pfadInhaltExt $pfadAnschreibenExt ' \input Bewerbung.tex'

# Kopiere PDF in angegebenen Ordner
if [ -n "$pfadAnschreiben" ]; then	
	pfadUndNamePDF=${pfadAnschreiben}${namePDF}
else
    	pfadInhalt=$(cat "${pfadBuild}Bewerbung.pfadInhalt")
	pfadUndNamePDF=${pfadInhalt}${namePDF}
fi

if [ -n "$pfadPDF" ]; then	
	pfadUndNamePDF=${pfadPDF}${namePDF}
fi

cp ${pfadBuild}Bewerbung.pdf $pfadUndNamePDF
