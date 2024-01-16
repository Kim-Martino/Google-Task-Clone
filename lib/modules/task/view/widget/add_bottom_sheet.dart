import 'package:flutter/material.dart';
import 'package:google_tasks_clone/modules/task/model/task.dart';
import 'package:provider/provider.dart';
import 'package:google_tasks_clone/modules/task/view/widget/task_card.dart';
import 'package:google_tasks_clone/modules/task/service/task_service.dart';
import '../../view_model/task_list_screen_view_model.dart';
import 'package:intl/intl.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskService>(context);

    late TextEditingController _controller;
    late TextEditingController _controller2;
    String selectDate;

    String formatDate = DateFormat('yy-MM-dd HH:mm').format(DateTime.now());

    DateTime date = DateTime.now();

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
                  //Icon(Icons.watch_later_outlined),
                  IconButton(
                    onPressed: () {
                      final selectDate = showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                    },
                    icon: Icon(Icons.watch_later_outlined),
                  ),
                  SizedBox(width: 12),
                  //Icon(Icons.star_outline),
                  IconButton(
                    onPressed: () {
                      provider.addTask(
                        TaskModel(
                          title: _controller.text,
                          isFavorite: true,
                          date: DateTime.now(),
                        ),
                      );
                    },
                    icon: Icon(Icons.star_outline),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  provider.addTask(
                    TaskModel(
                      title: _controller.text,
                      content: _controller2.text,
                      isComplete: false,
                      isFavorite: false,
                      date: DateTime.now(),
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
