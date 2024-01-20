source_folder=$1

# Check if the source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Error: The specified source folder does not exist."
    exit 1
fi

# move to same location
organized_folder=$1
mkdir -p "$organized_folder"

# Loop through files in the source folder
for file in "$source_folder"/*; do
    if [ -f "$file" ]; then
        # Extract the initial letter from the file name
        initial_letter=$(basename "$file" | cut -c1 | tr '[:upper:]' '[:lower:]')

        # Create a new folder for the initial letter if it doesn't exist
        mkdir -p "$organized_folder/$initial_letter"

        # Move the file to the corresponding folder
        mv "$file" "$organized_folder/$initial_letter/"
    fi
done

echo "Files moved successfully to '$organized_folder'."