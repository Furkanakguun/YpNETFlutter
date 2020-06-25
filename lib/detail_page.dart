import 'package:YpNET/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:YpNET/model/action.dart';

class DetailPage extends StatelessWidget {
  final NotificationAction notfactions;
  DetailPage({Key key, this.notfactions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topcontext =Container(
    width: 700,
    height: 250,
    child: Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.yellow[800],
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.notification_important, size: 70,),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(notfactions.title, style: TextStyle(color: Color.fromRGBO(64, 75, 96, .9),fontSize: 24.0,fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 20.0),
            child: Text(notfactions.content,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          ),
        ],
      ),
    ),
  );
    Widget readButton = Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new IconButton(
                    icon: new Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                      size: 50.0,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    }),
                    SizedBox(height: 15.0,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Geri",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new IconButton(
                    icon: new Icon(
                      Icons.near_me,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    onPressed: () {}),
                    SizedBox(height: 15.0,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "İçeriğe Git",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[topcontext, readButton],
        ),
      ),
    );
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[bottomContent],
      ),
    );
  }
}

final topAppBar = AppBar(
  elevation: 0.1,
  backgroundColor: Colors.red[900],
  title: Text("YpNet"),
  // actions: <Widget>[
  //   IconButton(
  //     icon: Icon(Icons.list),
  //     onPressed: () {},
  //   )
  // ],
);
