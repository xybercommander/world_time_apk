import 'package:flutter/material.dart';
import 'package:world_time/services/hex_color.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    Color morningColor = HexColor("#34596C");
    Color nightColor = HexColor("#10193A");

    //getting the data from the load route
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //setting the background
    String bgImage = (data['isDayTime'] == true) ? 'animeMorning.jpg' : 'animeNight.jpg';
    Color bgColor = (data['isDayTime'] == true) ?  morningColor : nightColor;

    return Scaffold(

      backgroundColor: bgColor,

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: <Widget> [
                /*1*/
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[400],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                /*2*/
                SizedBox(height: 20),
                /*3*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*1*/
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.orange[100],
                      )
                    )
                  ],
                ),
                /*2*/
                SizedBox(height: 20),
                /*3*/
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.orange[100],
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}