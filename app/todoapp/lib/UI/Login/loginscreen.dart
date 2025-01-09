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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                "Hi!",
                style: loginScreenTitle
              ),
              Text(
                "Ready to get productive?",
                style: loginScreenSubtitle
              ),
              const TextField(

              ),
              FloatingActionButton.extended(
                label: const Text("Sign up"),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                shape: const OvalBorder(),
                onPressed:() {
                  bloc.signupUser("imateapot8", "teapot8@gmail.com", "teapot", "Elisa", "Mongelli");
                },
              ),
            ],
          ),
        )
      )
    );
  }
}