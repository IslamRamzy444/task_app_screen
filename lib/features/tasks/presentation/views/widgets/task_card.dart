import 'package:flutter/material.dart';
import 'package:task_app_screen/core/resources/app_colors.dart';
import 'package:task_app_screen/features/tasks/domain/entities/task_entity.dart';
import 'package:task_app_screen/l10n/app_localizations.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onMarkDone;

  const TaskCard({
    super.key,
    required this.task,
    required this.onMarkDone,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;
    final height=MediaQuery.sizeOf(context).height;
    return Container(
      margin: EdgeInsets.only(bottom: 0.02 * MediaQuery.sizeOf(context).height),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(0.04 * width),
        // Lighter shadow than RoomItem, more appropriate for list items
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColors.greyColor.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        // Visual indicator for completed tasks
        border: Border.all(
          color: task.isCompleted ? AppColors.primaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(0.04 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row with a trailing icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: task.isCompleted
                          ? AppColors.greyColor
                          : AppColors.blackColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  task.isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: task.isCompleted
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
              ],
            ),
            SizedBox(height: 0.01 *height),
            // Description
            Text(
              task.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.greyColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 0.015* height),
            if (!task.isCompleted)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: onMarkDone,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    minimumSize: Size.zero, // Prevents button from stretching
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(l10n.markAsDone),
                ),
              )
            else
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  l10n.completed,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}