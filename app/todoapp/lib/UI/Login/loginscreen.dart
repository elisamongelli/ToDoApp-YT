import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/assets/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/bloc/blocs/user_bloc_provider.dart';


class LoginPage extends StatefulWidget {

  // final VoidCallback redirectHomePage;
  final Function() redirectHomePage;

  const LoginPage({super.key, required this.redirectHomePage});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  bool _signupResourceBlocked = false;
  
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    print("SONO NEL BUILD DI LOGIN SCREEN");

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text("Hi!", style: loginScreenTitle),
                  Text("Ready to get productive?", style: loginScreenSubtitle),
                  Container(
                    margin: EdgeInsets.only(
                      top: 60, 
                      left: 40, 
                      right: 40, 
                      bottom: 60
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(hintText: "First Name (optional)"),
                        ),
                        TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(hintText: "Last name (optional)"),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(hintText: "Username"),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ],
                    )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redMainColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {

                      _signupResourceBlocked = true;
                      
                      if (usernameController.text.isNotEmpty && 
                          passwordController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {

                          await bloc.signupUser(
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            firstNameController.text,
                            lastNameController.text
                          ).then((_) {
                            _signupResourceBlocked = false;

                            Fluttertoast.showToast(msg: "Successfully signed up!");

                            widget.redirectHomePage();
                          });

                      } else {

                        Fluttertoast.showToast(msg: "Required fields missing");
                      
                      }
                    },
                    child: Text("Sign up!"),
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
