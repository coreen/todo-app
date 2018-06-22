# Command Line TODO app

Bash implementation of a TODO app. Gives each TODO item a unique id, ids do not repeat.

## Example

```
$ ./todo-app.sh
Usage:
	 todo list
		 show all todo records
	 todo add <record>
		 adds record to todo list
		 Note: put quotes around record string
	 todo delete <recordId>
		 removes record associated with given recordId
Enter command: todo list

Enter command: todo add "buy milk"
Added "buy milk"

Enter command: todo add "go for a run"
Added "go for a run"

Enter command: todo add "charge phone"
Added "charge phone"

Enter command: todo list
0  "buy milk"
1  "go for a run"
2  "charge phone"

Enter command: todo delete 1
Deleting "go for a run"

Enter command: todo list
0  "buy milk"
2  "charge phone"

Enter command: ^C
```
