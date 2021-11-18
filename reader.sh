#!/bin/bash

while getopts f: opt; do
    case $opt in
        f) SRC=$OPTARG ;;
    esac
done

if [ -z $SRC ]; then
    SRC=source.txt
fi
NAME=$(echo "$SRC" | cut -d"." -f1)
if [ -e $NAME-pphr.txt ]; then
    echo -e "\nWarning: $NAME-pphr.txt already exists.\nAny paraphrased text will be appended to EOF.\nRename source text to avoid this behavior.\n"
fi
TEXT=`cat $SRC`

IFS="." # BUG: obviously doesn't work when decimals etc are involved
read -ra SENTS <<< "$TEXT" # BUG: stops reading if there are line breaks
LEN=${#SENTS[@]}
echo "Reading $LEN total sentences from $SRC..."
echo "[h] help"

pphr=""
i=0
while [ $i -lt $LEN ]; do
    read option
    case $option in
        "") 
            echo -e "\n${SENTS[i]}.\n"
            ((i++))
            ;;
        [123456789]*) 
            for ((j=i;j<i+option;j++)); do
                echo -e "\n${SENTS[j]}.\n"
            done
            ((i+=option)) 
            ;;
        p) 
            read -p "$SRC:$i ~> " pinput
            pphr+="$pinput "
            # echo -e "$i:'$pinput'" >> pphr.json TODO
            ;;
        # c) TODO copy selection as-is to paraphrased text
        # a) TODO add sentence to selection
        n) echo "($i/$LEN)" ;;
        z) let i=LEN ;;
        h) echo -e "\n- [return] present 1 (interpreted) sentence\n- present [1-9] sentence(s)\n- [p] input paraphrased text\n- [n] get index of current sentence\n- [z] exit\n" ;;
        *) echo "Invalid option." ;;
    esac
done

echo "($i/$LEN) Finished reading."
if [ ! -z $pphr ]; then
    echo $pphr >> $NAME-pphr.txt
    echo "Paraphrased text added to $NAME-pphr.txt."
fi