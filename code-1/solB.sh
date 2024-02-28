#!/bin/bash


language=$(yad --form --field="Select Language:CB" "C!C++" --button="OK:0" --button="Cancel:1" --width=300 --height=100)

if [ $? -eq 0 ]; then
  selected_language=$(echo "$language" | awk -F"|" '{print $1}')

code=$(yad --form \
      --field="Your Code:TXT" \
      --title="Problem-B Solution" \
      --button="OK:0" \
      --button="Cancel:1" \
      --width=800 \
      --height=600 | 
         sed 's/\\n/\n/g')
         
echo "$code"
  if [ $? -eq 0 ]; then
    if [ "$selected_language" = "C" ]; then
      echo "${code%?}" > "solc.c"  
      echo gcc solc.c
    elif [ "$selected_language" = "C++" ]; then
      echo "${code%?}" > "sol2.cpp"  
      g++ sol2.cpp
    else
      echo "Invalid language selected."
      exit 1
    fi

    flag=false
    for i in $(seq 1 4); do
      input="input${i}.txt"
      output="output${i}.txt"
      answer="ans${i}.txt"

      ./a.out < "sol2/inputs/$input" > "sol2/answers/$answer"
      if diff -q "sol2/outputs/$output" "sol2/answers/$answer" > /dev/null; then
        yad --title="Test Result" --text="Test $i passed " --button="OK:0" --width=200 --height=200
      else
        yad --title="Test Result" --text="Test $i failed " --button="OK:0" --width=200 --height=200
        flag=true
        break
      fi
    done

    if [ "$flag" = false ]; then
      echo "problem B : Accepted " >> status.txt
    fi
  else
    echo "User pressed Cancel in the code entry form."
  fi
else
  echo "User pressed Cancel in the language selection form."
fi
