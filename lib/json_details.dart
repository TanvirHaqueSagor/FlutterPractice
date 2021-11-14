import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var receivedData;

  DetailsPage({this.receivedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            child: Image.network(receivedData["avatar"]),
          ),
          Text(
            "Name: ${receivedData["first_name"]}",
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
