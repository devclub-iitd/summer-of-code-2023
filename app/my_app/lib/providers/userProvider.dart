
import 'package:flutter/foundation.dart';

import '../Models/user.dart';

class UserProvider extends ChangeNotifier{
  User authorizedUser=User('', '', '', '', '', '', '', '');

  User get user => authorizedUser;

  void setUser(Map<String,dynamic> user) {
    authorizedUser = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    authorizedUser = user;
    notifyListeners();
  }
}