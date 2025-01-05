import 'dart:async';
import 'api.dart';
import 'package:todoapp/models/classes/user.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<User> signupUser(
    String username, 
    String email,
    String password,
    String firstname,
    String lastname
  ) => apiProvider.signupUser(username, email, password, firstname, lastname);
}