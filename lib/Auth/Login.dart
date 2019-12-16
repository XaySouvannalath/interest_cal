import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                icon: Icon(Icons.verified_user),
                hintText: "Username",
              )),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_open), hintText: "Password"),
                obscureText: showPassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: showPassword,
                    onChanged: (value) {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                  Text("show password")
                ],
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                onPressed: () {},
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
