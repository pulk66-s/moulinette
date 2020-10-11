#!/usr/bin/env bash

cd code;

echo ""
echo "--------------------"
echo "Commencement du scan"
echo "--------------------"
echo ""

for fich in $(find -type f);
do
    if [ ${fich: -2} != ".c" ]
    then
        if [ ${fich: -2} != ".h" ]
        then
            echo $fich "have a bad extension"
        fi
    fi
done

echo ""
echo "--------------------------"
echo "Lancement de la moulinette"
echo "--------------------------"

for fich in $(find -type f)
do
    if [ ${fich: -2} == ".c" ]
    then
        echo ""
        echo "====>${fich: 2}"
        echo ""
        cd ../moulinette
        ruby mouli.rb "../code/${fich: 2}"
        cd ../code
    fi
done
