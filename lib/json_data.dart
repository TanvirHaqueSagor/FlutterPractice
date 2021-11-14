import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/json_details.dart';


class JsonData extends StatefulWidget {
  const JsonData({Key? key}) : super(key: key);

  @override
  _JsonDataState createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {
  var _data;
  Future getJsonData() async{
    var url = Uri.https('reqres.in', '/api/users', {'page': '2'});
    var response = await http.get(url);
    setState(() {
      var decode = json.decode(response.body);
      _data = decode["data"];
      print(_data);
    });
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _data==null?0:_data.length,
          itemBuilder: (context, index){
        return ListTile(
          title: Text(_data[index]["first_name"]),
          subtitle: Text(_data[index]["email"]),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsPage(receivedData: _data[index])));
          },
        );
      }),
    );
  }
}
