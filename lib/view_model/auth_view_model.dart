
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_apps/repository/auth_repository.dart';
import 'package:provider_apps/utils/routes/routes_name.dart';
import 'package:provider_apps/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();

  bool _loading=false;
  get loading=>_loading;
  bool _signUpLoading=false;
  get signUpLoading=>_signUpLoading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  setSignUpLoading(bool value){
    _signUpLoading=value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data ,BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      Utils.toast('Successfully Login');
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toast(error.toString());
      print(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data ,BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.registerApi(data).then((value) {
      setSignUpLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      Utils.toast('Successfully Register');
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.toast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}