import 'package:flutter/material.dart';
import 'package:practice_app/page1.dart';
import 'package:practice_app/page2.dart';
import 'package:practice_app/page3.dart';



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: const [
            Page3(),
            Page2(),
            Page1(),
          ],
        ),
      ),
    );
  }
}