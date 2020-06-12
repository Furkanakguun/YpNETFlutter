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
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('images/icons8-user-96.png'),
                backgroundColor: Colors.white,
              ),
              Text("YpNet Giris",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'LexendTera',letterSpacing: 2.5))
            ],
          ),
        ),
      ),
    );
  }
}
