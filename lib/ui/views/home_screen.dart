import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/core/viewmodels/home_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/ui/base_view.dart';
import 'package:flutter_provider_architecture/ui/common/theme.dart';
import 'package:flutter_provider_architecture/ui/router.dart';
import 'package:flutter_provider_architecture/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    if (user.id != -1) {
      return BaseView<HomeModel>(
        onModelReady: (model) {
          print('USER ID ${user.id}');
          model.getListPost(user.id);
        },
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Idle
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Welcome ${user.name} with id ${user.id}' ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: model.posts.length,
                    itemBuilder: (context, index) {
                      final Post post = model.posts[index];
                      return PostListItem(
                        post: post,
                        onTap: () {
                          Navigator.pushNamed(context, Router.POST_ROUTE,arguments: post);
                        },
                      );
                    }),
              )
            ],
          )
              : Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return _NotLoginWidget();
  }
}


class _NotLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please login to view your posts.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            color: Colors.pink,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
