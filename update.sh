#!/bin/bash

updateTask() {
    local taskId="$1"
    shift
    local tempFile="./tempFile.txt"
    local lineToUpdate=$(grep -m 1 "id= $taskId" file.txt)

    if [ -z "$lineToUpdate" ]; then
        echo "Error: Task with id $taskId not found." >&2
        exit 1
    fi

    local updatedLine="$lineToUpdate"

    for arg in "$@"; do
        local key=$(echo "$arg" | cut -d'=' -f1 | sed 's/--//')
        local value=$(echo "$arg" | cut -d'=' -f2)
        updatedLine=$(echo "$updatedLine" | sed "s|\($key=\)[^|]*|\1$value|")
    done

    grep -v "id= $taskId" file.txt > "$tempFile"
    echo "$updatedLine" >> "$tempFile"
    mv "$tempFile" file.txt
    echo "Task with id $taskId has been updated."
}
