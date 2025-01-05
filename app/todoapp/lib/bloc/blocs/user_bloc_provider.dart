import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todoapp/models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Stream<User> get getUser => _userGetter.stream;

  signupUser(
    String username,
    String email,
    String password,
    String firstname,
    String lastname
  ) async {
    User user = await _repository.signupUser(username, email, password, firstname, lastname);
    _userGetter.sink.add(user);
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();