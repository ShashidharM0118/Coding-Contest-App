#!/bin/bash

src_file="init.txt"
dst_file="status.txt"

cp "$src_file" "$dst_file"

solA() {
    sh solA.sh
}
status() {
    sh trail.sh
}
file="instruction.txt"
content=$(cat "$file")


# Collect the YAD options
cmd=(
    yad --center --borders=20
    --title="YAD Custom Dialog Buttons"
    --text="$content"
    --buttons="OK:0"
    --button="status":"bash -c status"
    --button="problem-A":"bash -c solA"
    --button="Exit"
)

# Export the announce function
export -f solA
export -f status

# Run the YAD command
"${cmd[@]}"

# Unset the announce function
unset solA
unset status