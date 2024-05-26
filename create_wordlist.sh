#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [options] <input_file>"
    echo
    echo "Options:"
    echo "  -h, --help    Display this help message"
    echo
    echo "Arguments:"
    echo "  input_file    Path to a text file containing URLs (one per line) to generate wordlists from"
    echo
    echo "Example:"
    echo "  $0 /path/to/urls.txt"
    echo
    echo "The input_file (e.g., urls.txt) should contain URLs, one per line:"
    echo "http://example.com"
    echo "https://another-example.com"
}

# Check if help option is provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if input file is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments"
    display_help
    exit 1
fi

# Assign variables
INPUT_FILE=$1

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File $INPUT_FILE not found"
    exit 1
fi

# Read the input file and process each URL
while IFS= read -r URL; do
    # Skip empty lines
    if [ -z "$URL" ]; then
        continue
    fi

    # Generate a filename based on the URL (sanitize the URL to create a valid filename)
    FILENAME=$(echo "$URL" | sed 's|http[s]*://||; s|/|_|g').txt

    # Run cewl to generate wordlist and save to output file
    cewl "$URL" -w "$FILENAME"

    # Check if cewl was successful
    if [ $? -eq 0 ]; then
        echo "Wordlist successfully created for $URL and saved to $FILENAME"
    else
        echo "Failed to create wordlist for $URL"
    fi
done < "$INPUT_FILE"

