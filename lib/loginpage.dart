

import 'package:flutter/material.dart';
import 'package:login_page/screen2.dart';
import 'package:login_page/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final _usernamecontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();
  final _logkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text('Login page',
     style: TextStyle(color: Colors.white),),
     
    ),
    backgroundColor:Colors.white,
       body: SafeArea(child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Form(
          key:_logkey ,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           const Text(
                'Login',
                style: TextStyle(
                   fontSize: 30.0,
                   color:Colors.blue
                ),),
              const  Padding(padding:EdgeInsets.symmetric(vertical: 30)),
                TextFormField(
                  validator: (value) {
                    if(value==null|| value.isEmpty ){
                     return "please fill Your emailaddress";
                    }else{
                      return null;
                    }
                    
                  },
                  controller: _usernamecontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration:const InputDecoration(
                    labelText: 'UserNmae',
                    hintText: 'Enter UserName',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user)
                  )
                ),
             const SizedBox(height: 20,),
                TextFormField(
                   validator: (value) {
                    if(value==null ||value.isEmpty  ){
                     return "please fill Your password";
                    }else{
                      return null;
                    }
                    
                       
                  },
                    controller: _passwordcontroller,
                   obscureText: true,
                  decoration:const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    
                  )
                ),
                ElevatedButton(onPressed:()async{


                
                  if(_logkey.currentState!.validate()){

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data submitted")));

                  }else{
                    return null;
                  }

                  checkLogin(context);

                 var prefs=await SharedPreferences.getInstance();
                 prefs.setBool(SplashScreenState.CHECKLOGIN, true);
                    
                 
                } ,
                 child: Text('Login') ,
                 style:const ButtonStyle(),
                 
                 ),
            ],
           ),
         ),
       ),),
            
            
    );
   
  }
   void checkLogin(BuildContext ctx){
      final _username=_usernamecontroller.text;
      final _password=_passwordcontroller.text;
      if(_username==_password){
        print('User name password Match');
        // go to home
        Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context) =>ScreenTwo() ,));
      }else{
        ScaffoldMessenger.of( ctx)
        .showSnackBar(SnackBar(content: Text('User name Password does not match')));
        print('user name password does not match');
      }
      
    }
}