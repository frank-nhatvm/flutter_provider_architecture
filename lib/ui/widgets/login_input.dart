import 'package:flutter/material.dart';

class LoginInputWidget extends StatelessWidget {

  final TextEditingController userIdEditController;

  const LoginInputWidget({Key key,@required this.userIdEditController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Login',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
        SizedBox(height: 8.0,),
        Text('Enter a number between: 1-10',style:TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.black) ,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          height: 50.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Enter User Id'),
            controller: userIdEditController,
          ),

        ),
      ],
    );
  }
}
