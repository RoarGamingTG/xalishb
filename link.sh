#!/bin/bash

# Set your Telegram bot token here
BOT_TOKEN="6411955618:AAHTetQOYj6HsHOSWsaD4dGQ3t2UPQ7wLCk"

# Function to open requested link
open_requested_link() {
    echo "Enter the link you want to open:"
    read requested_link
    echo "Opening the requested link: $requested_link"
    termux-open-url "$requested_link"
}

# Function to send message through Telegram bot
send_telegram_message() {
    message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d "chat_id=$CHAT_ID&text=$message"
}

# Function to check if the message contains a link
contains_link() {
    message="$1"
    if [[ $message == *"http"* ]]; then
        return 0
    else
        return 1
    fi
}

# Get the chat ID of your Telegram account
echo "Enter your Telegram chat ID:"
read CHAT_ID

# Loop to ask for more links and send them through the Telegram bot
while true
do
    open_requested_link
    echo "Do you want to send more links through the bot? (yes/no)"
    read choice
    if [ "$choice" != "yes" ]; then
        break
    fi
done
