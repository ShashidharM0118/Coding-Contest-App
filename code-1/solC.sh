#!/bin/bash

language=$(yad --form --field="Select Language:CB" "C!C++" --button="OK:0" --button="Cancel:1" --width=300 --height=100)

if [ $? -eq 0 ]; then
  selected_language=$(echo "$language" | awk -F"|" '{print $1}')

  codes=$(yad --form \
        --field="Your Code:TXT" \
        --title="Problem-C Solution" \
        --button="OK:0" \
        --button="Cancel:1" \
        --width=800 \
        --height=600 | 
           sed 's/\\n/\n/g')

  if [ $? -eq 0 ]; then
    if [ "$selected_language" = "C" ]; then
      echo "${codes%?}" > "solc.c"  
      gcc solc.c
    elif [ "$selected_language" = "C++" ]; then
      echo "${codes%?}" > "sol3.cpp"  
      g++ sol3.cpp
    else
      echo "Invalid language selected."
      exit 1
    fi

    # Check if the executable file is generated
    if [ ! -f "a.out" ]; then
      yad --title="Compilation Error" --text="Compilation failed. Please check your code." --button="OK:0" --width=300 --height=200
      exit 1
    fi

    flag=false
    for i in $(seq 1 5); do
      input="input${i}.txt"
      output="ouput${i}.txt"
      answer="ans${i}.txt"

      ./a.out < "sol3/inputs/$input" > "sol3/ouputs/$output"
      if diff -q "sol3/ouputs/$output" "sol3/answers/$answer" > /dev/null; then
        yad --title="Test Result" --text="Test $i passed " --button="OK:0" --width=200 --height=200
        truncate -s 0 "sol3/ouputs/$output"
      else
        yad --title="Test Result" --text="Test $i failed " --button="OK:0" --width=200 --height=200
        flag=true
        break
      fi
    done

    if [ "$flag" = false ]; then
      echo "problem C : Accepted " >> status.txt
    fi

    # Delete the a.out file
    rm a.out
    
  else
    echo "User pressed Cancel in the code entry form."
  fi
else
  echo "User pressed Cancel in the language selection form."
fi
