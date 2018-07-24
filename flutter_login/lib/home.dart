import 'package:flutter/material.dart';

const String _AccountName = 'Hemanth R';
const String _AccountEmail = 'hemant@designstring.com';
const String _AccountAbbr = 'HR';

/*void main() {
  runApp(new Keeper());
}*/

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Keeper',
      home: new NavigationDrawer(),
      theme: new ThemeData(primaryColor: Colors.blue.shade700),
      // Routes
      routes: <String, WidgetBuilder>{
        Notes.routeName: (BuildContext context) => new Notes(),
      },
    );
  }
}


class Todo {
  final String title;
  final String email;
  final String name;

  Todo(this.title, this.email, this.name);
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    // TODO: implement build
    return new Scaffold(
      key: key,
      drawer: new Drawer(
        // child: new Column(children: <Widget>[
        child: new ListView(
          //Drawer child, Column Widget doesn’t support scroll. So we replaced it with ListView.
          padding: const EdgeInsets.only(top: 0.0), // ListView adds padding at the top,
          // that makes drawer header with a white background under notification bar. So we added top padding as 0.0.
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text(_AccountName),
              accountEmail: const Text(_AccountEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.brown,
                child: new Text(_AccountAbbr),
              ),
              onDetailsPressed: () {
                Navigator.pop(context); // close navigation drawer
                Navigator.of(context).push(new PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) {
                      return new UserDetail(todo: Todo(_AccountName, _AccountEmail,"Flutter"));
                    }, transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
                      return new FadeTransition(
                          opacity: animation, child: child);
                    }));
              },
            ),

            new ListTile(
              leading: new Icon(Icons.lightbulb_outline),
              title: new Text('Notes'),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed(Notes.routeName) will not have
                // transition animation and can be used for modal forms
                // Which we will see in Forms & Validation.
                // Navigator.of(context).pushNamed(Notes.routeName);

                // To add transition we are using PageRouteBuilder
                Navigator.of(context).push(new PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                      return new Notes();
                    }, transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                      return new FadeTransition(
                          opacity: animation, child: child);
                    }));
              },
              onLongPress: (){
                Navigator.pop(context);
                key.currentState.showSnackBar(new SnackBar(
                    content: new Text('NOTES') // message at the bottom
                ));
              },
            ),

            new ListTile(
              leading: new Icon(Icons.person_outline),
              title: new Text('My Profile'),
              onTap: (){

              },
            ),

            new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text('Settings'),
              onTap: (){

              },
            ),

           // new Divider(),
            new Container(
              margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
              child: new Divider(),
            ),

            new ListTile(
              leading: new Icon(Icons.help_outline),
              title: new Text('Help & feedback'),
              onTap: (){

              },
            ),

          ],
        ),
      ),

      appBar: new AppBar(
        title: new Text('Navigation Drawer'),
        centerTitle: false,
        actions: <Widget>[
          // action button

          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: null,
            itemBuilder: (BuildContext context) {
              return choices.skip(0).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(choice.icon),
                        Text(choice.title),
                      ],
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),

      body: Center(
       // child: new Text('Hello World!',style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5)),
        child: new Text('Hello World!',style: TextStyle(fontStyle: FontStyle.italic),softWrap: false,),
      ),

    );
  }
}

_onTapOtherAccounts(context) {
  Navigator.of(context).pop();
  showDialog<Null>(
    context: context,
    child: new AlertDialog(
      title: const Text('Account switching not implemented.'),
      actions: <Widget>[
        new FlatButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

_onListTileTap(BuildContext context) {
  Navigator.of(context).pop();
  showDialog<Null>(
    context: context,
    child: new AlertDialog(
      title: const Text('Not Implemented'),
      actions: <Widget>[
        new FlatButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

class Notes extends StatelessWidget {
  static final String routeName = '/notes';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: new Drawer(),
      appBar: new AppBar(
        title: new Text('Notes'),
      ),
      body: new Center(
        child: ListView(
          children: [
            Image.asset(
              'images/donald.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                new Text(
                      'Flutter is an open-source mobile application framework created by Google',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.bold)),

                new Padding(
                    padding: new EdgeInsets.all(5.0),
                    child: const Text('It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia.'),
                    ),

                new Text(
                    'The first version of Flutter was known as "Sky" and ran on the Android operating system.'),

                new Text(
                    'It was unveiled at the 2015 Dart developer summit, with the stated intent of being able to render consistently at 120 frames per second.'),

                new Text(
                    'The major components of Flutter include:Flutter engine Foundation library Design-specific widgets.'),

                new Text('FLUTTER!',
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Expense extends StatelessWidget {
  static final String routeName = '/expense';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: new Drawer(),
      appBar: new AppBar(
        title: new Text('Expense'),
      ),
      body: new Center(
        child: new Text('Expense', style: new TextStyle(fontSize: 24.0)),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class UserDetail extends StatelessWidget {

  final Todo todo;
  UserDetail({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(todo.title,style: TextStyle(fontSize: 30.0)),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Text('${todo.email}',style: TextStyle(fontSize: 25.0)),
            new Padding(padding: EdgeInsets.all(5.0)),
            new Text('${todo.name.toUpperCase()}',style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
