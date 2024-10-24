import 'package:flutter/foundation.dart';
import 'package:tutorial_project/model/UserClass.dart';
import 'data/UserInfoCall.dart';

class UserViewModel extends ChangeNotifier {
  List<UserClass>? _user;

  List<UserClass>? get user => _user;

  // Simulating fetching data from a model (e.g., API)
  Future<void> fetchUser() async {
    await Future.delayed(Duration(seconds: 2));
    _user =  await( Userinfocall().fetchListUsers());
    //_user = User(name: "John Doe", email: "john@example.com");
    notifyListeners(); // Notifies the UI of changes
  }
}