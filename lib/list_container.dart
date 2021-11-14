import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:practice_app/data.dart';
import 'package:practice_app/page2.dart';
import 'package:provider/provider.dart';

class ListContainer extends StatefulWidget {
  const ListContainer({Key? key}) : super(key: key);

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final providerData = Provider.of<Data>(context);
    final pages = [
      ListView(
        children: <Widget>[
          const Tooltip(
            message: "ListTile Tooltip",
            child: ListTile(
              title: Text("Easy Explanation"),
              subtitle: Text("LEaten from Youtube"),
              leading: CircleAvatar(
                child: Icon(
                  Icons.add_ic_call_sharp,
                  color: Colors.cyanAccent,
                ),
                backgroundColor: Colors.transparent,
              ),
              trailing: Icon(Icons.share),
            ),
          ),
          ExpansionTile(
            title: const Text("ExpansionTile"),
            subtitle: const Text("This is a expansion tail"),
            leading: const Icon(Icons.access_time),
            trailing: const Icon(Icons.arrow_downward),
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple,
                child: const Center(
                  child: Text("This is a Expanded Area"),
                ),
              ),
            ],
          ),
          const ListTile(
            title: Text("Easy Explanation"),
            subtitle: Text("LEaten from Youtube"),
            leading: CircleAvatar(
              child: Icon(
                Icons.add_ic_call_sharp,
                color: Colors.cyanAccent,
              ),
              backgroundColor: Colors.transparent,
            ),
            trailing: Icon(Icons.share),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 200,
                width: width,
                color: Colors.white,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Provider Data ",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: "(Rich Text):",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: providerData.value.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: width,
                color: Colors.red,
                child: Image.asset("images/avatorimage.png"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: width,
                color: Colors.red,
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: width,
                color: Colors.red,
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("images/avatorimage.png"),
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 200,
                width: width,
                color: Colors.red,
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: width,
                color: Colors.red,
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
      ),
      Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: const Text("Its a card"),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: const Text("Its a card"),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30))),
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: const Text("Its a card"),
              ),
            ),
            Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: const Text("Its a card"),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
      ),
      Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: Colors.red),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.green),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.blue),
          ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: CircleAvatar(
          radius: 50,
          child: GestureDetector(
            child: const Hero(
              tag: "add",
              child: Icon(
                Icons.add_a_photo,
                size: 250,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Page2()));
            },
          ),
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Row"),
        ),
        body: LiquidSwipe(pages: pages),
      ),
    );
  }
}
