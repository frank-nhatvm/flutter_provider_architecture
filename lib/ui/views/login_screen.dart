import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/viewmodels/login_model.dart';
import 'package:flutter_provider_architecture/core/viewmodels/viewstate.dart';
import 'package:flutter_provider_architecture/ui/base_view.dart';
import 'package:flutter_provider_architecture/ui/common/theme.dart';
import 'package:flutter_provider_architecture/ui/router.dart';
import 'package:flutter_provider_architecture/ui/widgets/login_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context,model,widget) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginInputWidget(
              userIdEditController: textEditingController,
            ),
            SizedBox(
              height: 10.0,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.pinkAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () async {
                print('LOGIN');
                var loginSuccess =
                await model.login(textEditingController.text);
                if (loginSuccess) {
                  Navigator.pushNamed(context,Router.HOME_ROUTE);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
