#!/bin/bash

# Input file
INPUT_FILE="dev_inspired.csv"

# Output files
FIXED_FILE="id_developer.csv"
INSPIRED_FILE="od_developer.csv"
NON_FIXED_FILE="rest_developer.csv"

# Use awk to classify based on column E (case-insensitive full match)
awk -F, 'NR==1 {
    print > "'$FIXED_FILE'"
    print > "'$INSPIRED_FILE'"
    print > "'$NON_FIXED_FILE'"
    next
}
{
    col = tolower($5)
    if (col == "id")
        print > "'$FIXED_FILE'"
    else if (col == "od")
        print > "'$INSPIRED_FILE'"
    else
        print > "'$NON_FIXED_FILE'"
}' "$INPUT_FILE"

