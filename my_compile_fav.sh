#!/bin/bash

while read -r BOARD || [ -n "$BOARD" ]; do
    # Skip empty lines and comments
    [[ -z $BOARD || $BOARD = \#* ]] && continue
    
    echo "Compiling for $BOARD..."
    ./waf configure --board $BOARD
    ./waf plane
    ./waf copter
done < my_boards.txt