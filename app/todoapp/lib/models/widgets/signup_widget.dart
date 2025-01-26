import 'package:flutter/material.dart';
import '../../UI/Login/loginscreen.dart';


class SignupWidget extends StatefulWidget {
  
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}


class _SignupWidgetState extends State<SignupWidget> {

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
            controller: signupFirstNameController,
            decoration: InputDecoration(hintText: "First Name (optional)"),
          ),
          TextField(
            controller: signupLastNameController,
            decoration: InputDecoration(hintText: "Last name (optional)"),
          ),
          TextField(
            controller: signupEmailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: signupUsernameController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            controller: signupPasswordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
        ],
      )
    );
  }
}