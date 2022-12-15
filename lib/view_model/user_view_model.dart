
import 'package:flutter/cupertino.dart';
import 'package:provider_apps/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

   Future<bool> saveUser(UserModel userModel)async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token', userModel.token);
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    String? token=sp.getString('token');
    notifyListeners();
    return UserModel(
      token: token.toString()
    );
  }

  Future<bool> remove()async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

}