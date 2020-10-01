import 'package:flutter/material.dart';
import 'package:pocketwatch_mobile/auth/login.dart';

const indexRoute = '/';
const homeRoute = '/home';
const signUpRoute = '/signup';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case indexRoute: 
      return MaterialPageRoute(builder: (_)=>Login(),settings: RouteSettings(name:indexRoute));
      // case signUpRoute:
      // return MaterialPageRoute(builder: (_)=>SignUp(),settings: RouteSettings(name:signUpRoute));
      // case homeRoute:
      // return MaterialPageRoute(builder: (_)=>Home(),settings: RouteSettings(name:homeRoute));
      default:
      return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title:Text('Error',style:TextStyle(fontFamily: 'IBM-Plex-sans'))
        ) ,
        body:Center(
          child:Text('Error',style:TextStyle(fontFamily: 'IBM-Plex-sans'))
        )
      );
    });  
  }
}

