import 'package:flutter/material.dart';

class Taskitem extends StatelessWidget {
  const Taskitem({super.key, required this.tasktitle, required this.isCompleted});
  final String tasktitle;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('Task Item'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text(tasktitle),
              trailing: isCompleted ? const Icon(Icons.check) : null,
            ),
          ],
        ),
      ),
    );
  }
}