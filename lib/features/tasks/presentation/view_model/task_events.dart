sealed class TaskEvents {}

class LoadTasksEvent extends TaskEvents {
  final String task1Title;
  final String task1Desc;
  final String task2Title;
  final String task2Desc;
  final String task3Title;
  final String task3Desc;

  LoadTasksEvent({
    required this.task1Title,
    required this.task1Desc,
    required this.task2Title,
    required this.task2Desc,
    required this.task3Title,
    required this.task3Desc,
  });
}

class ToggleTaskCompletionEvent extends TaskEvents {
  final String taskId;
  ToggleTaskCompletionEvent(this.taskId);
}