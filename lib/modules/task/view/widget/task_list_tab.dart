import 'package:flutter/material.dart';
import 'package:google_tasks_clone/modules/task/service/task_service.dart';
import 'package:provider/provider.dart';
import 'package:google_tasks_clone/modules/task/model/task.dart';

class TaskListTab extends StatelessWidget {
  final bool isFavorite;

  TaskListTab({required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskService>(
      builder: (context, taskService, child) {
        List<TaskModel> tasks = taskService.tasks
            .where((task) => task.isFavorite == isFavorite)
            .toList();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].content),
            );
          },
        );
      },
    );
  }
}
