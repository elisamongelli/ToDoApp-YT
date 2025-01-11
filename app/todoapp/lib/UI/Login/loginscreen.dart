import 'package:flutter/material.dart';
import '../../models/assets/global.dart';
import 'package:todoapp/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/bloc/blocs/user_bloc_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    User? user;

    return Scaffold(
      body: Center(
        child: SafeArea(
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
                    

                    if (usernameController.text.isNotEmpty && 
                        passwordController.text.isNotEmpty &&
                        emailController.text.isNotEmpty /* &&
                        firstNameController.text.isNotEmpty */) {
                      user = await bloc.signupUser(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text
                      );

                      print(user.toString());


                    }

                    // if (user != null) {
                    //   await saveApiKey(user);
                    // }
                  },
                  child: Text("Sign up!"),
                ),/* 
                FloatingActionButton.extended(
                  label: const Text("Sign up"),
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  shape: const OvalBorder(),
                  onPressed: () {
                    
                  },
                ), */
              ],
            ),
          ),
        )
      )
    );
  }



  /* void saveApiKey(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('API_Token', user.api_key).toString();
  } */

  String getApiKey() {
    SharedPreferences prefs = SharedPreferences.getInstance();
    
  }
}
