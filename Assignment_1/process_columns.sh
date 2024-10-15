#!/bin/bash

# Check if the file path is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <file-path>"
  exit 1
fi

# Read the file path from the first argument
file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
  echo "File not found!"
  exit 1
fi

# Temporary file to store the modified output
temp_file=$(mktemp)

# Change column 3 values based on the condition and store the result in a temp file
awk '{
  if ($3 > 5) $3 = "L";
  else $3 = "S";
  print $0;
}' "$file" > "$temp_file"

# Print the modified file
echo "Modified file content:"
cat "$temp_file"

# Find the longest streak of "L" or "S" in column 3
streak_type=""
longest_streak=0
current_streak=0
longest_streak_index=0
last_index=0

# Read through the modified file line by line
while read -r line; do
  # Get the third column (which contains "L" or "S")
  value=$(echo "$line" | awk '{print $3}')
  
  # Get the current line index
  last_index=$((last_index + 1))

  # If the value is the same as the previous one, increment the current streak
  if [ "$value" == "$streak_type" ]; then
    current_streak=$((current_streak + 1))
  else
    # If it's a different value, reset the streak
    streak_type="$value"
    current_streak=1
  fi

  # Update the longest streak if needed
  if [ $current_streak -gt $longest_streak ]; then
    longest_streak=$current_streak
    longest_streak_index=$last_index
  fi
done < "$temp_file"

# Print the longest streak and its latest index
echo "Longest streak: $longest_streak of '$streak_type' ending at line $longest_streak_index"

# Clean up the temporary file
rm "$temp_file"
