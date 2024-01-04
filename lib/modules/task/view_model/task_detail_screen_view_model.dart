import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../model/task.dart';
import '../service/task_service.dart';

class TaskDetailScreenViewModel extends ChangeNotifier {
  TaskDetailScreenViewModel({
    required this.taskService,
  }) {
    taskService.addListener(notifyListeners);
  }

  final TaskService taskService;

  List<TaskModel> get tasks => taskService.tasks;

  void deleteTask(TaskModel task) {
    taskService.deleteTask(task);
  }
}
