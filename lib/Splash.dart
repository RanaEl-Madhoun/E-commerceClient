
import 'package:flutter/material.dart';
import 'package:flutter_client_1/Provider/AuthProvider.dart';
import 'package:flutter_client_1/splsh.dart';
import 'package:provider/provider.dart';


class splash extends StatelessWidget{
  navfunction(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    Provider.of<AuthProvider>(context,listen: false).checkuser();
  }
  @override
  Widget build(BuildContext context) {
    navfunction(context);
    // TODO: implement build
return Scaffold(
  body: 
  
   
      
       splashimage()
   
  
);
  }

}