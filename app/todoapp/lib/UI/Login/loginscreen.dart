// import 'dart:js_interop';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../../models/assets/global.dart';
import 'package:todoapp/models/classes/user.dart';
import 'package:todoapp/bloc/blocs/user_bloc_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Text("Hi!", style: loginScreenTitle),
            Text("Ready to get productive?", style: loginScreenSubtitle),
            Container(
                margin:
                    EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 60),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(hintText: "First Name"),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(hintText: "Last name"),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                  ],
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: redMainColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                bloc.signupUser(
                  usernameController.text,
                  emailController.text,
                  passwordController.text,
                  firstNameController.text,
                  lastNameController.text
                );
              },
              child: Text("SIGN UP DAJE"),
            ),/* 
            FloatingActionButton.extended(
              label: const Text("Sign up"),
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              shape: const OvalBorder(),
              onPressed: () {
                
              },
            ), */
          ],
        ),
      ),
    )));
  }
}
