import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_app_screen/features/tasks/domain/entities/task_entity.dart';
import 'package:task_app_screen/features/tasks/presentation/view_model/task_events.dart';
import 'package:task_app_screen/features/tasks/presentation/view_model/task_states.dart';

@injectable
class TaskViewModel extends Cubit<TaskStates> {
  TaskViewModel() : super(TaskStates());

  void doIntent(TaskEvents event) {
    switch (event) {
      case LoadTasksEvent():
        _loadTasks(event);
      case ToggleTaskCompletionEvent():
        _toggleTaskCompletion(event.taskId);
    }
  }

  void _loadTasks(LoadTasksEvent event) {
    final tasks = [
      TaskEntity(
        id: '1',
        title: event.task1Title,
        description: event.task1Desc,
      ),
      TaskEntity(
        id: '2',
        title: event.task2Title,
        description: event.task2Desc,
      ),
      TaskEntity(
        id: '3',
        title: event.task3Title,
        description: event.task3Desc,
      ),
    ];
    emit(state.copyWith(isLoading: false, tasks: tasks));
  }

  void _toggleTaskCompletion(String taskId) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == taskId) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();

    emit(state.copyWith(tasks: updatedTasks));
  }
}
