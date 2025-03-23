#!/bin/sh

# Create tmp folder
LOCAL_TMP_DIR=local-tmp
echo "Creating local temporary directory for extracting archive.tar"
if [ ! -d "$LOCAL_TMP_DIR" ]; then
  mkdir $LOCAL_TMP_DIR
  echo "Directory: '$LOCAL_TMP_DIR' created"
else
  echo "Directory: '$LOCAL_TMP_DIR'  already exists"
fi

# Extraction
echo "Extracting archive.tar to $LOCAL_TMP_DIR"
cp archive.tar $LOCAL_TMP_DIR
tar -xf archive.tar -C $LOCAL_TMP_DIR
rm "$LOCAL_TMP_DIR/archive.tar"

# Check size and delete empty files / rename to as .log files
echo "Checking for empty files in $LOCAL_TMP_DIR"
for FILE in $LOCAL_TMP_DIR/*; do
  if [ ! -s "$FILE" ]; then
    echo "Removing empty file: $FILE"
    rm $FILE
  else
    echo "Adding .log extension to file: $FILE."
    mv $FILE $FILE.log
  fi
done

# Compress as new archive
echo "Compressing $LOCAL_TMP_DIR to new-archive.tar"
tar -cf new-archive.tar -C $LOCAL_TMP_DIR .

# Clean up
echo "Removing temporary directory: $LOCAL_TMP_DIR"
rm -rf $LOCAL_TMP_DIR

# Check if the directory still exists
if [ ! -d "$LOCAL_TMP_DIR" ]; then
    echo "Directory '$LOCAL_TMP_DIR' successfully removed."
else
    echo "Directory '$LOCAL_TMP_DIR' still exists."
fi