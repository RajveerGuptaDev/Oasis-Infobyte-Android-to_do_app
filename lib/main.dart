import 'package:flutter/material.dart';
import 'package:to_do_app/Splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),

    );
  }
}

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Task> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName));
    });
    taskController.clear();
  }

  void toggleTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List',style: TextStyle(
          color: Colors.yellow,
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: tasks[index],
                  onToggle: () => toggleTask(tasks[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                    controller: taskController,
                    decoration: InputDecoration(hintText: 'Enter task name',suffixStyle: TextStyle(
                      color: Colors.yellow,
                    )),
                    cursorColor: Colors.yellow,
                  ),
                ),
                IconButton(
                  color: Colors.yellow,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      addTask(taskController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  TaskTile({required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          onToggle();
        },
      ),
    );
  }
}
