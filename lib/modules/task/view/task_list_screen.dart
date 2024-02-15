import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';
import '../service/task_service.dart';
import '../view_model/task_list_screen_view_model.dart';
import 'widget/add_bottom_sheet.dart';
import 'widget/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TaskListScreenViewModel(taskService: context.read<TaskService>()),
      builder: (context, child) {
        final viewModel = context.watch<TaskListScreenViewModel>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            title: const Text('Tasks'),
            titleSpacing: 12,
            actions: const [
              Icon(
                Icons.circle,
                color: onPrimary,
              ),
              SizedBox(width: 12),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (_, index) {
              return TaskCard(
                task: viewModel.tasks[index],
                onCompletedPressed: () => viewModel.toggleCompleted(index),
                onFavoritePressed: () => viewModel.toggleFavorite(index),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 4);
            },
            itemCount: viewModel.tasks.length,
          ),
          bottomNavigationBar: Container(
            color: primary,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: onPrimary,
                    ),
                    SizedBox(width: 8),
                    PopupMenuButton<Order>(
                      onSelected: (Order result) {
                        viewModel.setOrder(result);
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Order>>[
                        const PopupMenuItem<Order>(
                          value: Order.none,
                          child: Text('None'),
                        ),
                        const PopupMenuItem<Order>(
                          value: Order.dateAsc,
                          child: Text('Date Asc'),
                        ),
                        const PopupMenuItem<Order>(
                          value: Order.dateDesc,
                          child: Text('Date Desc'),
                        ),
                      ],
                      icon: Icon(Icons.import_export),
                      color: onPrimary,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: tertiary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.add,
                      color: onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
