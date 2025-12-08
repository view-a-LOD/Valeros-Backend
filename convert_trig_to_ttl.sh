#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_or_file>"
    exit 1
fi

INPUT="$1"

convert_trig() {
    local trig_file="$1"
    base_name=$(basename "$trig_file" .trig)
    
    output_file="${trig_file%.trig}.ttl"
    
    riot --merge --output=ttl "$trig_file" > "$output_file"
    
    echo "Converted '$trig_file' to '$output_file'"
}

if [ -d "$INPUT" ]; then
    find "$INPUT" -type f -name '*.trig' | while read -r trig_file; do
        convert_trig "$trig_file"
    done
elif [ -f "$INPUT" ] && [[ "$INPUT" == *.trig ]]; then
    convert_trig "$INPUT"
else
    echo "Error: '$INPUT' is not a valid directory or .trig file."
    exit 1
fi
