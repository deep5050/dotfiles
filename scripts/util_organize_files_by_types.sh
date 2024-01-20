input_folder=$1

# Check if the input folder exists
if [ ! -d "$input_folder" ]; then
    echo "Error: The specified folder does not exist."
    exit 1
fi

# move to same folder
organized_folder=$1
mkdir -p "$organized_folder"

# Organize files based on their extensions
for file in "$input_folder"/*; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        destination_folder="$organized_folder/$extension"

        # Create a new folder for the extension if it doesn't exist
        mkdir -p "$destination_folder"

        # Move the file to the destination folder
        mv "$file" "$destination_folder/"
    fi
done

echo "Files organized successfully in '$organized_folder'."