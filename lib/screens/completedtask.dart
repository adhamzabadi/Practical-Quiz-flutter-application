import 'package:flutter/material.dart';
import 'package:mytaskqouiz/models/task.dart';

class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({super.key, required this.completedTasks});

  final List<Task> completedTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: completedTasks.isEmpty
                ? const Center(child: Text('No completed tasks yet'))
                : ListView.builder(
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(completedTasks[index].title),
                        trailing: const Icon(Icons.check, color: Colors.green),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Main Page'),
            ),
          ),
        ],
      ),
    );
  }
}
