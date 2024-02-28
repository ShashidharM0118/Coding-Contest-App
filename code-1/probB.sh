#!/bin/bash


submit() {
    sh solB.sh
}
file="sol2/probB.txt"
content=$(cat "$file")


# Collect the YAD options
cmd=(
    yad --center --borders=20 \
    --title="Problem-B" \
    --text="$content" \
    --editable \
    --wrap \
    --scroll \
    --buttons="OK:0" \
    --button="submit-code":"bash -c submit" \
    --button="Exit" \
)

export -f submit

# Run the YAD command
"${cmd[@]}"


unset submit