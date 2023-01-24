#!/bin/bash
allSheets=("char-detail" "char-talent" "char-constelation" "char-talent-materials" "char-ascension-materials" "weapon")

function download_csv() {
    wget -c "https://docs.google.com/spreadsheets/d/198cJTJHQRMxH5iY3prqMT1VqQlXEFzMKd1BTuDITdyw/gviz/tq?tqx=out:csv&sheet=$1" -O csv/$1.csv
}

function main() {
    rm csv/*.*
    for i in ${!allSheets[@]}; do
        download_csv ${allSheets[$i]}
    done
}

function create_table() {
    for i in ${!allSheets[@]}; do
        tableName=${allSheets[$i]//-/_}
        echo "Importing table ${tableName}"
        sqlite3 genshin.db <<EOF
.mode csv
drop table IF EXISTS ${tableName};
.import csv/${allSheets[$i]}.csv ${tableName}
select count(1) from ${tableName};
EOF
    done
    echo "delete"
    rm ../assets/genshin.db
    echo "copy"
    cp genshin.db ../assets
}

main
create_table
