
source_folder=$1

# Check if the source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Error: The specified source folder does not exist."
    exit 1
fi

# Move all files from subdirectories to the current directory
find "$source_folder" -mindepth 2 -type f -exec mv {} "$source_folder" \;

echo "Files moved back to the current directory."