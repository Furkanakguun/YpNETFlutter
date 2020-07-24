import 'package:YpNET/services/ypnetService.dart';
import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'package:YpNET/model/ypnet_user.dart';
import 'dart:convert';

void main() {
  runApp(
    new MaterialApp(
      home: new Login(),
      routes: <String, WidgetBuilder>{
        "/MainPage": (BuildContext contex) => new MainPage(),
        "/Login": (BuildContext contex) => new Login()
      },
    ),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  var ypnetUsers = new List<YpNetUser>();
  var ypnetUsersTemp = new List<YpNetUser>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _getUsers() {
    YpNetServices.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body)['results'];
        ypnetUsers = list.map((model) => YpNetUser.fromJson(model)).toList();
      });
    });
    ypnetUsersTemp = getUsers();
  }

  List<YpNetUser> getUsers() {
    return [
      YpNetUser(
        'fakgun',
        '123456',
        3654,
      ),
      YpNetUser(
        'mmahmutoglu',
        '123456',
        3604,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
    controller = AnimationController(
        duration: Duration(milliseconds:  500), vsync: this);

    animation = CurvedAnimation(parent: controller,curve: Curves.decelerate); 


    controller.forward();

    controller.addListener(() {
      setState(() {
        //print(controller.value);
      });
    });
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    usernameController.text = "";
    passwordController.text = "";
    final username = TextField(
      obscureText: false,
      controller: usernameController,
      decoration: InputDecoration(
          icon: new Icon(Icons.person),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username"),
    );
    final password = TextField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        icon: new Icon(Icons.lock),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
      ),
    );

    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            title: Text("YpNet"),
          ),
          backgroundColor:
              Color.fromRGBO(58, 66, 86, 1.0),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('images/logo_light.png'),
                    width: animation.value * 180,
                  ),
                ),
                // Text("YpNet Giriş",
                //     style: TextStyle(
                //         fontSize: 21.0,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: 'LexendTera',
                //         letterSpacing: 2.5)),
                SizedBox(
                    height: 40.0,
                    width: 150.0,
                    child: Divider(color: Colors.blueGrey.shade100)),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 7.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: username,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 7.0),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: password),
                ),
                SizedBox(height: 10.0),
                ButtonTheme(
                    minWidth: 150.0,
                    height: 45.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: RaisedButton(
                        color: Colors.red[900],
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onPressed: () {
                          //  Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) => MainPage()));
                          print(ypnetUsers[0].password);
                          for (var item in ypnetUsersTemp) {
                            if (item.username == usernameController.text &&
                                item.password == passwordController.text) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                              // return showDialog(
                              //   context: context,
                              //   builder: (context) {
                              //     return AlertDialog(
                              //       content: Text("Hoşgeldiniz "),
                              //     );
                              //   },
                              // );
                            }else{
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Kullanıcı Bulunamadı "),
                                  );
                                },
                              );
                            }
                          }
                          // return showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       content: Text("Kullanıcı Bilgileri Bulunamadı "),
                          //     );
                          //   },
                          // );
                        })),
              ],
            ),
          ),
        ));
  }
}
