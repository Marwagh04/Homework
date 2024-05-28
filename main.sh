
### main.sh
```bash
#!/bin/bash

source ./add.sh
source ./delete.sh
source ./get.sh
source ./update.sh

# Function to print usage information
Help() {
    echo "This is a task manager that performs CRUD operations."
    echo "Usage:"
    echo "-a: to add a new task. Example: ./main.sh -a --title='task 1' --description='this is a description of the task' --finishDate='dd/mm/yyyy hh:mm' --location='home'"
    echo "-u: to update a task. Example: ./main.sh -u 1 --title='updated title' --isCompleted=1"
    echo "-id: to get a task by id. Example: ./main.sh -id 2"
    echo "-tasks: to list all tasks. Example: ./main.sh -tasks"
    echo "-day: to list tasks by day. Example: ./main.sh -day 'dd/mm/yyyy'"
    echo "-title: to search for a task by title. Example: ./main.sh -title 'task 1'"
    echo "-delete: to delete a task by id. Example: ./main.sh -delete 1"
}

# Main script starts here
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    Help
    exit 0
fi

if [ "$1" == "-a" ]; then
    shift
    addTask "$@"
    exit 0
fi

if [ "$1" == "-u" ]; then
    shift
    updateTask "$@"
    exit 0
fi

if [ "$1" == "-id" ]; then
    getTaskById "$2"
    exit 0
fi

if [ "$1" == "-tasks" ]; then
    getAllTask
    exit 0
fi

if [ "$1" == "-day" ]; then
    listTasksByDay "$2"
    exit 0
fi

if [ "$1" == "-title" ]; then
    searchForTitle "$2"
    exit 0
fi

if [ "$1" == "-delete" ]; then
    deleteTaskById "$2"
    exit 0
fi

# If no arguments are passed, show tasks of the current day
if [ "$#" -eq 0 ]; then
    currentDate=$(date +"%d/%m/%Y")
    listTasksByDay "$currentDate"
    exit 0
fi

echo "Invalid option. Use --help or -h for usage information." >&2
exit 1
