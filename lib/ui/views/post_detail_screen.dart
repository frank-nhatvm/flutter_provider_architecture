import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/ui/common/theme.dart';
import 'package:flutter_provider_architecture/ui/widgets/comments.dart';
import 'package:provider/provider.dart';



class PostDetailScreen extends StatelessWidget {

  final Post post;

  const PostDetailScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 4.0,),
            Text('by ${user.name}', style: TextStyle(fontSize: 14.0, color: Colors.black38),),
            SizedBox(height: 10.0,),
            Text(post.body),
            SizedBox(height: 20.0,),
            Text('Comments',),
            CommentsWidget(postId: post.id,),
          ],
        ),
      ),
    );
  }
}
