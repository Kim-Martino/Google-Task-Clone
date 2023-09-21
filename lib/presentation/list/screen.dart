import 'package:flutter/material.dart';

import '../../domain/task.dart';
import 'task_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> _taskList = ['내 할일 목록'];

  List<Task> _tasks = [
    Task(
      title: '[실행] 목표/동기부여',
      content: '오늘의 목표는 xxx입니다.',
    ),
    Task(
      title: '[실행] 목표/동기부여',
      content: '오늘의 목표는 xxx입니다.',
      isFavorite: true,
    ),
    Task(
      title: '[실행] 목표/동기부여',
      content: '오늘의 목표는 xxx입니다.',
    ),
    Task(
      title: '[실행] 목표/동기부여',
      content: '오늘의 목표는 xxx입니다.',
      isComplete: true,
    ),
    Task(
      title: '[할일] 오늘 할일은 xxx입니다',
      content:
          '- 오늘의 일 1 23 ㅇㄴ로\n sdfsdfsdf\n sdfsdfsdf\n sdfsdfsdf\n sdfsdfsdf',
    ),
  ];

  // 구현할 항목:
  //  - 새 목록 추가
  //  - 아이템을 만들면 현재 목록에 넣기
  //  - 스타 표시된 애들만 따로 리스트에 표시
  //  - Complete

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tasks'),
        actions: [
          Container(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () {},
              child: Image.asset('assets/images/user.png'),
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Icon(Icons.star),
                ..._taskList.map((e) => Text(e)),
                Text('+ 새 목록'),
              ],
              onTap: (value) {
                final addNewListIndex = _taskList.length + 1;
                if (value == addNewListIndex) {
                  setState(() {
                    _taskList.add('new list');
                  });
                }
              },
            ),
            Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  TaskList(
                    tasks: _tasks,
                  ),
                  ..._taskList.map(
                    (e) => TaskList(tasks: _tasks),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        width: double.maxFinite,
        height: 80,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: PopupMenuButton(
                  icon: Icon(Icons.list_alt_outlined),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text("별표표시한 할 일"),
                        ),
                        PopupMenuItem(value: 2, child: Text("내 할 일 목록")),
                      ]),
            ),
            Container(
              width: 50,
              height: 50,
              child: PopupMenuButton(
                  icon: Icon(Icons.wifi_protected_setup_sharp),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text("최근 별표표시한 항목"),
                        ),
                        PopupMenuItem(value: 2, child: Text("날짜")),
                      ]),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 7),
              width: 70,
              height: 70,
              child: ElevatedButton(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 37,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      final TextEditingController controller =
                          TextEditingController();
                      return AlertDialog(
                        title: const Text("내 할 일 목록"),
                        actions: [
                          TextField(
                            controller: controller,
                            decoration: InputDecoration(hintText: "내 할 일"),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 5,
                                ),
                                Container(
                                  width: 5,
                                  height: 5,
                                ),
                                Container(
                                  width: 5,
                                  height: 5,
                                ),
                                Spacer(),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _tasks.add(
                                          Task(
                                            title: controller.text,
                                            content: '',
                                          ),
                                        );
                                      });
                                    },
                                    child: Text("저장"),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
