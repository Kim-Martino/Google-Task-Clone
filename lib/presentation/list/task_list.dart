import 'package:flutter/material.dart';

import '../../domain/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        // 새로운 코드 작성함.
        return Container(
          height: 80,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // 1.
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.tasks[index] = Task(
                        title: task.title,
                        content: task.content,
                        isComplete: !task.isComplete,
                        isFavorite: task.isFavorite,
                      );
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: task.isComplete ? Colors.blue : Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // 2.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          task.content,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                // 3.
                Container(
                  width: 30,
                  height: 30,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.tasks[index] = Task(
                          title: task.title,
                          content: task.content,
                          isComplete: task.isComplete,
                          isFavorite: !task.isFavorite,
                        );
                      });
                    },
                    child: Icon(
                      Icons.star,
                      color: task.isFavorite ? Colors.blue : Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
