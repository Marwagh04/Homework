#!/bin/bash

getValueOfArgumentFromFile() {
    local key="$1"
    shift
    local value=$(echo "$@" | grep -oP "(?<=$key=).*?(?=(\s--|$))")
    IFS='|' read -ra values <<<"$value"
    echo "${values[0]}"
}

getTaskById() {
    local getId=$(grep -m 1 "id= $1" file.txt)
    if [ -z "$getId" ]; then
        echo "There is no id $1"
    else
        echo "$getId"
    fi
}

getAllTask() {
    cat "file.txt"
}

listTasksByDay() {
    local day="$1"
    local completedTasks=()
    local uncompletedTasks=()

    while IFS= read -r line; do
        finishDate=$(getValueOfArgumentFromFile "finishDate" "$line")
        isCompleted=$(getValueOfArgumentFromFile "isCompleted" "$line")

        if [[ "$finishDate" =~ "$day" ]]; then
            if [ "$isCompleted" -eq 1 ]; then
                uncompletedTasks+=("$line")
            else
                completedTasks+=("$line")
            fi
        fi
    done <"file.txt"

    echo "Completed tasks:"
    for task in "${completedTasks[@]}"; do
        echo "$task"
    done

    echo "Uncompleted tasks:"
    for task in "${uncompletedTasks[@]}"; do
        echo "$task"
    done
}

searchForTitle() {
    while IFS= read -r line; do
        title=$(getValueOfArgumentFromFile "title" "$line")
        search=$(echo "$title" | grep -i "$1")
        if [ ! -z "$search" ]; then
            echo "$line"
        fi
    done <"file.txt"
}
