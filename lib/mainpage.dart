import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:YpNET/model/action.dart';
import 'package:YpNET/detail_page.dart';
import 'package:YpNET/login.dart';

void main() => runApp(new MainPage());
// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List items;
  void initState() {
    NotificationAction noaction = new NotificationAction();
    items = noaction.getActions();
    super.initState();
  }

  Widget _buildMoviesList() {
    return Container(
      
      child: items.length > 0
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: 
                      Icon(Icons.delete,color: Colors.white,size: 35.0,)
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: NotfActionCard(notfaction: items[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('Bildirminiz Bulunmamaktadır',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0,fontFamily: 'LexendTera'),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Colors.red[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage()));
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.account_box, color: Colors.white),
            //   onPressed: () {},
            // ),
             IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Login()));
              },
            )
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      appBar: AppBar(
        title: Text('YpNet'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildMoviesList(),
      ),
      bottomNavigationBar: makeBottom,
    );
    
  }
}

class NotfActionCard extends StatelessWidget {
  final NotificationAction notfaction;

  NotfActionCard({this.notfaction});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 125.0,
      child:Card(
         shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color.fromRGBO(255,255,212,.9),
      elevation: 10,
      //color: Colors.grey[900],
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              color: Colors.yellow[900],
              size: 40.0,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(notfactions: notfaction)));
            },
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(notfaction.imageUrl),
            // ),
            title: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(notfaction.title,style :TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22.0,)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(notfaction.content,style :TextStyle(color: Colors.black,fontSize: 16.0,)),
            ),
            trailing: Text(notfaction.date,style :TextStyle(color: Colors.black,)),
            
          )
        ],
      ),
    )
    );
  }
}
