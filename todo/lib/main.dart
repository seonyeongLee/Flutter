import 'package:flutter/material.dart';
import 'package:todo/write.dart';

import 'data/todo.dart';
import 'data/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo!',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Todo> todos = [
    Todo(
        title: "todo list 만들기",
        memo: "앱 개발 입문",
        color: Colors.redAccent.value,
        done: 0,
        category: "study :-)",
        date: 20220720),
    Todo(
        title: "todo list 만들기222222",
        memo: "앱 개발 입문",
        color: Colors.blueAccent.value,
        done: 1,
        category: "study :-)",
        date: 20220720)
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          //화면 이동
          Todo todo = await Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => TodoWritePage(
                    todo: Todo(
                      title: "",
                      color: 0,
                      memo: "",
                      done: 0,
                      category: "",
                      date: Utils.getFormatTime(DateTime.now())
                    ),
                  )));

          setState(() {
            todos.add(todo);
          });
        },
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          if (idx == 0) {
            return Container(
              child: Text(
                "오늘하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            );
          } else if (idx == 1) {
            List<Todo> undone = todos.where((t) {
              return t.done == 0;
            }).toList();

            return Column(
              children: List.generate(undone.length, (_idx) {
                Todo t = undone[_idx];

                return Container(
                  decoration: BoxDecoration(
                      color: Color(t.color),
                      borderRadius: BorderRadius.circular(16)),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.done == 0 ? "미완료" : "완료",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      Container(height: 8),
                      Text(
                        t.memo,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                );
              }),
            );
          } else if (idx == 2) {
            return Container(
              child: Text(
                "완료된 하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            );
          } else if (idx == 3) {
            List<Todo> done = todos.where((t) {
              return t.done == 1;
            }).toList();

            return Column(
              children: List.generate(done.length, (_idx) {
                Todo t = done[_idx];

                return Container(
                  decoration: BoxDecoration(
                      color: Color(t.color),
                      borderRadius: BorderRadius.circular(16)),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.done == 0 ? "미완료" : "완료",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      Container(height: 8),
                      Text(
                        t.memo,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                );
              }),
            );
          }

          return Container();
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: "오늘"),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined), label: "기록"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "더보기"),
      ]),
    );
  }
}
