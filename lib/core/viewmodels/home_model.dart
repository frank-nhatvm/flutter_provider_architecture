import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel{

  PostService _postService = locator<PostService>();

  List<Post> posts;
  String errorMessage;

  Future getListPost(int userId) async {
    setState(ViewState.Busy);
    try{
      posts = await _postService.getListPost(userId);
      print('POST DONE ${posts.length}');
      posts.forEach((element) {
        print(' POST ${element.id}  ${element.title}');
      });
      setState(ViewState.Idle);
    }catch(e){
      errorMessage = 'Something went wrong. Please try again';
      setState(ViewState.Idle);
    }
  }

}