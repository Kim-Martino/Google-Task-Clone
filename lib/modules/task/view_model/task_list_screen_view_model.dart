import 'package:flutter/cupertino.dart';

import '../model/task.dart';
import '../service/task_service.dart';

class TaskListScreenViewModel extends ChangeNotifier {
  TaskListScreenViewModel({
    required this.taskService,
  }) {
    taskService.addListener(notifyListeners);
  }

  final TaskService taskService;
  List<TaskModel> get tasks => taskService.tasks;

  int _tabNumber = 0;
  int get tabNumber => _tabNumber;

  void addTask(TaskModel task) {
    taskService.addTask(task);

    notifyListeners();
  }

  void toggleCompleted(int index) {
    // 1. task 가 _task 안에서 어디있는지.
    // 2. 그 찾은애의 isCompleted를 toggle 시킨다.
    taskService.toggleCompleted(index);
  }

  void toggleFavorite(int index) {
    taskService.toggleFavorite(index);
  }

  void toggleTab() {
    _tabNumber = _tabNumber == 0 ? 1 : 0;
    notifyListeners();
  }

  //

  //

  //

  //

  //
}
