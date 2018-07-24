import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'package:flutter_login/registration.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Login',
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _FormState();
  }
}

class _FormState extends State<MyHomePage> {
  final formKey = new GlobalKey<FormState>();
  String _name,_email;
  final FocusNode myFocusNode = new FocusNode();
  final FocusNode textSecondFocusNode = new  FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    textSecondFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Login'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new ListView(
        children: <Widget>[
          new Form(
            key: formKey,
            child: new Column(
            //  crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Name",
                    labelText: 'Name',
                    icon: const Icon(Icons.person),
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  validator: (value) => (value.isEmpty)? 'Please enter name' : null,
                  onSaved: (value)=>_name = value,

                  onFieldSubmitted: (String value) {
                    FocusScope.of(context).requestFocus(textSecondFocusNode); //focus to next text when done button click
                  },
                ),

                new TextFormField(
                  obscureText: true, // password invisible
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: 'Password',
                    icon: const Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) => (value.length < 5) ? 'Password is to short' : null,
                  onSaved: (value)=>_email = value,
                  focusNode: textSecondFocusNode,
                ),

                new Padding(padding: EdgeInsets.all(5.0)),


                new GestureDetector(

                  onTap: () {
                    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                        (BuildContext context, _, __) {
                      return new Forgot();
                    }, transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                      return new FadeTransition(
                          opacity: animation, child: child);
                    }));

                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Forgot Password?",style: new TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.end,)
                    ],
                  ),

               /* child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text('Forgot Password?'),
                  ),*/


                ),


                new Padding(padding: EdgeInsets.all(16.0)),

                new Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.lightBlueAccent.shade100,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 400.0,
                    height: 42.0,
                    onPressed: () {
                      submit();
                    },
                    color: Colors.lightBlueAccent,
                    child: Text('Log In', style: TextStyle(color: Colors.white)),
                  ),
                ),

                new Padding(padding: EdgeInsets.all(16.0)),

                new Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.lightBlueAccent.shade100,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 400.0,
                    height: 42.0,
                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                          (BuildContext context, _, __) {
                        return new RegistrationState();
                      }, transitionsBuilder:
                          (_, Animation<double> animation, __, Widget child) {
                        return new FadeTransition(
                            opacity: animation, child: child);
                      }));

                    },
                    color: Colors.lightBlueAccent,
                    child: Text('Register', style: TextStyle(color: Colors.white)),
                  ),
                ),

              /*  new Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: new RaisedButton(

                    onPressed: () {
                      Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                              (BuildContext context, _, __) {
                            return new Registration();
                          }, transitionsBuilder:
                              (_, Animation<double> animation, __, Widget child) {
                            return new FadeTransition(
                                opacity: animation, child: child);
                          }));
                    },
                    child: new Text('Register'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),*/

              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  void submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, _, __) {
      return new home();
    }, transitionsBuilder:
        (_, Animation<double> animation, __, Widget child) {
      return new FadeTransition(
          opacity: animation, child: child);
    }));
  }
}

class Forgot  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPassword();
  }
}




class ForgotPassword extends State<Forgot>{

  final formKey = new GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();

  FocusNode nextFocusNode = new FocusNode();
  String _password;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        key: key,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column(
               // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[

                  new TextFormField(
                    obscureText: true, // password invisible
                    decoration: new InputDecoration(
                      hintText: "New Password",
                      labelText: 'New Password',
                      // icon: const Icon(Icons.lock),
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(nextFocusNode); //focus to next text when keyboard
                      // done button click
                    },
                    validator: (value)=> (value.length < 5) ? 'Password is to short? at least 5 character' : null,
                    controller: myController,
                    onSaved: (String value) {
                      _password = value;
                    },
                  ),

                  new TextFormField(
                    obscureText: true, // password invisible
                    decoration: new InputDecoration(
                      hintText: "Confirm New Password",
                      labelText: 'Confirm New Password',
                      // icon: const Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.text,
                    focusNode: nextFocusNode,
                    validator: (value){
                      if(myController.text==value){
                      }else{
                        if(value.isEmpty){
                          return "Please enter confirm password";
                        }else {
                          return "password mismatch";
                        }
                      }
                    },

                  ),

                  new Padding(padding: EdgeInsets.all(16.0)),

                  new Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightBlueAccent.shade100,
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 400.0,
                      height: 42.0,
                      onPressed: () {
                        final form = formKey.currentState;
                        if (form.validate()) {

                          key.currentState.showSnackBar(new SnackBar(
                              content: new Text('Password reset successfully') // message at the bottom
                          ));

                          new Future.delayed(const Duration(seconds: 2), () {

                            Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                                (BuildContext context, _, __) {
                              return new MyApp();
                            }, transitionsBuilder:
                                (_, Animation<double> animation, __, Widget child) {
                              return new FadeTransition(
                                  opacity: animation, child: child);
                            }));

                          });
                        }
                      },
                      color: Colors.lightBlueAccent,
                      child: Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  ),


                ],
              ),
            ),


          ],
        ),
      )
    );
  }

}