
import 'package:flutter_provider_architecture/core/models/comment.dart';
import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/locator.dart';

class CommentsModel extends BaseModel{

  PostService _postService = locator<PostService>();

  List<Comment> comments;

  Future getListComment(int postId) async {
    setState(ViewState.Busy);
    comments = await _postService.getListCommentForPost(postId);
    setState(ViewState.Idle);
  }

}