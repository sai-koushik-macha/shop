#!/usr/bin/env bash

checkfun(){
    column -t -s' ' tmpbill.txt
    read -r
    echo
}

costfun(){
    read -rs quantity
    cost=$(grep "$item" stock.txt | awk '{print $2}')
    echo "$item $cost $quantity $((cost * quantity))" >> tmpbill.txt
    totalAmount=$((totalAmount+(cost * quantity)))
}

showbillfun(){
    column -t -s' ' tmpbill.txt
    rm tmpbill.txt
    echo
    echo
    echo "Total Amount  = $totalAmount"
}

savebillfun(){
    directory=$(date +%d%m%Y)
    time=$(date +%H%M%S)
    if [[ -d ./billing/$directory ]];
    then
        echo
    else
        mkdir "./billing/$directory"
    fi
    { column -t -s' ' tmpbill.txt; echo; echo; echo "Total Amount = $totalAmount"; } >> "./billing/$directory/$time.txt"
}

touch tmpbill.txt
echo "Items MRP Quantity Total" >> tmpbill.txt
echo >> tmpbill.txt
totalAmount=0
while :
do
    item=$(awk '{print $1}' stock.txt | fzf)
    if [ "$item" = "exit" ]
    then
        break
    elif [ "$item" = "check" ]
    then
        checkfun
    else
        costfun
    fi
done

savebillfun
showbillfun
