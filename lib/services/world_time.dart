import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //Location name for the UI
  String time; //Time in that location
  String flag; //url to asset flag icon
  String url; //will store the url of location for API endpoint
  bool isDayTime; //true = dayTime, false = nightTime
  int hour;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    /*Calling the world time API*/

    try {

    //making the request from the API
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    
    //get properties from the json
    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    String offset_hour = offset.substring(1, 3);
    String offset_min = offset.substring(4, 6);

    // print(datetime);
    // print(offset);
    // print(offset_hour);
    // print(offset_min);

    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset_hour), minutes: int.parse(offset_min)));
    
    //set the time property
    isDayTime = now.hour > 6 && now.hour < 19 ? true : false;  
    time = DateFormat.jm().format(now);

    }
    catch (e) {
      print(e);
      time = 'Could not get time data';
    }
  
  }

}


