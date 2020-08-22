

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/ui/views/home_screen.dart';
import 'package:flutter_provider_architecture/ui/views/login_screen.dart';
import 'package:flutter_provider_architecture/ui/views/post_detail_screen.dart';

class Router{

  static const HOME_ROUTE = '/';
  static const LOGIN_ROUTE = 'login';
  static const POST_ROUTE = 'post';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){

      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case POST_ROUTE:
        var post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => PostDetailScreen(post: post,),
        );

      default:
        return MaterialPageRoute( builder: (_) => Scaffold(
          body: Center(
            child: Text('No defined route for ${settings.name}'),
          ),
        ) );
    }
  }
}