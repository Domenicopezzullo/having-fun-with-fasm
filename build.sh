#!/usr/bin/env bash


if [ ! -d out ]; then
  mkdir out
  echo "Created output directory"
fi
fasm main.s >&/dev/null
echo "Compiled assembly code"
mv main out/
echo "Copied executable to output directory"
