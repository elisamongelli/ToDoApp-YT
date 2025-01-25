import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/UI/Login/login_widget.dart';
import 'package:todoapp/UI/Login/signup_widget.dart';
import '../../models/assets/global.dart';
import 'package:todoapp/bloc/blocs/user_bloc_provider.dart';


TextEditingController signupEmailController = TextEditingController();
TextEditingController signupUsernameController = TextEditingController();
TextEditingController signupPasswordController = TextEditingController();
TextEditingController signupFirstNameController = TextEditingController();
TextEditingController signupLastNameController = TextEditingController();

TextEditingController loginUsernameEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();


class LoginPage extends StatefulWidget {

  // final VoidCallback redirectHomePage;
  final Function() redirectHomePage;

  const LoginPage({super.key, required this.redirectHomePage});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  bool _signupResourceBlocked = false;


  @override
  Widget build(BuildContext context) {

    signupEmailController = TextEditingController();
    signupUsernameController = TextEditingController();
    signupPasswordController = TextEditingController();
    signupFirstNameController = TextEditingController();
    signupLastNameController = TextEditingController();

    
    loginUsernameEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              color: lightGreyColor,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 375,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                      )
                    ),
                    child: Column(
                      children: [
                        Text("Hi!", style: loginScreenTitle),
                        Text("Ready to get productive?", style: loginScreenSubtitle),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          child: TabBar(
                            tabs: const [
                              Tab(
                                text: "Login",
                              ),
                              Tab(
                                text: "Sign up",
                              ),
                            ],
                            labelColor: redMainColor,
                            labelStyle: tabBarLabel,
                            unselectedLabelColor: darkGreyColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorPadding: const EdgeInsets.all(5.0),
                            indicatorColor: Colors.transparent,
                            dividerColor: Colors.transparent,
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            children: <Widget>[
                              LoginWidget(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: redMainColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {
                          
                                  Fluttertoast.showToast(
                                    msg: "toast test",
                                    toastLength: Toast.LENGTH_SHORT
                                  );
                                },
                                child: Text("Login!"),
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            children: <Widget>[
                              SignupWidget(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: redMainColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {
                                          
                                  _signupResourceBlocked = true;
                                  
                                  if (signupUsernameController.text.isNotEmpty && 
                                      signupPasswordController.text.isNotEmpty &&
                                      signupEmailController.text.isNotEmpty) {
                                          
                                      await bloc.signupUser(
                                        signupUsernameController.text,
                                        signupEmailController.text,
                                        signupPasswordController.text,
                                        signupFirstNameController.text,
                                        signupLastNameController.text
                                      ).then((_) {
                                        _signupResourceBlocked = false;
                                          
                                        Fluttertoast.showToast(
                                          msg: "Successfully signed up!",
                                          toastLength: Toast.LENGTH_SHORT
                                        );
                                          
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
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
