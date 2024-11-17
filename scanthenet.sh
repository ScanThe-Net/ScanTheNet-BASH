#!/bin/bash

API_URL="https://api.scanthe.net/"
MAX_ENTRIES_DEFAULT=100

print_logo() {
    echo -e "\n  _______                    _______ __           ____ __         __"
    echo -e " |     __|.----.---.-.----- |_     _|  |--.-----.|    |  |.-----.|  |_"
    echo -e " |__     ||  __|  _  |     |  |   | |     |  -__||       ||  -__||   _|"
    echo -e " |_______||____|___._|__|__|  |___| |__|__|_____||__|____||_____||____|\n"
}

fetch_data() {
    response=$(curl -s "$API_URL")

    # Check if the response is valid JSON
    if ! echo "$response" | jq empty > /dev/null 2>&1; then
        echo "Error: Response is not valid JSON."
        echo "$response"
        exit 1
    fi

    # Check if the expected key 'data' exists and it is an array
    if ! echo "$response" | jq -e '.data | type == "array"' > /dev/null; then
        echo "Error: 'data' key not found or is not an array in JSON response."
        echo "$response"
        exit 1
    fi

    echo "$response" | jq -c '.data[]'
}

# Main script starts here
print_logo

max_entries=${1:-$MAX_ENTRIES_DEFAULT}

if ! [[ "$max_entries" =~ ^[0-9]+$ ]] || [ "$max_entries" -lt 1 ] || [ "$max_entries" -gt 100 ]; then
    echo "Please enter a number between 1 and 100."
    exit 1
fi

# Fetch the data
data=$(fetch_data)

# Display the relevant parts of the JSON
echo "$data" | head -n "$max_entries" | jq -r '{id, timestamp, source_ip, source_port, dest_port, data} | "\(.id)\nTimestamp: \(.timestamp)\nSource IP: \(.source_ip)\nSource Port: \(.source_port)\nDestination Port: \(.dest_port)\nData: \(.data)\n----------"'
