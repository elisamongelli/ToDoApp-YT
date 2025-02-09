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
  void initState() {
    super.initState();
    widget.firstNameFocusNode.debugLabel = 'First Name';
    widget.lastNameFocusNode.debugLabel = 'Last Name';
    widget.emailFocusNode.debugLabel = 'Email';
    widget.usernameFocusNode.debugLabel = 'Username';
    widget.passwordFocusNode.debugLabel = 'Password';
  }


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
            onTap: () {
              widget.scrollToFocusedField(widget.firstNameFocusNode);
              // _requestFocus(widget.firstNameFocusNode);
            },
            // onChanged: (value) => widget.scrollToFocusedField(widget.firstNameFocusNode),
            decoration: InputDecoration(hintText: "First Name (optional)"),
          ),
          TextField(
            controller: signupLastNameController,
            focusNode: widget.lastNameFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.lastNameFocusNode),
            // onChanged: (value) => widget.scrollToFocusedField(widget.lastNameFocusNode),
            decoration: InputDecoration(hintText: "Last name (optional)"),
          ),
          TextField(
            controller: signupEmailController,
            focusNode: widget.emailFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.emailFocusNode),
            // onChanged: (value) => widget.scrollToFocusedField(widget.emailFocusNode),
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: signupUsernameController,
            focusNode: widget.usernameFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.usernameFocusNode),
            // onChanged: (value) => widget.scrollToFocusedField(widget.usernameFocusNode),
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            obscureText: _isObscured,
            enableSuggestions: false,
            autocorrect: false,
            controller: signupPasswordController,
            focusNode: widget.passwordFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.passwordFocusNode),
            // onChanged: (value) => widget.scrollToFocusedField(widget.passwordFocusNode),
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


  /* void _requestFocus(FocusNode focusNode) {

    Future.delayed(const Duration(milliseconds: 100), () {

      if (focusNode.context != null && focusNode.context!.mounted) {//&& !focusNode.hasFocus) {

        FocusScope.of(context).requestFocus(focusNode);
        print("Focus richiesto per ${focusNode.debugLabel}");

      } else {

        print('Contesto non valido o widget non montato per: ${focusNode.debugLabel}');
        print('Contesto: ${focusNode.context}');
        print('Widget montato: ${focusNode.context?.mounted}');

      }
    });
  } */
}