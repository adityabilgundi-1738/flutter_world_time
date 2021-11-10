import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin',flag: "germany.png",url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}
