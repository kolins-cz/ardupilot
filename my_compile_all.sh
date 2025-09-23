#!/bin/bash

# Get the list of available boards
BOARDS=$(./waf list_boards)

# Loop through each board and compile
for BOARD in $BOARDS
do
    echo "Configuring and compiling for $BOARD..."
    ./waf configure --board $BOARD
    ./waf
    if [ $? -ne 0 ]; then
        echo "Failed to compile $BOARD"
    else
        echo "Successfully compiled $BOARD"
    fi
done