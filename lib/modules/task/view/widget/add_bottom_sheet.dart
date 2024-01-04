import 'package:flutter/material.dart';
import 'package:google_tasks_clone/modules/task/model/task.dart';
import 'package:provider/provider.dart';
import 'package:google_tasks_clone/modules/task/service/task_service.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskService>(context);
    late TextEditingController _controller;
    late TextEditingController _controller2;

    _controller = TextEditingController();
    _controller2 = TextEditingController();

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: '제목',
            ),
          ),
          TextField(
            controller: _controller2,
            decoration: InputDecoration(
              labelText: '새 할 일',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.format_list_bulleted),
                  SizedBox(width: 12),
                  Icon(Icons.watch_later_outlined),
                  SizedBox(width: 12),
                  Icon(Icons.star_outline),
                ],
              ),
              TextButton(
                onPressed: () {
                  provider.addTask(
                    TaskModel(
                      title: _controller.text,
                      content: _controller2.text,
                      isComplete: true,
                      isFavorite: false,
                    ),
                  );
                },
                child: Text('저장'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
