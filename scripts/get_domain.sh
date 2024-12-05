#!/bin/bash

# https://github.com/cathugger/mkp224o
docker run --rm -it -v $PWD/keys:/keys ghcr.io/cathugger/mkp224o:master -d /keys neko -n 1 

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

chmod 775 -R ./tor/hidden_service

