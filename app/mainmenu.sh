#!/bin/bash

src_file="init.txt"
dst_file="status.txt"

cp "$src_file" "$dst_file"

solA() {
    bash probA.sh
}

solB() {
    bash probB.sh
}

solC() {
    bash probC.sh
}

status() {
    sh trail.sh
}

file="instruction.txt"
content=$(cat "$file")

# Collect the YAD options
cmd=(
    yad --center --borders=20
    --title="Main_Menu"
    --text="$content"
    --button="problem-A":"bash -c solA" --height=50 --width=200
    --button="problem-B":"bash -c solB" --height=50 --width=200
    --button="problem-C":"bash -c solC" --height=50 --width=200
    --button="status":"bash -c status" --height=50 --width=200
    --button="Exit"
)

# Export the announce function
export -f solA
export -f solB
export -f solC
export -f status

# Run the YAD command
"${cmd[@]}"

# Unset the announce function
unset solA
unset solB
unset solC
unset status
