#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <file_path> <public/private>"
    exit 1
fi

file_path=$1
visibility=$2

# Read GitHub token from an environment variable
github_token="$GITHUB_TOKEN"

if [ -z "$github_token" ]; then
    echo "Error: GitHub token not set. Set the GITHUB_TOKEN environment variable."
    exit 1
fi

case $visibility in
    public)
        public_arg=true
        visibility_message="public"
        ;;
    private)
        public_arg=false
        visibility_message="private"
        ;;
    *)
        echo "Error: Invalid visibility argument. Use 'public' or 'private'."
        exit 1
        ;;
esac

response=$(curl -s -H "Authorization: token $github_token" \
    -d "{\"public\": $public_arg, \"files\": {\"$(basename "$file_path")\": {\"content\": \"$(cat "$file_path")\"}}}" \
    https://api.github.com/gists)

if [ -z "$(echo "$response" | jq -r .id)" ]; then
    error_message=$(echo "$response" | jq -r .message)
    echo "Error creating Gist: $error_message"
    exit 1
fi

gist_url=$(echo "$response" | jq -r .html_url)
echo "File uploaded to $visibility_message Gist: $gist_url"

