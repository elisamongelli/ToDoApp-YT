import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todoapp/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiProvider {
  Client client = Client();
  // final _apiKey = 'your_api_key';

  Future<User> signupUser(
    String username, 
    String email,
    String password,
    String firstname,
    String lastname
  ) async {

    final response = await client.post(
      Uri.parse('http://10.0.2.2:5000/api/signup'),
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode({
        "username": username,
        "email": email,
        "password": password,
        "firstname": firstname.isEmpty ? "User" : firstname,
        "lastname": lastname
      })
    );

    print("RESPONSE BODY FROM POST METHOD: " + response.body.toString());

    if (response.statusCode == 200) {

      saveApiKey(response.body.toString());

      // If the call to the server was successful, parse the JSON
      return User.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load user');
    }
  }


  void saveApiKey(String body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('ResponseBody', body);

    // prefs.setString('API_Token', user.api_key).toString();
  }
}