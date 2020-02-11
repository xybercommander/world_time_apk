import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //getting the data from the load route
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //setting the background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/night.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: <Widget> [
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2
                      )
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66
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