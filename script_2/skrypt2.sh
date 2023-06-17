#!/bin/bash

COMMAND=0
KATALOG="$HOME"
UZYTKOWNIK_COMMAND=""
MIN_COMMAND=""
MAX_COMMAND=""
ZAWARTOSC_COMMAND=""

while [ $COMMAND -ne 8 ];do
	echo "1. Nazwa pliku: $NAZWA
2. Katalog: $KATALOG
3. Uzytkownik: $UZYTKOWNIK
4. Minimalny rozmiar: $MIN
5. Maksymalny rozmiar: $MAX
6. Zawartosc pliku: $ZAWARTOSC
7. Szukaj
8. Koniec

Wybierz opcje:"

	read COMMAND

	if [ $COMMAND -eq 1 ]
	then
		echo -n "Podaj nazwe: "
		read NAZWA
	elif [ $COMMAND -eq 2 ]
	then
		echo -n "Podaj katalog: "
		read KATALOG
	elif [ $COMMAND -eq 3 ]
	then
		echo -n "Podaj uzytkownika: "
		read UZYTKOWNIK
		UZYTKOWNIK_COMMAND="-user $UZYTKOWNIK"
	elif [ $COMMAND -eq 4 ]
	then
		echo -n "Podaj minimalny rozmiar pliku (size+k/M/G): "
		read MIN
		MIN_COMMAND="-size +$MIN"
	elif [ $COMMAND -eq 5 ]
	then
		echo -n "Podaj maksymalny rozmiar pliku (size+k/M/G): "
		read MAX;
		MAX_COMMAND="-size -$MAX"
	elif [ $COMMAND -eq 6 ]
	then
		echo -n "Podaj zawartosc pliku: "
		read ZAWARTOSC
		ZAWARTOSC_COMMAND="-exec grep -l -i $ZAWARTOSC {} +"
	elif [ $COMMAND -eq 7 ]
	then
		echo
		find $KATALOG -type f -iname "*$NAZWA*" $UZYTKOWNIK_COMMAND $MIN_COMMAND $MAX_COMMAND $ZAWARTOSC_COMMAND
		echo
	elif [ $COMMAND -eq 8 ]
	then
		echo -n "Koniec programu"
		echo
	fi
done

