import 'package:material_symbols_icons/material_symbols_icons.dart';
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
  Icon visible = Icon(Symbols.visibility_rounded);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 60),
      child: Column(
        children: <Widget>[
          TextField(
            controller: loginUsernameEmailController,
            focusNode: widget.usernameEmailFocusNode,
            // onTap: () => widget.scrollToFocusedField(widget.usernameEmailFocusNode),
            onTap: () {
              widget.scrollToFocusedField(widget.usernameEmailFocusNode);
              // Forza il ripristino del cursore
              Future.delayed(const Duration(milliseconds: 1000), () {
                loginUsernameEmailController.selection = TextSelection.collapsed(
                  offset: loginUsernameEmailController.text.length,
                );
              });
            },
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.person_rounded, color: goldSecondaryColor),
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
            // onTap: () => widget.scrollToFocusedField(widget.passwordFocusNode),
            onTap: () {
              widget.scrollToFocusedField(widget.passwordFocusNode);
              // Forza il ripristino del cursore
              Future.delayed(const Duration(milliseconds: 1000), () {
                loginPasswordController.selection = TextSelection.collapsed(
                  offset: loginPasswordController.text.length,
                );
              });
            },
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.password_rounded, color: goldSecondaryColor),
              hintText: "Password",
              hintStyle: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w400),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkGreyColor)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: goldSecondaryColor)
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
              ),
              suffixIcon: IconButton(
                icon: visible,
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                    
                    _isObscured ? 
                      visible = Icon(Symbols.visibility_rounded) :
                      visible = Icon(Symbols.visibility_off_rounded);
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
