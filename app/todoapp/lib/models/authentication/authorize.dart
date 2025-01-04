import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print("new AuthService");
  }

  Future getUser() {
    return Future.value(currentUser);
  }

  // wrappinhg the firebase calls
  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  
  /* Future createUser({
      String username,
      String email,
      String password,
      String firstName,
      String lastName
    }) async {} */

  // logs in the user if password matches
  /* Future loginUser({String email, String password}) {
    if (password == 'password123') {
      this.currentUser = {'email': email};
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(null);
    }
  } */
}