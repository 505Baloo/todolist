class Task {
  final String content;
  final String? id;
  final String? userId;
  final bool? done;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deadline;
  final String? category;
  final int? priority;

  Task(
      {required this.content,
      required this.createdAt,
      this.id,
      this.userId,
      this.done,
      this.updatedAt,
      this.deadline,
      this.category,
      this.priority});
}
