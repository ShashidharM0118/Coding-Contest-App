#!/bin/bash


language=$(yad --form --field="Select Language:CB" "C!C++" --button="OK:0" --button="Cancel:1" --width=300 --height=100)

if [ $? -eq 0 ]; then
  selected_language=$(echo "$language" | awk -F"|" '{print $1}')

codes=$(yad --form \
      --field="Your Code:TXT" \
      --title="Problem-A Solution" \
      --button="OK:0" \
      --button="Cancel:1" \
      --width=800 \
      --height=600 | 
         sed 's/\\n/\n/g')
         
echo "$codes"
  if [ $? -eq 0 ]; then
    if [ "$selected_language" = "C" ]; then
      echo "${codes%?}" > "solc.c"  
      echo gcc solc.c
    elif [ "$selected_language" = "C++" ]; then
      echo "${codes%?}" > "sol1.cpp"  
      g++ sol1.cpp
    else
      echo "Invalid language selected."
      exit 1
    fi

    flag=false
    for i in $(seq 1 5); do
      input="input${i}.txt"
      output="output${i}.txt"
      answer="ans${i}.txt"

      ./a.out < "sol1/inputs/$input" > "sol1/outputs/$output"
      if diff -q "sol1/outputs/$output" "sol1/answers/$answer" > /dev/null; then
        yad --title="Test Result" --text="Test $i passed " --button="OK:0" --width=200 --height=200
      else
        yad --title="Test Result" --text="Test $i failed " --button="OK:0" --width=200 --height=200
        flag=true
        break
      fi
    done

    if [ "$flag" = false ]; then
      echo "problem A : Accepted" >> status.txt
    fi
  else
    echo "User pressed Cancel in the code entry form."
  fi
else
  echo "User pressed Cancel in the language selection form."
fi
