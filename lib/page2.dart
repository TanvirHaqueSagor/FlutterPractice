import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              backgroundColor: Colors.red,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("YoYo"),
                //background: Image,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                addDetails("One", "This is One"),
                addDetails("Two", "This is Two"),
                addDetails("Three", "This is Three"),
                addDetails("One", "This is One"),
                addDetails("Two", "This is Two"),
                addDetails("Three", "This is Three"),
                addDetails("One", "This is One"),
                addDetails("Two", "This is Two"),
                addDetails("Three", "This is Three"),
                addDetails("One", "This is One"),
                addDetails("Two", "This is Two"),
                addDetails("Three", "This is Three"),
                addDetails("One", "This is One"),
                addDetails("Two", "This is Two"),
                addDetails("Three", "This is Three"),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

Widget addDetails(String name, String description) {
  return ListTile(
    title: Text(name),
    subtitle: Text(description),
    leading: CircleAvatar(
      child: Text(name[0]),
    ),
  );
}
