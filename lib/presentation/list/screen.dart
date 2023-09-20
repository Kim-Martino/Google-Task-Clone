import 'package:flutter/material.dart';
import 'package:googletask/presentation/detail/screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tasks'),
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
                      return AlertDialog(
                        title: const Text("내 할 일 목록"),
                        actions: [
                          TextField(
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
                                    onPressed: () {},
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
