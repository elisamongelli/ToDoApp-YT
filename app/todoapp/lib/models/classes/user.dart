class User {
  // int id = 0;
  // String apiKey = '';
  String username = '';
  String email = '';
  String password = '';
  String lastname = '';
  String firstname = '';


  User (this.username, this.email, this.password, this.lastname, this.firstname);


   User.fromJson(Map<String, dynamic> parsedJson) {

    /* User user = User(
      parsedJson['id'],
      parsedJson['apiKey'], 
      parsedJson['username'], 
      parsedJson['email'], 
      parsedJson['password'], 
      parsedJson['lastname'], 
      parsedJson['firstname']
    ); */

    // id = parsedJson['id'];
    // apiKey = parsedJson['apiKey'];
    // username = parsedJson['username'];
    // email = parsedJson['email'];
    // password = parsedJson['password'];
    // lastname = parsedJson['lastname'];
    // firstname = parsedJson['firstname'];

    /* print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp; */
  }
}