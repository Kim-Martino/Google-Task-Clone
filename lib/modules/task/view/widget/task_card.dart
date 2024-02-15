import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../../model/task.dart';
import '../task_detail_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.onCompletedPressed,
    this.onFavoritePressed,
  });

  final TaskModel task;

  final VoidCallback? onCompletedPressed;

  final VoidCallback? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return TaskDetailScreen(
                task: task,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1.
            Row(
              children: [
                task.isComplete
                    ? GestureDetector(
                        onTap: onCompletedPressed,
                        child: const Icon(Icons.circle, color: primary),
                      )
                    : GestureDetector(
                        onTap: onCompletedPressed,
                        child:
                            const Icon(Icons.circle_outlined, color: outline),
                      ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: paragraphMedium.copyWith(
                        color: onSurface,
                      ),
                    ),
                    Text(
                      task.content,
                      style: paragraphSmall.copyWith(
                        color: onSurface,
                      ),
                    ),
                    Text(
                      '${task.date}',
                      style: paragraphSmall.copyWith(
                        color: onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            task.isFavorite
                ? GestureDetector(
                    onTap: onFavoritePressed,
                    child: const Icon(Icons.star, color: primary),
                  )
                : GestureDetector(
                    onTap: onFavoritePressed,
                    child:
                        const Icon(Icons.star_border_outlined, color: outline),
                  ),
          ],
        ),
      ),
    );
  }
}
