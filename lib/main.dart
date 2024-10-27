// I will be adding comments as this is the first time I am working with Flutter Web
// Dart is the programming language used to write Flutter apps
// Flutter is a UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase

import 'package:flutter/material.dart'; // Has Material Designs for the app
import 'package:shared_preferences/shared_preferences.dart'; // For storing data locally
import 'dart:convert'; // For encoding and decoding JSON data

// This is the main entry point of the app
void main() {
  // Takes the TodoApp widget and attaches it to the screen
  runApp(const TodoApp());
}

// This class is a stateless widget which means it don't change over time
class TodoApp extends StatelessWidget {
  // Constructor for the TodoApp class
  const TodoApp({super.key});

  // @override tells Dart that you are intentionally overriding the parent class method
  @override
  Widget build(BuildContext context) {
    // MaterialApp is a wrapper for the app that applies Material Design to the app
    // Material Design is a design language developed by Google that defines the visual, motion, and interaction design of the app
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        // A class that holds the color, typography, and theme properties for the app
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TodoListScreen(), // Defines the home screen of the app
    );
  }
}

// StatefulWidget is a widget that has mutable state. Dynamic information can be changed by the user
class TodoListScreen extends StatefulWidget {
  // super.key is used to call the constructor of the superclass
  // Constructor for the TodoListScreen class
  const TodoListScreen({super.key});

  // createState() creates the mutable state
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

// Handles the main logic of the app. Underscore (_) before the class name makes it private
// Here we are defining a private state class for the TodoListScreen widget
// State defines the state and logic of the widget
class _TodoListScreenState extends State<TodoListScreen> {
  List<String> _tasks = [];

  // This controller is used to control the text field
  final TextEditingController _controller = TextEditingController();

  // initState() is called when the widget is first created
  @override
  void initState() {
    super.initState();

    // At init, it loads the tasks from local storage
    _loadTasks();
  }

  // Load tasks from local storage asynchronously which means it waits for the task to complete
  Future<void> _loadTasks() async {
    // This line loads and parses the tasks from local storage
    final prefs = await SharedPreferences.getInstance();

    // Gets the 'tasks' key from local storage
    final String? tasksString = prefs.getString('tasks');

    // if it finds any tasks, it sets the state of the tasks
    if (tasksString != null) {
      // setState() tells flutter to update the UI
      setState(() {
        // json.decode() decodes the JSON string and returns the resulting JSON object
        _tasks = List<String>.from(json.decode(tasksString));
      });
    }
  }

  // Save tasks to local storage
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json.encode(_tasks));
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
      _saveTasks(); // Save updated tasks list
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks(); // Save updated tasks list
  }

  @override
  Widget build(BuildContext context) {
    // Returns widgets that represent the app's UI
    return Scaffold(
      // Scaffold is a layout structure that contains the app's UI elements
      backgroundColor: Colors.white,

      // The top bar of the app
      appBar: AppBar(
        title: const Text('To-Do List', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0, // Removes the shadow below the app bar
        centerTitle: true, // Centers the title of the app bar
        iconTheme: const IconThemeData(
            color: Colors.black), // Sets the color of the icons in the app bar
      ),

      // Main content of the app
      body: Padding(
        // Adds space around the content inside it
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        // Column arranges its children(widgets) vertically in a column
        child: Column(
          children: [
            // A widget that displays a text field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                // Adds decoration to the text field
                hintText: 'Enter a new task',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add, color: Colors.blueGrey),
                  onPressed: _addTask,
                ),
                border: const UnderlineInputBorder(),
              ),
              onSubmitted: (_) => _addTask(),
            ),

            // Tells Flutter to expand the child widget to fill the available space
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text("No tasks yet!",
                          style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      // Scrollable list of widgets arranged linearly
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // A single fixed-height row
                          title: Text(
                            _tasks[index],
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                          ),
                          trailing: IconButton(
                            // A button that appears on the right side of the list tile (trailing)
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.redAccent),
                            onPressed: () => _removeTask(index),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
