import 'dart:math';

import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskService extends ChangeNotifier {
  // final List<TaskModel> _tasks = List.generate(
  //   50,
  //   (index) => TaskModel(
  //     title: 'I am $index',
  //     content: 'I am content $index',
  //     isFavorite: Random().nextBool(),
  //     isComplete: Random().nextBool(),
  //   ),
  // );
  final List<TaskModel> _tasks = [
    TaskModel(title: 'A'),
    TaskModel(title: 'B'),
    TaskModel(title: 'C'),
    TaskModel(title: 'D'),
    TaskModel(title: 'E'),
    TaskModel(title: 'F'),
    TaskModel(title: 'G'),
    TaskModel(title: 'H'),
    TaskModel(title: 'I'),
  ];
  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleCompleted(int index) {
    // 1. task 가 _task 안에서 어디있는지.
    // 2. 그 찾은애의 isCompleted를 toggle 시킨다.
    _tasks[index] = TaskModel(
      title: _tasks[index].title,
      content: _tasks[index].content,
      isComplete: !_tasks[index].isComplete,
      isFavorite: _tasks[index].isFavorite,
    );
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _tasks[index] = TaskModel(
      title: _tasks[index].title,
      content: _tasks[index].content,
      isComplete: _tasks[index].isComplete,
      isFavorite: !_tasks[index].isFavorite,
    );
    notifyListeners();
  }

  void remove(TaskModel task) {}
}
