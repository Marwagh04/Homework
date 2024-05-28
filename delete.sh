#!/bin/bash

deleteTaskById() {
    local taskId="$1"
    local tempFile="./tempFile.txt"
    grep -v "id= $taskId" file.txt > "$tempFile"
    mv "$tempFile" file.txt
    echo "Task with id $taskId has been deleted."
}
