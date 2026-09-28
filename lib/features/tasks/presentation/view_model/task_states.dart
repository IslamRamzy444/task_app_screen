import 'package:task_app_screen/features/tasks/domain/entities/task_entity.dart';

class TaskStates {
  final bool isLoading;
  final List<TaskEntity> tasks;

  TaskStates({
    this.isLoading = true,
    this.tasks = const [],
  });

  TaskStates copyWith({
    bool? isLoading,
    List<TaskEntity>? tasks,
  }) {
    return TaskStates(
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
    );
  }
}