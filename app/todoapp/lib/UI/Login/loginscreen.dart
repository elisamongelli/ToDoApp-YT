import 'package:flutter/material.dart';
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

  final ScrollController _scrollController = ScrollController();

  final FocusNode _loginUsernameEmailFocus = FocusNode();
  final FocusNode _loginPasswordFocus = FocusNode();

  final FocusNode _signupEmailFocus = FocusNode();
  final FocusNode _signupUsernameFocus = FocusNode();
  final FocusNode _signupPasswordFocus = FocusNode();
  final FocusNode _signupFirstNameFocus = FocusNode();
  final FocusNode _signupLastNameFocus = FocusNode();

  // ignore: unused_field
  bool _signupResourceBlocked = false;


  @override
  void initState() {
    super.initState();

    _loginUsernameEmailFocus.addListener(() => _scrollToFocusedField(_loginUsernameEmailFocus));
    _loginPasswordFocus.addListener(() => _scrollToFocusedField(_loginPasswordFocus));

    _signupEmailFocus.addListener(() => _scrollToFocusedField(_signupEmailFocus));
    _signupUsernameFocus.addListener(() => _scrollToFocusedField(_signupUsernameFocus));
    _signupPasswordFocus.addListener(() => _scrollToFocusedField(_signupPasswordFocus));
    _signupFirstNameFocus.addListener(() => _scrollToFocusedField(_signupFirstNameFocus));
    _signupLastNameFocus.addListener(() => _scrollToFocusedField(_signupLastNameFocus));
  }


  @override
  void dispose() {
    _scrollController.dispose();

    _loginUsernameEmailFocus.dispose();
    _loginPasswordFocus.dispose();

    _signupEmailFocus.dispose();
    _signupUsernameFocus.dispose();
    _signupPasswordFocus.dispose();
    _signupFirstNameFocus.dispose();
    _signupLastNameFocus.dispose();

    super.dispose();
  }


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
                        controller: _scrollController,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            children: <Widget>[
                              LoginWidget(
                                usernameEmailFocusNode: _loginUsernameEmailFocus,
                                passwordFocusNode: _loginPasswordFocus,
                                scrollToFocusedField: _scrollToFocusedField,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: redMainColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {

                                  FocusManager.instance.primaryFocus?.unfocus();


                                  // showing toast login successful
                                  final overlay = Overlay.of(context);

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


                                  // shows toast after build is completed
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    overlay.insert(overlayEntry);
                                  });
                                  

                                  // hide toast after 2 seconds
                                  Future.delayed(const Duration(seconds: 2), () {
                                    overlayEntry.remove();
                                  });

                                },
                                child: Text("Login!"),
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        controller: _scrollController,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            children: <Widget>[
                              SignupWidget(
                                emailFocusNode: _signupEmailFocus,
                                usernameFocusNode: _signupUsernameFocus,
                                passwordFocusNode: _signupPasswordFocus,
                                firstNameFocusNode: _signupFirstNameFocus,
                                lastNameFocusNode: _signupLastNameFocus,
                                scrollToFocusedField: _scrollToFocusedField,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: redMainColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () async {

                                  FocusManager.instance.primaryFocus?.unfocus();
                                          
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
                                        

                                        // showing toast signup successful
                                        final overlay = Overlay.of(context);

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


                                        // shows toast after build is completed
                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          overlay.insert(overlayEntry);
                                        });
                                        

                                        // hide toast after 2 seconds
                                        Future.delayed(const Duration(seconds: 2), () {
                                          overlayEntry.remove();
                                        });
                                          
                                        widget.redirectHomePage();
                                      });
                                          
                                  } else {
                                    
                                    // showing toast required fields
                                    final overlay = Overlay.of(context);

                                    final overlayEntry = OverlayEntry(
                                      builder: (context) => Positioned(
                                        bottom: 50,
                                        left: MediaQuery.of(context).size.width * 0.2,
                                        right: MediaQuery.of(context).size.width * 0.2,
                                        child: ToastWidget(
                                          message: "Required fields missing!", 
                                          success: false
                                        )
                                      )
                                    );


                                    // shows toast after build is completed
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      overlay.insert(overlayEntry);
                                    });
                                    

                                    // hide toast after 2 seconds
                                    Future.delayed(const Duration(seconds: 2), () {
                                      overlayEntry.remove();
                                    });
                                  
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



  void _scrollToFocusedField(FocusNode focusNode) {

    if (focusNode.hasFocus) {

      Future.delayed(const Duration(milliseconds: 300), () {
        Scrollable.ensureVisible(
          focusNode.context!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: 0.2
        );
      });
      
      /* WidgetsBinding.instance.addPostFrameCallback((_) {
        
        RenderObject? object = focusNode.context?.findRenderObject();
        
        if (object is RenderBox) {

          final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
          final screenHeight = MediaQuery.of(context).size.height;
          final fieldPosition = object.localToGlobal(Offset.zero).dy;
          final fieldHeight = object.size.height;


          // check if field is under virtual keyboard
          if (fieldPosition + fieldHeight > screenHeight - keyboardHeight) {

            double yOffset = object.localToGlobal(Offset.zero).dy - 100;
            
            _scrollController.animateTo(
              yOffset,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut
            );
          
          }
        }
      }); */
    }
  }
}
