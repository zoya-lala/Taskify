import 'package:flutter/material.dart';
import 'package:taskie/screens/add_update.dart';

import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(task.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(task.details),
        trailing: Icon(
          task.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: task.isFavourite ? Colors.red : Colors.grey,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(task: task),
            ),
          );
        },
      ),
    );
  }
}
