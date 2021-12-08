#!/bin/sh
date="$1"
number_of_genomes="$2"
re='^[0-9]+$'
reDate='^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
if [[ $date =~ $reDate ]] && [[ $number_of_genomes =~ $re ]]; then
    echo "Updating the database with the new date and number of genomes"
    echo "date=$date"
    echo "number_of_genomes=$number_of_genomes"
    cd /srv/hostseq/hostseq-variants-discovery-server/db
    sqlite3 registry.db "UPDATE dataset SET description = 'Last Updated: $date; Genomes Included: $number_of_genomes' WHERE name = 'HOSTSEQ';"
elif ! [[ $number_of_genomes =~ $re ]] && ! [[ $date =~ $reDate ]];
then
    echo "Error: Neither the date nor the number are valid. The date should be in format YYYY-mm-dd and the number should be an integer"
elif ! [[ $number_of_genomes =~ $re ]]; then
    echo "Error: Number of genomes was not an integer" >&2; exit 1
elif ! [[ $date =~ $reDate ]]; then
    echo $isDate
    echo "Error: Improper date format please folllow YYYY-mm-dd"
fi

