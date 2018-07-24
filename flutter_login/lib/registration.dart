import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login/main.dart';


class RegistrationState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return Registration();
  }

}

class Registration extends State<RegistrationState>  {

  final formKey = new GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();
  FocusNode textSecondFocusNode = new FocusNode();
  FocusNode textPasswordFocuseNode = new FocusNode();
  FocusNode textPhoneNumFocusMode = new FocusNode();
  FocusNode textEmailFocusMode = new FocusNode();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      key: key,
      //drawer: new Drawer(),
      appBar: new AppBar(
        title: new Text('Registration'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column(
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

                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(textSecondFocusNode); //focus to next text when keyboard
                                                                                // done button click
                    },

                  ),

                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Last Name",
                      labelText: 'Last Name',
                      icon: const Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    focusNode: textSecondFocusNode,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(textPasswordFocuseNode);
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
                    validator: (value) => (value.length < 5) ? 'Password is to short? at least 5 character' : null,
                    focusNode: textPasswordFocuseNode,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(textPhoneNumFocusMode);
                    },
                  ),

                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Phone Number",
                      labelText: 'Phone Number',
                      icon: const Icon(Icons.phone),

                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    validator: (value) => (value.trim().length < 10) ? 'Phone Number is not valid' : null,
                    focusNode: textPhoneNumFocusMode,
                    onFieldSubmitted: (String value) {
                      FocusScope.of(context).requestFocus(textEmailFocusMode);
                    },
                  ),

                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Email address",
                      labelText: 'Email address',
                      icon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => (!value.contains('@')) ? 'Email Id is not valid' : null,
                    focusNode: textEmailFocusMode,
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
                              content: new Text('Registration successful') // message at the bottom
                          ));

                          new Future.delayed(const Duration(seconds: 2), () {
                            performRegister();
                          });

                        }
                      },
                      color: Colors.lightBlueAccent,
                      child: Text('Register', style: TextStyle(color: Colors.white)),
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

  void performRegister() {
    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, _, __) {
      return new MyApp();
    }, transitionsBuilder:
        (_, Animation<double> animation, __, Widget child) {
      return new FadeTransition(
          opacity: animation, child: child);
    }));
  }

}




