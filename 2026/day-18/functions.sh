#!/bin/bash

greet() {
echo "Hello, $1!"
}

greet "Khushi"

add() {
        echo $(($1+$2))
}
add 4 5