#!/bin/bash

# Shell scripts for buttons (without quotes)
script1="echo 'Button 1 clicked'"
script2="echo 'Button 2 clicked'"
script3="echo 'Button 3 clicked'"

while true; do
    yad --form --title="Dynamic Buttons" --width=400 --height=200 \
        --field="Button 1":BTN \
        --button="Run Script 1; $script1":1 \
        --field="Button 2":BTN \
        --button="Run Script 2; $script2":2 \
        --field="Button 3":BTN \
        --button="Run Script 3; $script3":3 \
        --button="Close":0 \
        --sticky

    # Exit status check (no change required)
    if [ $? -eq 0 ]; then
        echo "YAD closed by user"
        break
    fi
done
