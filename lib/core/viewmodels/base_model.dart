import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';

class BaseModel extends ChangeNotifier{

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState state){
    _state = state;
    notifyListeners();
  }

}