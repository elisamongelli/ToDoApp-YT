import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:todoapp/models/assets/global.dart';
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
  Icon visible = Icon(Symbols.visibility_rounded);


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
            onTap: () => widget.scrollToFocusedField(widget.firstNameFocusNode),
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.id_card_rounded, color: goldSecondaryColor),
              hintText: "First Name (optional)",
              hintStyle: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w400),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkGreyColor)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: goldSecondaryColor)
              )
            ),
          ),
          TextField(
            controller: signupLastNameController,
            focusNode: widget.lastNameFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.lastNameFocusNode),
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.id_card_rounded, color: goldSecondaryColor),
              hintText: "Last name (optional)",
              hintStyle: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w400),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: darkGreyColor)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: goldSecondaryColor)
              )
            ),
          ),
          TextField(
            controller: signupEmailController,
            focusNode: widget.emailFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.emailFocusNode),
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.mail_rounded, color: goldSecondaryColor),
              hintText: "Email",
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
            controller: signupUsernameController,
            focusNode: widget.usernameFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.usernameFocusNode),
            style: TextStyle(color: darkGreyColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              icon: Icon(Symbols.person_rounded, color: goldSecondaryColor),
              hintText: "Username",
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
            controller: signupPasswordController,
            focusNode: widget.passwordFocusNode,
            onTap: () => widget.scrollToFocusedField(widget.passwordFocusNode),
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