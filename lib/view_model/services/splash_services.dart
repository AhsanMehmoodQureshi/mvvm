

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_apps/utils/routes/routes_name.dart';
import 'package:provider_apps/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices{
  Future<UserModel> getUserModel()=> UserViewModel().getUser();

  void authentication(BuildContext context) {
    getUserModel().then((value) async {
      if(value.token=='null'){
        await Future.delayed(const Duration(seconds: 5),(){
          Navigator.pushNamed(context, RoutesName.login);
        });
      }else{
        await Future.delayed(const Duration(seconds: 5),(){
        Navigator.pushNamed(context, RoutesName.home);
        });
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print('Error$error');
      }
    });
  }
}