import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostListItem({Key key, this.post, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
              color: Color.fromARGB(80, 0, 0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              post.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              post.body,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
