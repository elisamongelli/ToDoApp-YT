import 'package:flutter/material.dart';


Color darkGreyColor = const Color.fromARGB(255, 33, 33, 40);
Color lightGreyColor = const Color.fromARGB(255, 189, 189, 202);
Color redMainColor = const Color.fromARGB(255, 247, 73, 79);


/* Color todo = const Color.fromARGB(255, 242, 243, 174); // --> giallo chiaro
Color todo = const Color.fromARGB(255, 255, 255, 255); // --> bianco
Color todo = const Color.fromARGB(255, 219, 254, 184); // --> verde chiaro
Color todo = const Color.fromARGB(255, 238, 243, 106); // --> icterine */


// styles for task list
TextStyle taskListTitleStyle = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.bold,
  color: darkGreyColor,
  fontSize: 40
);


TextStyle singleTaskTitle = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.bold,
  color: darkGreyColor,
  fontSize: 25
);

TextStyle singleTaskSubtitle = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.normal,
  color: darkGreyColor,
  fontSize: 15
);


// styles for login/signup screen container
TextStyle loginScreenTitle = TextStyle(
  fontFamily: 'Playwrite',
  fontWeight: FontWeight.normal,
  color: redMainColor,
  fontSize: 120
);

TextStyle loginScreenSubtitle = TextStyle(
  fontFamily: 'Playwrite',
  fontWeight: FontWeight.normal,
  color: darkGreyColor,
  fontSize: 25
);


// styles for login/signup tabbar
TextStyle tabBarLabel = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.normal,
  color: darkGreyColor,
  fontSize: 20
);