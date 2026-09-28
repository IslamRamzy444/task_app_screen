class TaskEntity {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
  TaskEntity copyWith({bool? isCompleted}) {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}