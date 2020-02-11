import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    /*This is example of calling an API from a website*/
    // Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    /*Calling the world time API*/

    //making the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Map data = jsonDecode(response.body);
    
    //get properties from the data
    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    String offset_hour = offset.substring(1, 3);
    String offset_min = offset.substring(4, 6);

    // print(datetime);
    print(offset);

    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset_hour), minutes: int.parse(offset_min)));
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
      appBar: AppBar(
        title: Text('Loading screen'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),  
      body: SafeArea(
        child: Text('Loading screen')
      ),
    );
  }
}