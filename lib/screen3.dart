import 'package:flutter/material.dart';
import 'package:login_page/loginpage.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen3'),
        actions: [
          IconButton(onPressed: (){
          Signout(context);

          }, icon: Icon(Icons.exit_to_app))
        ],
      ),

    );
  }
  Signout(BuildContext ctx){
  Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => LoginPage(),), (route) => false);

  }
}