import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onChanged,
  });

  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
