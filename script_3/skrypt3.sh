#!/bin/bash

KATALOG="$HOME"
UZYTKOWNIK_COMMAND=""
MIN_COMMAND=""
MAX_COMMAND=""
ZAWARTOSC_COMMAND=""


while [ "$INPUT" != "Koniec" ];
do
	INPUT="$(zenity --width=400 --height=500 --list --column "" --title="MENU" "Podaj nazwe: $NAZWA" "Podaj katalog: $KATALOG" "Podaj uzytkownika: $UZYTKOWNIK" "Podaj minimalny rozmiar pliku (size+k/M/G): $MIN" "Podaj maksymalny rozmiar pliku (size+k/M/G): $MAX" "Podaj zawartosc pliku: $ZAWARTOSC" "Szukaj" "Koniec")"
	case "${INPUT}" in
		"Podaj nazwe: $NAZWA"*)NAZWA=`zenity --entry --title "NAZWA" --text "Podaj nazwe pliku: "`;;
		"Podaj katalog: $KATALOG"*)KATALOG=`zenity --entry --title "KATALOG" --text "Podaj katalog: "`;;
		"Podaj uzytkownika: $UZYTKOWNIK"*)UZYTKOWNIK=`zenity --entry --title "UZYTKOWNK" --text "Podaj uzytkownika: "` UZYTKOWNIK_COMMAND="-user $UZYTKOWNIK";;
		"Podaj minimalny rozmiar pliku (size+k/M/G): $MIN"*)MIN=`zenity --entry --title "MINIMALNA" --text "Podaj minimalny rozmiar pliku (size+k/M/G): "` MIN_COMMAND="-size +$MIN";;
		"Podaj maksymalny rozmiar pliku (size+k/M/G): $MAX"*)MAX=`zenity --entry --title "MAKSYMALNA" --text "Podaj maksymalny rozmiar pliku (size+k/M/G): "` MAX_COMMAND="-size -$MAX";;
		"Podaj zawartosc pliku: $ZAWARTOSC"*)ZAWARTOSC=`zenity --entry --title "ZAWARTOSC" --text "Podaj zawartosc pliku: "` ZAWARTOSC_COMMAND="-exec grep -l -i $ZAWARTOSC {} +";;
		"Szukaj"*)PLIK=$(zenity --width=500 --height=700  --list --title "Lista plikow: " --column="Pliki" $(find $KATALOG -type f -iname "*$NAZWA*" $UZYTKOWNIK_COMMAND $MIN_COMMAND $MAX_COMMAND $ZAWARTOSC_COMMAND));;
	esac
done

