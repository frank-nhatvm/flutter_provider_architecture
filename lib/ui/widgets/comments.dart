import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/comment.dart';
import 'package:flutter_provider_architecture/core/viewmodels/comments_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/ui/base_view.dart';

class CommentsWidget extends StatelessWidget {
  final int postId;

  const CommentsWidget({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      onModelReady: (model) {
        model.getListComment(postId);
      },
      builder: (context, model, widget) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: model.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Comment comment = model.comments[index];
                    return _CommentItem(
                      comment: comment,
                    );
                  }),
            ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final Comment comment;

  const _CommentItem({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.pinkAccent,
      ),
      child: Column(
        children: [
          Text(comment.name),
          SizedBox(
            height: 6.0,
          ),
          Text(comment.body),
        ],
      ),
    );
  }
}
