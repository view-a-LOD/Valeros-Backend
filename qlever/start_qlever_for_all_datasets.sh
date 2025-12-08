#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 path/to/directory" >&2
  exit 1
fi

base_dir="$1"

if [ ! -d "$base_dir" ]; then
  echo "Error: '$base_dir' is not a directory" >&2
  exit 1
fi

for dataset_dir in "$base_dir"/*/; do
  if [ -d "$dataset_dir" ]; then
    if [ -f "$dataset_dir/Qleverfile" ]; then
      echo "=== Processing dataset: $dataset_dir ==="
      ./start_qlever_for_dataset.sh "$dataset_dir"
    else
      echo "Warning: No Qleverfile found in '$dataset_dir', skipping..."
    fi
  fi
done