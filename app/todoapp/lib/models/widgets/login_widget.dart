import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/assets/global.dart';
import '../../UI/Login/loginscreen.dart';



class LoginWidget extends StatefulWidget {

  final FocusNode usernameEmailFocusNode;
  final FocusNode passwordFocusNode;
  final Function(FocusNode) scrollToFocusedField;

  
  const LoginWidget({
    super.key,
    required this.usernameEmailFocusNode,
    required this.passwordFocusNode,
    required this.scrollToFocusedField
  });


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
            focusNode: widget.usernameEmailFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.usernameEmailFocusNode),
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Icons.add_ic_call_outlined, color: goldSecondaryColor),
              hintText: "Username or Email",
              hintStyle: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w400),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkGreyColor)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: goldSecondaryColor)
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
              )
            ),
          ),
          TextField(
            obscureText: _isObscured,
            enableSuggestions: false,
            autocorrect: false,
            controller: loginPasswordController,
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
}
