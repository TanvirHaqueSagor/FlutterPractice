import 'package:flutter/material.dart';
import 'package:practice_app/page2.dart';
import 'package:practice_app/page3.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.camera),
                ),
                Tab(
                  icon: Icon(Icons.monetization_on_outlined),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Page2(),
            Page3(),
          ],),
        ),
      ),
    );
  }
}
