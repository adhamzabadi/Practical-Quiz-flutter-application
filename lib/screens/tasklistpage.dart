import 'package:flutter/material.dart';
import 'package:mytaskqouiz/models/task.dart';
import 'package:mytaskqouiz/screens/completedtask.dart';
import 'package:mytaskqouiz/widgets/taskitem.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Task> _tasks = [
    Task(title: 'solve this quiz'),
    Task(title: 'Finish homework'),
    Task(title: 'Go to the gym'),
    Task(title: 'Study Flutter'),
  ];

  int get _completedCount => _tasks.where((t) => t.isCompleted).length;

  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index].isCompleted = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Completed: $_completedCount / ${_tasks.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskItem(
                  title: task.title,
                  isCompleted: task.isCompleted,
                  onChanged: (value) => _toggleTask(index, value),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CompletedTasksPage(
                      completedTasks:
                          _tasks.where((t) => t.isCompleted).toList(),
                    ),
                  ),
                );
              },
              child: const Text('View Completed Tasks'),
            ),
          ),
        ],
      ),
    );
  }
}
