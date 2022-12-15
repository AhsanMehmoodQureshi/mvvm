
import 'package:flutter/material.dart';

import '../view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState(){
    super.initState();
    splashServices.authentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Center(
        child: Text('Splash Screen',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
      ),
    ));
  }
}
