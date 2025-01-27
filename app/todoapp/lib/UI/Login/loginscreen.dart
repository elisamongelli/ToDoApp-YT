import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/models/widgets/login_widget.dart';
import 'package:todoapp/models/widgets/signup_widget.dart';
import 'package:todoapp/models/widgets/toast_widget.dart';
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

  // ignore: unused_field
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
                            padding: EdgeInsets.symmetric(horizontal: 30),
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

                                  final overlay = Overlay.of(context);

                                  if (overlay != null) {
                                    final overlayEntry = OverlayEntry(
                                      builder: (context) => Positioned(
                                        bottom: 50,
                                        left: MediaQuery.of(context).size.width * 0.2,
                                        right: MediaQuery.of(context).size.width * 0.2,
                                        child: ToastWidget(
                                          message: "Successfully logged in!", 
                                          success: true
                                        )
                                      )
                                    );


                                    overlay.insert(overlayEntry);

                                    Future.delayed(const Duration(seconds: 2), () {
                                      overlayEntry.remove();
                                    });
                                  } else {
                                    print("Overlay non disponibile");
                                  }
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



  /* void showCustomToast(String message, bool success) {
    
    Widget customToast = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: darkGreyColor
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          success ? 
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ) : 
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );


    fToast.showToast(
      child: customToast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2)
    );
  } */
}
