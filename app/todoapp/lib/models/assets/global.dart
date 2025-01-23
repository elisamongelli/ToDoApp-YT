import 'package:flutter/material.dart';

Color darkGreyColor = const Color(0xFF212128);
Color lightGreyColor = const Color.fromARGB(255, 208, 208, 216);

/* 
  ----- DA PROVARE -----

  Color lightGreyColor = const Color.fromARGB(255, 189, 189, 202);  // grigio chiaro ma più scuro dei successivi
  Color lightGreyColor = const Color.fromARGB(255, 208, 208, 216);  // grigio chiaro ma non troppo, si nota rispetto al bianco
  Color lightGreyColor = const Color(0xFFEEEEEE);                   // grigio molto chiaro, quasi bianco

  ----- DA PROVARE -----
*/

Color redMainColor = const Color.fromARGB(255, 247, 73, 79);


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

