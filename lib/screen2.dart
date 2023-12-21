import 'package:flutter/material.dart';
import 'package:login_page/screen3.dart';


class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
        
        
      ),
      body: 
      SafeArea(child: ListView.separated(itemBuilder: (ctx,index){

        return ListTile(
          title: Text('ABC'),
          subtitle: Text('message.$index'),
          leading: CircleAvatar(),
          onTap: () {
            Navigator.of(ctx).push(MaterialPageRoute(builder: (context) =>ScreenThree() ,));
          },
        );
      }, 
      separatorBuilder: (ctx,index){
        return Divider();
      }, 
      itemCount: 10)),
      
      
    );
  }
}