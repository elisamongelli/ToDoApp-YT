import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../UI/Login/loginscreen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  
  bool _isObscured = true;
  Icon visible = Icon(CupertinoIcons.eye_fill);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 60),
        child: Column(
          children: <Widget>[
            TextField(
              controller: loginUsernameEmailController,
              decoration: InputDecoration(hintText: "Username or Email"),
            ),
            TextField(
              obscureText: _isObscured,
              enableSuggestions: false,
              autocorrect: false,
              controller: loginPasswordController,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: visible,
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                      
                      _isObscured ? 
                        visible = Icon(CupertinoIcons.eye_fill) :
                        visible = Icon(CupertinoIcons.eye_slash_fill);
                    });
                  },
                )
              ),
            ),
          ],
        ));
  }
}
