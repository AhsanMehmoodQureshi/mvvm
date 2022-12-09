
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier{
  bool _loading=false;
  bool get loading=>_loading;

  setBool(bool value){
    _loading =value;
    notifyListeners();
  }
   void fetchAlbum(String email, password) async {
     setBool(true);
     final response = await http.get(Uri.parse('https://reqres.in/api/login'));
    if (response.statusCode == 200) {
      print('Login Successfully');
     // EasyLoading.showInfo('Useful Information.');
      setBool(false);
      //EasyLoading.show();
    } else {
      setBool(false);
      throw Exception('Failed to load album');
    }
  }
}