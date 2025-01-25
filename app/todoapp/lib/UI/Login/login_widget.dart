import 'package:flutter/material.dart';
import 'loginscreen.dart';


class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});


  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}


class _LoginWidgetState extends State<LoginWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        top: 60, 
        left: 40, 
        right: 40, 
        bottom: 60
      ),
      child: Column(
        children: <Widget>[
          TextField(
            controller: loginUsernameEmailController,
            decoration: InputDecoration(hintText: "Username or Email"),
          ),
          TextField(
            controller: loginPasswordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
        ],
      )
    );
  }
}