#!/bin/sh

# Define the file to display
file="status.txt"

# Collect the YAD options
cmd='yad --center --borders=20 --title="YAD Display File" --button="Close":0'

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File not found: $file"
    exit 1
fi

# Display the file contents in the YAD window
yad "$cmd" --text="$(cat "$file")"