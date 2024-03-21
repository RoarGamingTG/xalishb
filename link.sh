#!/bin/bash

# Function to open requested link
open_requested_link() {
    echo "Enter the link you want to open:"
    read requested_link
    echo "Opening the requested link: $requested_link"
    termux-open-url "$requested_link"
}

# Call the function to open requested link
open_requested_link

# Loop to ask for more links and open them
while true
do
    echo "Do you want to open more links? (yes/no)"
    read choice
    if [ "$choice" = "yes" ]; then
        open_requested_link
    else
        break
    fi
done
