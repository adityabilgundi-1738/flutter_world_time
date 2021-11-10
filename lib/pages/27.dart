import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  getTime() async{
    //making the request
    http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);

    //get properties from json data

    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(utc_offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(utc_offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
