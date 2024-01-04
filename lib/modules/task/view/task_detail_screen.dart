import 'package:flutter/material.dart';
import 'package:google_tasks_clone/modules/task/service/task_service.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskService>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                provider.deleteTask(task);
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Text(task.title),
    );
  }
}
