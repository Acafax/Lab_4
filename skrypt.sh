#!/bin/bash

touch .gitignore
    echo "*log*" >> ".gitignore"

while [[ $# -gt 0 ]]
do 
key="$1"
if [ "$key" == "--date" ]; then
    case $key in 
        --date)
        date=$(date +%Y-%m-%d)
        echo "Dzisiejsza data to $date"
        shift
        ;;
        *)
        echo "Nieznana flaga $key"
        exit 1
        ;;
    esac
elif [ "$key" == "--logs" ];then
    
for i in {1..100}
do
    nazwa_pliku="file$i.txt"
    touch "$nazwa_pliku"
    echo "ten plik został stowrzony przez skrypt o nazwie 'skrypt.sh'" >> "$nazwa_pliku"          
    echo "ten plik nazywa sie $nazwa_pliku" >> "$nazwa_pliku"
    echo "jest on plikiem numer $i" >> "$nazwa_pliku"
    echo "dzisiajsza data to $(date +%Y-%m-%d)" >>"$nazwa_pliku"
done   

else
    echo "Nie rozpoznano flagi $key"
fi

shift
done