import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  File? _image;
  bool? _checkValue = false;
  bool _fadeState = true;
  bool _swithcValue = false;

  Future cameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.green,
                ],
              ),
            ),
          ),
          title: const Text("App bar"),
        ),
        body: Column(
          children: [
            AnimatedContainer(
              height: _image == null ? 50 : 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  colors: [
                    Colors.pink,
                    Colors.deepPurple,
                  ],
                ),
              ),
              duration: const Duration(seconds: 1),
              child: _image == null
                  ? const Text("There is no image")
                  : Image.file(_image!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      cameraImage();
                    },
                    child: const Icon(Icons.camera),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.photo_library),
                  ),
                ],
              ),
            ),
            Dismissible(
              key: const ValueKey("abc"),
              background: Container(
                color: Colors.blue,
                child: const Icon(
                  Icons.threesixty_rounded,
                  size: 40,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  size: 40,
                ),
              ),
              child: const ListTile(
                title: Text("Dismissible Item"),
                subtitle: Text("Scroll Left Right <>"),
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
            Checkbox(
              value: _checkValue,
              onChanged: (bool? val) {
                setState(() {
                  _checkValue = val;
                });
              },
            ),
            Text(_checkValue == true ? "Checked" : "Unchecked"),
            Center(
              child: AnimatedCrossFade(
                duration: const Duration(microseconds: 50),
                firstChild: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _fadeState = false;
                    });
                  },
                  child: const Text("Show Fade Text"),
                ),
                secondChild: Container(
                  height: 100,
                  color: Colors.brown,
                  child: const Center(
                    child: Text(
                      "Its a Fade text",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                crossFadeState: _fadeState
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
            Center(
              child: Switch(
                value: _swithcValue,
                onChanged: (val) {
                  setState(() {
                    _swithcValue = val;
                  });
                },
              ),
            )
          ], // Children
        ),
      ),
    );
  }
}
