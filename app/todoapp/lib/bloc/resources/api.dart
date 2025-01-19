import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:todoapp/models/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiProvider {
  Client client = Client();

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


    if (response.statusCode == 200) {

      await saveApiKey(response.body);

      // If the call to the server was successful, parse the JSON
      return User.fromJson(json.decode(response.body));
      
    } else {
      // If that call was not successful, throw an error.
      String errorMessage = getErrorMessage(response.body);
      Fluttertoast.showToast(msg: errorMessage);

      throw Exception(getErrorMessage(response.body));
    }
  }


  String getErrorMessage(String body) {
    Map<String,dynamic> response = json.decode(body);
    return response['message'];
  }


  Future<void> saveApiKey(String body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String,dynamic> response = json.decode(body);
    String apiKey = response['data']['API_KEY'];

    Map<String,String> apiKeyJson = {
      "API_KEY": apiKey
    };

    prefs.setString('Api_Token', json.encode(apiKeyJson));
  }
}