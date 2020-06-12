import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text("YpNet"),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock,
                size: 70.0,
                color: Colors.red[900],
              ),
              // CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage: AssetImage('images/icons8-user-96.png'),
              //   backgroundColor: Colors.white,
              // ),
              SizedBox(
                height: 15.0,
              ),
              Text("YpNet Giriş",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LexendTera',
                      letterSpacing: 2.5)
                 ),
                 SizedBox(height: 20.0, width: 150.0,child: Divider(color: Colors.blueGrey.shade100)),
              Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 25.0,
                    ),
                    // title:  Text(
                    //   "Kullanici Adi:",
                    //   style: TextStyle(
                    //       color: Colors.blueGrey[900], fontSize: 10.0),
                    // ),
                  )),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 90.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                    ),
                    // title: Text(
                    //   "Sifre:",
                    //   style: TextStyle(
                    //       color: Colors.blueGrey[900], fontSize: 10.0),
                    // ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
