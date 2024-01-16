import 'dart:math';
import 'package:flutter/material.dart';
import '../model/task.dart';
import 'package:intl/intl.dart';

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
  final List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  /// createdDate
  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

  /// updatedDate
  void toggleCompleted(int index) {
    // 1. task 가 _task 안에서 어디있는지.
    // 2. 그 찾은애의 isCompleted를 toggle 시킨다.
    _tasks[index] = TaskModel(
      title: _tasks[index].title,
      content: _tasks[index].content,
      isComplete: !_tasks[index].isComplete,
      isFavorite: _tasks[index].isFavorite,
      date: DateTime.now(),
    );
    notifyListeners();
  }

  /// starUpdatedDate
  void toggleFavorite(int index) {
    _tasks[index] = TaskModel(
      title: _tasks[index].title,
      content: _tasks[index].content,
      isComplete: _tasks[index].isComplete,
      isFavorite: !_tasks[index].isFavorite,
      date: DateTime.now(),
    );
    notifyListeners();
  }

  void remove(TaskModel task) {}

  /// sort()
  /// _task가 정렬되어야함
  /// notifyListeners
}
