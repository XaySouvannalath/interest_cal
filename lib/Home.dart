import 'package:flutter/material.dart';
import 'package:interest_calculator/Interest.dart';

import 'Auth/Login.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool value = false;

  Widget txtname = Text("Saiyavong");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Homee"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(border: Border.all()),
              height: 200.0,
              width: 200.0,
              child: Image.network(
                  "https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  value = !value;
                });
              },
              child: Icon(Icons.flare),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            
            value == true ? txtname : SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.yellowAccent,
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.teal,
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.lightBlue,
                ),
              ],
            )
          ],
        )),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Login'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> Login())
                  );
                },
              ),
              ListTile(
                title: Text('Interest'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=> Interest())
                  );
                },
              ),
            ],
          ),
        ));
  }
}
