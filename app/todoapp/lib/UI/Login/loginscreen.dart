import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import '../../models/assets/global.dart';
import 'package:todoapp/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/bloc/blocs/user_bloc_provider.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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
                      
                      if (usernameController.text.isNotEmpty && 
                          passwordController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        user = await bloc.signupUser(
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                          firstNameController.text,
                          lastNameController.text
                        );
                      }

                      if (user != null) {
                        String savedApiKey = await getApiKey();
                        print("User is not empty. Its apikey is " + savedApiKey);

                        //TODO : if is not empty --> redirect to HOMEPAGE
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


  Future<String> getApiKey() async {
    String localApiKey;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    localApiKey = prefs.getString('Api_Token') ?? 'Api Key not stored';

    return localApiKey;
  }
}
