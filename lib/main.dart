import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/data.dart';
import 'package:practice_app/json_data.dart';
import 'package:practice_app/list_container.dart';
import 'package:practice_app/myapp.dart';
import 'package:practice_app/page1.dart';
import 'package:practice_app/page2.dart';
import 'package:practice_app/page3.dart';
import 'package:practice_app/page4.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const ListContainer());
  //  runApp(const MyApp());
  runApp(const BottomNavigationApp());
  runApp(
    ChangeNotifierProvider(
      create: (_) => Data(),
      child: const BottomNavigationApp(),
    ),
  );
}

class BottomNavigationApp extends StatefulWidget {
  const BottomNavigationApp({Key? key}) : super(key: key);

  @override
  _BottomNavigationAppState createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  var _currentindex = 0;
  final pages = [
    const MyApp(),
    const ListContainer(),
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const JsonData(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,

          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.home),
                label: "Home"),
            BottomNavigationBarItem(
              backgroundColor: Colors.black54,
              icon: Icon(Icons.mark_email_read),
              label: "Email",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.chat_bubble_outline),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black38,
              icon: Icon(Icons.adb_outlined),
              label: "Bug",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.access_time),
              label: "Bug",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.pages_rounded),
              label: "Bug",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(Icons.ten_k_outlined),
              label: "JSON",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
        body: pages[_currentindex],
      ),
    );
  }
}
