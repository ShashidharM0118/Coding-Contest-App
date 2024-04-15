#!/bin/bash


submit() {
    sh solA.sh
}
file="sol1/probA.txt"
content=$(cat "$file")


# Collect the YAD options
cmd=(
    yad --center --borders=20 \
    --title="Problem-A" \
    --text="$content" \
    --editable \
    --wrap \
    --scroll \
    --buttons="OK:0" \
    --button="submit-code":"bash -c submit" \
    --button="Exit" \
)

# Export the announce function
export -f solA
export -f submit

# Run the YAD command
"${cmd[@]}"

# Unset the announce function
unset solA
unset submit