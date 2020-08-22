import 'package:flutter_provider_architecture/core/services/api.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/comment.dart';

class PostService{
  Api _api = locator<Api>();

  Future<List<Post>> getListPost(int userId) async {
    var posts = await _api.getPostsForUser(userId);
    return posts;
  }

  Future<List<Comment>> getListCommentForPost(int postId) async{
    var comments = await _api.getListCommentsForPost(postId);
    return comments;
  }

}