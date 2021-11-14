import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice_app/data.dart';
import 'package:practice_app/list_container.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  //int value = 0;
  // Increment(){
  //   setState(() {
  //     value++;
  //   });
  // }
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;
  var _textSize = 50.5;
  String? dropdownValue = '1';

  Future getDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    setState(() {
      _dateTime = date;
    });
  }

  Future getTime() async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Provider value: " + providerData.value.toString(),
              style: TextStyle(fontSize: _textSize),
            ),
            Slider(
              value: _textSize,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _textSize = value;
                });
              },
            ),
            Text(
              "Dropdown value: " + dropdownValue.toString(),
              style: TextStyle(fontSize: _textSize),
            ),
            DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("One"),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text("Two"),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text("Three"),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                providerData.Increment();
              },
              icon: const Icon(Icons.paste_rounded),
              label: const Text("Increase"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListContainer()));
              },
              icon: const Icon(Icons.mobile_screen_share),
              label: const Text("Show Page"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 250,
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text("One"),
                            subtitle: Text("This is One"),
                            trailing: Icon(Icons.access_alarm),
                          ),
                          ListTile(
                            title: Text("Two"),
                            subtitle: Text("This is Two"),
                            trailing: Icon(Icons.access_alarm),
                          ),
                          ListTile(
                            title: Text("Three"),
                            subtitle: Text("This is Three"),
                            trailing: Icon(Icons.access_alarm),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.mobile_screen_share),
              label: const Text("Show Bottom sheet"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete ?"),
                      content: const Text("Do you want to delete?"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Delete"))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
              label: const Text("Show Alert Dialog"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Alert",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "This is the description This is the description This is the description This is the description ",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -50,
                            child: CircleAvatar(
                              radius: 50,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                child: Image.asset("images/avatorimage.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.nineteen_mp),
              label: const Text("Custom Alert Dialog"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('A SnackBar has been shown.'),
                    backgroundColor: Colors.brown,
                    duration: Duration(seconds: 2),
                    // action: SnackBarAction(label: "Ok", onPressed: (){},),
                  ),
                );
              },
              icon: const Icon(Icons.paste_rounded),
              label: const Text("Snack Bar"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "I am a toast",
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    gravity: ToastGravity.BOTTOM);
              },
              icon: const Icon(Icons.twelve_mp),
              label: const Text("Toast"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                getDate();
              },
              icon: const Icon(Icons.sixty_fps_select_outlined),
              label: Text(
                  _dateTime == null ? "GetDate" : _dateTime!.year.toString()),
            ),
            ElevatedButton.icon(
              onPressed: () {
                getTime();
              },
              icon: const Icon(Icons.sixty_fps_select_outlined),
              label: Text(
                  _timeOfDay == null ? "GetTime" : _timeOfDay.toString()),
            ),
          ],
        ),
      ),
    ));
  }
}
