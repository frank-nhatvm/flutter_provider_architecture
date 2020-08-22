import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';
import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/comments_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => PostService());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
