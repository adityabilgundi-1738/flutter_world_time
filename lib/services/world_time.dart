import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; //location time for the UI
  late String flag; //url to an asset flag icon
  late String url; //location URL for API endpoints
  late bool isDayTime; //true means it is day else it is night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      http.Response response = await http.get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from json data

      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(utc_offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset)));

      //set the time property
      isDayTime = (now.hour>=6 && now.hour<= 18) ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print('caught error: $e');
      time = 'could not get time data';

    }

    //making the request

  }
}



