

import 'package:flutter/material.dart';
import 'package:provider_apps/utils/routes/routes_name.dart';
import 'package:provider_apps/view/home_screen.dart';
import 'package:provider_apps/view/login_screen.dart';
import 'package:provider_apps/view/signUp.dart';

class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home:
    return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignUp());
      default :
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Route Find'),
            ),
          );
        });
    }
  }

}