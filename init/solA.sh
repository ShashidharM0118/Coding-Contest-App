#!/bin/bash

value=$(yad --form --field="Text field:TXT" --title="Text input" --button="GTK-OK:0" --button="GTK-Cancel:1" --width=800 --height=600)

if [ $? -eq 0 ]; then
    echo "${value%?}" > sol1.cpp
    g++ sol1.cpp
    
for i in $(seq 1 5); do
        input="input${i}.txt"
        output="output${i}.txt"
        answer="ans${i}.txt"  

        ./a.out < "sol1/inputs/$input" > "sol1/outputs/$output"
        if diff -q "sol1/outputs/$output" "sol1/answers/$answer" > /dev/null ; then
            yad --title="Test Result" --text="Test $i passed " --button="OK:0" --width=200 --height=200
        else
            yad --title="Test Result" --text="Test $i failed " --button="OK:0" --width=200 --height=200
            break
        fi
       
    done 
     echo "" > status.txt
    echo "Current Status :" >> status.txt
    echo "problem A : Accepted" >> status.txt
    echo "problem B : Not Accepted " >> status.txt
    echo "problem C : Not Accepted " >> status.txt

else
    echo "User pressed Cancel"
fi
