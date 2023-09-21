class Task {
  Task({
    required this.title,
    required this.content,
    this.isFavorite = false,
    this.isComplete = false,
  });

  final String title;

  final String content;

  final bool isFavorite;

  final bool isComplete;
}
