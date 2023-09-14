import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: Placeholder(),
          )
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            TabBar(tabs: [
              Icon(Icons.star),
              Text('tab1'),
              Text('tab1'),
              Text('tab1'),
              Text('+ 새 목록'),
            ]),
            Divider(),
            Expanded(
              child: TabBarView(children: [
                ListView.separated(
                  itemCount: 40,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      child: Placeholder(),
                    );
                  },
                ),
                ListView.separated(
                  itemCount: 40,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      child: Placeholder(),
                    );
                  },
                ),
                ListView.separated(
                  itemCount: 40,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      child: Placeholder(),
                    );
                  },
                ),
                ListView.separated(
                  itemCount: 40,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      child: Placeholder(),
                    );
                  },
                ),
                Container(),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 40,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              child: Placeholder(),
            ),
            Container(
              width: 30,
              height: 30,
              child: Placeholder(),
            ),
            Container(
              width: 30,
              height: 30,
              child: Placeholder(),
            ),
            Spacer(),
            Container(
              width: 30,
              height: 30,
              child: Placeholder(),
            )
          ],
        ),
      ),
    );
  }
}
