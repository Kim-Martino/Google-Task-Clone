import 'package:flutter/material.dart';
import 'package:google_tasks_clone/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:google_tasks_clone/modules/task/service/task_service.dart';

import '../../view_model/add_bottom_sheet_view_model.dart';

/// UI, plus 버튼 누르면 켜지고
/// 켜쪗을때 별은 항상 꺼짐상태.
class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.read<TaskService>();
    return ChangeNotifierProvider(
      create: (context) => AddBottomSheetViewModel(service),
      builder: (context, child) {
        final viewModel = context.watch<AddBottomSheetViewModel>();
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: viewModel.titleController,
                decoration: InputDecoration(
                  labelText: '제목',
                ),
              ),
              TextField(
                controller: viewModel.descController,
                decoration: InputDecoration(
                  labelText: '새 할 일',
                ),
              ),
              Text('${viewModel.date}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.format_list_bulleted),
                      SizedBox(width: 12),
                      //Icon(Icons.watch_later_outlined),
                      IconButton(
                        onPressed: () async {
                          final selectDate = await showDatePicker(
                            context: context,
                            initialDate: viewModel.date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (selectDate != null) {
                            viewModel.selectDate(selectDate);
                          }
                        },
                        icon: Icon(Icons.watch_later_outlined),
                      ),
                      SizedBox(width: 12),

                      viewModel.isFavorite
                          ? GestureDetector(
                              onTap: viewModel.toggleFavorite,
                              child: const Icon(Icons.star, color: primary),
                            )
                          : GestureDetector(
                              onTap: viewModel.toggleFavorite,
                              child: const Icon(Icons.star_border_outlined,
                                  color: outline),
                            ),
                    ],
                  ),
                  TextButton(
                    onPressed: viewModel.save,
                    child: Text('저장'),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
