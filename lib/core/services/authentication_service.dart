import 'dart:async';

import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/locator.dart';

class AuthenticationService {

  StreamController<User> userStreamController = StreamController<User>();

  Api _api = locator<Api>();

  String errorMessage ;

  Future<bool> login(int userId) async {
    try {
      var fetchedUser = await _api.getUserProfile(userId);
      var hasUser = fetchedUser != null;
      if(hasUser){
        userStreamController.sink.add(fetchedUser);

      }
      return hasUser;
    } catch (e) {
      errorMessage = 'Something went wrong.';
      return false;
    }
  }
}
