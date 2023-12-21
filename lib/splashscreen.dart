import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/loginpage.dart';
import 'package:login_page/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
 static const CHECKLOGIN="login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getlogin();
  }


  @override
 

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Text('classico',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color:Colors.black
        ),)),
        

      ),
    );
  }
  
  void Getlogin()async {
  var prefs=await SharedPreferences.getInstance();
    var AppLog=    prefs.getBool(CHECKLOGIN);
   Timer(Duration(seconds: 5), () {
    if(AppLog!=null){
      if(AppLog){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenTwo()));
      }else{
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginPage()));
      }
    }else{
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginPage()));
    }



 });

  }
 
}