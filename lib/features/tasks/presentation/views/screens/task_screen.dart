import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app_screen/config/di/di.dart';
import 'package:task_app_screen/features/tasks/presentation/view_model/task_events.dart';
import 'package:task_app_screen/features/tasks/presentation/view_model/task_states.dart';
import 'package:task_app_screen/features/tasks/presentation/view_model/task_view_model.dart';
import 'package:task_app_screen/features/tasks/presentation/views/widgets/task_card.dart';
import 'package:task_app_screen/l10n/app_localizations.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskViewModel viewModel = getIt<TaskViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final l10n = AppLocalizations.of(context)!;
      viewModel.doIntent(
        LoadTasksEvent(
          task1Title: l10n.task1Title,
          task1Desc: l10n.task1Desc,
          task2Title: l10n.task2Title,
          task2Desc: l10n.task2Desc,
          task3Title: l10n.task3Title,
          task3Desc: l10n.task3Desc,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<TaskViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(l10n.my_tasks)
        ),
        body: BlocBuilder<TaskViewModel, TaskStates>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04 * MediaQuery.sizeOf(context).width,
                vertical: 0.02 * MediaQuery.sizeOf(context).height,
              ),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return TaskCard(
                  task: task,
                  onMarkDone: () {
                    viewModel.doIntent(ToggleTaskCompletionEvent(task.id));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
