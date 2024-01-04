class TaskModel {
  TaskModel({
    required this.title,
    this.content = "",
    this.isFavorite = false,
    this.isComplete = false,
  });

  final String title;

  final String content;

  final bool isFavorite;

  final bool isComplete;
}
