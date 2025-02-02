import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../UI/Login/loginscreen.dart';


class SignupWidget extends StatefulWidget {

  final FocusNode emailFocusNode;
  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  
  const SignupWidget({
    super.key,
    required this.emailFocusNode,
    required this.usernameFocusNode,
    required this.passwordFocusNode,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode
  });

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}


class _SignupWidgetState extends State<SignupWidget> {

  bool _isObscured = true;
  Icon visible = Icon(CupertinoIcons.eye_fill);

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
            focusNode: widget.firstNameFocusNode,
            decoration: InputDecoration(hintText: "First Name (optional)"),
          ),
          TextField(
            controller: signupLastNameController,
            focusNode: widget.lastNameFocusNode,
            decoration: InputDecoration(hintText: "Last name (optional)"),
          ),
          TextField(
            controller: signupEmailController,
            focusNode: widget.emailFocusNode,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: signupUsernameController,
            focusNode: widget.usernameFocusNode,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            obscureText: _isObscured,
            enableSuggestions: false,
            autocorrect: false,
            controller: signupPasswordController,
            focusNode: widget.passwordFocusNode,
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
      )
    );
  }
}