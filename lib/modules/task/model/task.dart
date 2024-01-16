import 'package:intl/intl.dart';

class TaskModel {
  TaskModel({
    required this.title,
    required this.date,
    this.content = "",
    this.isFavorite = false,
    this.isComplete = false,
  });

  final String title;

  final String content;

  final bool isFavorite;

  final bool isComplete;

  final DateTime date;
}
