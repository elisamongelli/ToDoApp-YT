class User {
  // int id = 0;
  // String apiKey = '';
  String username = '';
  String email = '';
  String password = '';
  String lastname = '';
  String firstname = '';


  User (this.username, this.email, this.password, this.lastname, this.firstname);


   User.fromJson(Map<String, dynamic> parsedJson);
}