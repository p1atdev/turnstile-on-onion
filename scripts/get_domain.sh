#!/bin/bash

# https://github.com/cathugger/mkp224o
docker run \
  --platform linux/amd64 \
  --rm \
  -it \
  -v $PWD/keys:/keys ghcr.io/cathugger/mkp224o:master \
  -d /keys \
  -n 1 \
  neko

# Find the first directory that matches the pattern
first_dir=$(find ./keys -type d -name "*.onion" | head -n 1)

# Check if the directory exists
if [ -d "$first_dir" ]; then
  # Move all files from the first directory to the current directory
  mv "$first_dir"/* ./tor/hidden_service
  rm -r "$first_dir"
else
  echo "No directory found matching the pattern."
fi

chmod -R 775 ./tor/hidden_service
