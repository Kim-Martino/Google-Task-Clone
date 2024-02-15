import 'package:flutter/cupertino.dart';

import '../model/task.dart';
import '../service/task_service.dart';

enum Order {
  none,
  dateAsc,
  dateDesc,
}

class TaskListScreenViewModel extends ChangeNotifier {
  TaskListScreenViewModel({
    required this.taskService,
  }) {
    taskService.addListener(notifyListeners);
  }

  final TaskService taskService;
  List<TaskModel> get tasks {
    List<TaskModel> myTasks = List.from(taskService.tasks);
    // 이거 구현.
    // 내 Order의 상태에 따라
    // none: 그냥 주고
    // asc이면 날짜 정렬하고
    // desc이면 ascd에서 reverse 시키고

    if (_order == Order.dateAsc) {
      myTasks.sort((a, b) => a.date.compareTo(b.date));
    } else if (_order == Order.dateDesc) {
      myTasks.sort((a, b) => b.date.compareTo(a.date));
    }
    return myTasks;
  }

  int _tabNumber = 0;
  int get tabNumber => _tabNumber;

  Order _order = Order.none;
  Order get order => _order;

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

  void toggleOrder() {
    switch (_order) {
      case Order.none:
        _order = Order.dateAsc;
        break;
      case Order.dateAsc:
        _order = Order.dateDesc;
        break;
      case Order.dateDesc:
        _order = Order.none;
        break;
    }
  }

  void setOrder(Order order) {
    _order = order;
    notifyListeners();
  }

  // Order 상태를 가지고 있고,
  // 그것을 get으로 보여주고.
  // UI는 Order를 보고, Icon의 색을 흰색- none, 초록색- asc, 빨간색-desc
}
