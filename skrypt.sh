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
else
    echo "Nie rozpoznano flagi $key"
fi

shift
done