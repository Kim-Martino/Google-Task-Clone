import 'package:flutter/material.dart';
import 'package:google_tasks_clone/modules/task/view/widget/task_list_screen_test.dart';
import 'package:provider/provider.dart';
import 'modules/task/service/task_service.dart';
import 'modules/task/view/task_list_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TaskService()),
    ], child: const Myapp()),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASK DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
