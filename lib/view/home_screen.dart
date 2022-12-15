

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apps/resource/components/round_button.dart';
import 'package:provider_apps/utils/routes/routes_name.dart';
import 'package:provider_apps/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences=Provider.of<UserViewModel>(context);
    return  SafeArea(child: Scaffold(
      body: Center(
        child: RoundedButton(title: 'Logout', onPress: (){
         // userPreferences.remove();
          Navigator.pushNamed(context, RoutesName.splash);
        }),
      ),
    ));
  }
}
