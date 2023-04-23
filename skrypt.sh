#!/bin/bash

if [[ $1 == "--logs" && "$2" =~ ^[0-9]+$ && "$2" -ge 0 && "$2" -le 50 && ${2:+true} ]]; then
    for ((i=1; i<=$2; i++)); do
        nazwa_pliku="plik$i.txt"
        touch "$nazwa_pliku"
        echo "ten plik został stowrzony przez skrypt o nazwie 'skrypt.sh'" >> "$nazwa_pliku"          
        echo "ten plik nazywa sie $nazwa_pliku" >> "$nazwa_pliku"
        echo "jest on plikiem numer $i" >> "$nazwa_pliku"
        echo "dzisiajsza data to $(date +%Y-%m-%d)" >>"$nazwa_pliku"
    
    done
    exit 0
fi

touch .gitignore
    echo "*log*" >> ".gitignore"
#-------------------------------
while [[ $# -gt 0 ]]
do 
key="$1"
if [[ "$key" == "--date" || "$key" == "-d" ]]; then 
    case $key in 
        --date|-d)
        date=$(date +%Y-%m-%d)
        echo "Dzisiejsza data to $date"
        shift
        ;;
        *)
        echo "Nieznana flaga $key"
        exit 1
        ;;
    esac
#---------------------------------
elif [[ "$key" == "--logs" || "$key" == "-l" ]];then
for i in {1..100}
do
    nazwa_pliku="plik$i.txt"
    touch "$nazwa_pliku"
    echo "ten plik został stowrzony przez skrypt o nazwie 'skrypt.sh'" >> "$nazwa_pliku"          
    echo "ten plik nazywa sie $nazwa_pliku" >> "$nazwa_pliku"
    echo "jest on plikiem numer $i" >> "$nazwa_pliku"
    echo "dzisiajsza data to $(date +%Y-%m-%d)" >>"$nazwa_pliku"
done   
#---------------------------------
elif [[ "$key" = "--help" || "$key" == "-h" ]]; then
    echo "komenda '--date' wyświetla dzisiejsza date "
    echo "komenda '--logs' tworzy 100 plików tekstowych i w kazdym podana jest nazwa tego skryptu, data, numer pliku oraz jego nazwa "
    echo "komenda '--logs __' robi właściwie to samo co '--logs', ale można wybrać parametr określający ilosc stworzonych plików  "
    echo "Nie wiem o co dokładnie chodzi, ale dodaję nowe informacje do komendy 'help' "
    echo "Nie siadaj na słoik, bo może pęknąć"
    echo "kiedy winda zacznie spadać najlepiej jest się położyc"
    exit 0 

else
    echo "Nie rozpoznano flagi $key"
fi

shift
done