import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../UI/Login/loginscreen.dart';


class SignupWidget extends StatefulWidget {

  final FocusNode emailFocusNode;
  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  final Function(FocusNode) scrollToFocusedField;
  
  const SignupWidget({
    super.key,
    required this.emailFocusNode,
    required this.usernameFocusNode,
    required this.passwordFocusNode,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
    required this.scrollToFocusedField
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
            onTap: () => widget.scrollToFocusedField(widget.firstNameFocusNode),
            onChanged: (value) => widget.scrollToFocusedField(widget.firstNameFocusNode),
          ),
          TextField(
            controller: signupLastNameController,
            focusNode: widget.lastNameFocusNode,
            decoration: InputDecoration(hintText: "Last name (optional)"),
            onTap: () => widget.scrollToFocusedField(widget.lastNameFocusNode),
            onChanged: (value) => widget.scrollToFocusedField(widget.lastNameFocusNode),
          ),
          TextField(
            controller: signupEmailController,
            focusNode: widget.emailFocusNode,
            decoration: InputDecoration(hintText: "Email"),
            onTap: () => widget.scrollToFocusedField(widget.emailFocusNode),
            onChanged: (value) => widget.scrollToFocusedField(widget.emailFocusNode),
          ),
          TextField(
            controller: signupUsernameController,
            focusNode: widget.usernameFocusNode,
            decoration: InputDecoration(hintText: "Username"),
            onTap: () => widget.scrollToFocusedField(widget.usernameFocusNode),
            onChanged: (value) => widget.scrollToFocusedField(widget.usernameFocusNode),
          ),
          TextField(
            obscureText: _isObscured,
            enableSuggestions: false,
            autocorrect: false,
            controller: signupPasswordController,
            focusNode: widget.passwordFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.passwordFocusNode),
            onChanged: (value) => widget.scrollToFocusedField(widget.passwordFocusNode),
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