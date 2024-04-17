#!/bin/bash

CACHE_FILE="$HOME/scripts/vpn_list.txt"

# Function to retrieve and cache the list of IP addresses
cache_ip_list() {
    sudo tailscale exit-node list | awk 'NR>1 {print $1, $3",", $4}' > "$CACHE_FILE"
}

# Function to display menu and select IP
select_ip() {
    if [[ ! -f "$CACHE_FILE" ]]; then
        echo "Cache file not found. Please run the cache_ip_list function first."
        exit 1
    fi

    echo "Select an IP address to connect to:"
    local i=1
    while IFS= read -r line; do
        ip=$(echo "$line" | awk '{print $1}')
        country=$(echo "$line" | awk '{$1=""; print $0}' | xargs)
        echo "$i) $ip ($country)"
        ((i++))
    done < "$CACHE_FILE"

    read -p "Enter the number of the IP address you want to connect to: " choice_num

    # Check if the entered number is within range
    num_lines=$(wc -l < "$CACHE_FILE")
    if ! [[ "$choice_num" =~ ^[0-9]+$ ]] || ((choice_num < 1 || choice_num > num_lines)); then
        echo "Invalid choice. Please enter a valid number."
        exit 1
    fi

    # Get the corresponding IP address based on the selected number
    choice_ip=$(awk "NR==$choice_num {print \$1}" "$CACHE_FILE")

    sudo tailscale up --exit-node="$choice_ip" --exit-node-allow-lan-access
}

# Uncomment the line below to cache the list of IP addresses
# cache_ip_list

# Call the function to select IP
select_ip
