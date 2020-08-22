import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/locator.dart';


class LoginModel extends BaseModel{

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> login(String userIdString) async{
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdString);
    var success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }


}