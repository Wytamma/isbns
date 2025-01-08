#!/bin/bash
set -e
set -o pipefail

for filename in images/*.png; do
    if [[ $filename == *"smaller"* ]]; then
        continue
    fi
    echo "Creating tile set for $filename..."
    vips dzsave $filename tiles/$(basename "$filename" .png) --tile-size 256 --overlap 0 --suffix .png
done      