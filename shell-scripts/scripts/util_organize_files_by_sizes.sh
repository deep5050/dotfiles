source_folder=$1

# Check if the source folder exists
if [ ! -d "$source_folder" ]; then
    echo "Error: The specified source folder does not exist."
    exit 1
fi

# Create new folders for different size ranges
less_than_1mb_folder="1MB"
less_than_10mb_folder="10MB"
between_10mb_and_100mb_folder="100MB"
greater_than_100mb_folder="BIGFILES"

mkdir -p "$less_than_1mb_folder"
mkdir -p "$less_than_10mb_folder"
mkdir -p "$between_10mb_and_100mb_folder"
mkdir -p "$greater_than_100mb_folder"

# Loop through files in the source folder
for file in "$source_folder"/*; do
    if [ -f "$file" ]; then
        # Get the file size in megabytes
        size_mb=$(du -m "$file" | cut -f1)

        # Move the file to the corresponding folder based on size range
        if [ "$size_mb" -lt 1 ]; then
            mv "$file" "$less_than_1mb_folder/"
        elif [ "$size_mb" -ge 1 ] && [ "$size_mb" -lt 10 ]; then
            mv $"$file" "$less_than_10mb_folder"
        elif [ "$size_mb" -ge 10 ] && [ "$size_mb" -lt 100 ]; then
            mv "$file" "$between_10mb_and_100mb_folder/"
        elif [ "$size_mb" -ge 100 ]; then
            mv "$file" "$greater_than_100mb_folder/"
        fi
    fi
done

echo "Files moved successfully based on size ranges."