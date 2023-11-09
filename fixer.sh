#!/bin/bash
git pull

# Path to the file you want to check and modify
FILE_PATH="config/adv360.keymap"

# Search for the string "turbos.dtsi" in the file
if ! grep -q "turbos.dtsi" "$FILE_PATH"; then
    # If the string is not found, use sed to replace the target block of text
    sed -i '/behaviors {/{N;N;s|#include "macros.dtsi"|#include "macros.dtsi"\n    #include "turbos.dtsi"|}' "$FILE_PATH"
    echo "File updated to include turbos.dtsi."
    git add $FILE_PATH
    git commit -m "adding back turbo.dtsi"
    git push
else
    echo "File already contains turbos.dtsi."
fi
