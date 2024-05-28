# Homework
README
# Task Manager

This project is a simple task manager that performs CRUD (Create, Read, Update, Delete) operations on tasks. The tasks are stored in a text file (`file.txt`) and manipulated using Bash scripts.

## Design Choices

### Data Storage
Tasks are stored in a plain text file called `file.txt`. Each task is represented as a single line in the following format:

- **id**: Unique identifier for each task.
- **title**: Title of the task.
- **description**: Description of the task.
- **location**: Location of the task.
- **finishDate**: Due date and time for the task.
- **isCompleted**: Status of the task (0 for incomplete, 1 for complete).

### Code Organization
The project is organized into several Bash scripts:

- **main.sh**: Main script to run the task manager.
- **add.sh**: Script containing the function to add a new task.
- **delete.sh**: Script containing the function to delete a task by ID.
- **get.sh**: Script containing functions to get tasks by ID, get all tasks, list tasks by day, and search tasks by title.
- **update.sh**: Script containing the function to update a task.

## Usage

### Adding a Task
To add a new task, use the `-a` option followed by the task details:

```bash
./main.sh -a --title='Buy groceries' --description='Buy milk, eggs, and bread' --location='Supermarket' --finishDate='13/03/2024 10:00'

### Updating a Task
To update an existing task, use the -u option followed by the task ID and the updated details:

./main.sh -u 1 --title='Updated Task Title' --isCompleted=1

### Deleting a Task
To delete a task by its ID, use the -delete option followed by the task ID:
./main.sh -delete 1

### Getting a Task by ID
To get a task by its ID, use the -id option followed by the task ID:
./main.sh -id 2

### Listing All Tasks
To list all tasks, use the -tasks option:
./main.sh -tasks
### Listing Tasks by Day
To list tasks for a specific day, use the -day option followed by the date in dd/mm/yyyy format:

./main.sh -day '13/03/2024'

### Searching for a Task by Title
To search for a task by its title, use the -title option followed by the search term:
./main.sh -title 'Task 1'

### Displaying Help
To display usage information, use the --help or -h option:
./main.sh --help

### Error Handling
The scripts include validation checks for required fields and correct date-time formats. Error messages are redirected to standard error.

### Scripts Explanation
#main.sh
The main script acts as the entry point for the task manager. It includes the following functionalities:

Adding a task
Updating a task
Deleting a task
Retrieving a task by ID
Listing all tasks
Listing tasks for a specific day
Searching for tasks by title
Displaying help information

#add.sh
The script contains functions for adding a new task and updating an existing task:

addTask(): Adds a new task with provided details.
updateTask(): Updates an existing task with new details.

#delete.sh
The script contains a function to delete a task by its ID:

deleteTaskById(): Deletes a task with the specified ID.

#get.sh
The script contains functions to retrieve tasks:

getTaskById(): Retrieves a task by its ID.
getAllTask(): Lists all tasks.
listTasksByDay(): Lists tasks for a specific day, separating completed and uncompleted tasks.
searchForTitle(): Searches for tasks by title.

#update.sh
The script contains a function to update a task by its ID:

updateTask(): Updates a task with the specified ID and new details.

