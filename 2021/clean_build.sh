#!/bin/bash

echo "======================================="
echo "Clean Build of the project."
echo "---------------------------------------"

echo "cleaning all output files..."

./clean.sh

echo "building the output..."

./build.sh

echo "Done!"
echo "======================================="