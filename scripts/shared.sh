#!/bin/bash

RunKitty() {
    kitty $3 -T "$1" --class "$1" --hold sh -c "$2"
    return 0
}
