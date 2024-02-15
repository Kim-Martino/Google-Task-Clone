import 'package:flutter/material.dart';

import '../model/task.dart';
import '../service/task_service.dart';

class AddBottomSheetViewModel extends ChangeNotifier {
  AddBottomSheetViewModel(this.service);

  final TaskService service;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  DateTime _date = DateTime.now();
  DateTime get date => _date;

  final titleController = TextEditingController();
  final descController = TextEditingController();

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void save() {
    service.addTask(
      TaskModel(
        title: titleController.text,
        content: descController.text,
        isFavorite: isFavorite,
        date: date,
      ),
    );
  }
}
