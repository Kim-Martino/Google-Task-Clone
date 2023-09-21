import 'package:flutter/material.dart';

import '../../domain/task.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
            TabBar(tabs: [
              Icon(Icons.star),
              Text('내 할 일 목록'),
              Text('+ 새 목록'),
            ]),
            Divider(),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
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
                                  _tasks[index] = Task(
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
                                  color: task.isComplete
                                      ? Colors.blue
                                      : Colors.white,
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
                                    _tasks[index] = Task(
                                      title: task.title,
                                      content: task.content,
                                      isComplete: task.isComplete,
                                      isFavorite: !task.isFavorite,
                                    );
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: task.isFavorite
                                      ? Colors.blue
                                      : Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _tasks.length,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => Container(
                    color: Colors.amber,
                    height: 10,
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 10,
                  ),
                  itemCount: 10,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => Container(
                    color: Colors.blue,
                    height: 10,
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 10,
                  ),
                  itemCount: 10,
                )
              ]),
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
