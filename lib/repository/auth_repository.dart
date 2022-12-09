
import 'package:http/http.dart';
import 'package:provider_apps/data/network/BaseApiServices.dart';
import 'package:provider_apps/data/network/NetworkApiServices.dart';
import 'package:provider_apps/resource/app_url.dart';

class AuthRepository{
  BaseApiServices baseApiServices= NetworkApiService() ;

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await baseApiServices.getPostApiResponse(ApiUrl.loginUrl, data);
      return response;
     //  Response response= await post(
     //      Uri.parse(ApiUrl.loginUrl),
     //      body: 'data'"56656"
     //  ).timeout(const Duration(seconds: 10));
     //  var data=response;
     //  if(data.statusCode==200){
     //    return data;
     //  }
     // else if(data.statusCode==400){
     //    return data;
     //  }
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response=await baseApiServices.getPostApiResponse(ApiUrl.registerUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}