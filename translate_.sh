#!/bin/bash

en2zh(){
    input=$1
    curl -s -X POST 'https://api-free.deepl.com/v2/translate' \
        -H 'Authorization: DeepL-Auth-Key xxxxxxxxxxxxxxxx' \
        -d "text=${input}" \
        -d "target_lang=ZH" 
    echo
}

zh2en(){
    input=$1
    curl -X POST 'https://api-free.deepl.com/v2/translate' \
        -H 'Authorization: DeepL-Auth-Key xxxxxxxxxxxxxx' \
        -d "text=${input}" \
        -d "target_lang=EN"
    echo
}

main(){
    echo "================Welcome to Deepl Translator================"
    echo ""
    mode=0
    echo "mode: EN to CN, press C to switch"
    cmd=''
    while true
    do 
        echo ""
        echo "-----------------------------------------------------------"
        echo ""
        read -re input

        if [ -z "$input" ]
        then 
            continue
        fi

        if [ "$input" = "c" ]
        then 
            mode=$(($mode == 1?0:1))
            if [ $mode -eq 1 ]
            then 
                echo "switch mode: CN to EN"
            else    
                echo "switch mode: EN to CN"
            fi
            continue
        fi

        if [ $mode -eq 1 ]
        then 
            zh2en "$input"
        else
            en2zh "$input"
        fi
    done
}

main
