

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_apps/data/app_exception.dart';
import 'package:provider_apps/data/network/BaseApiServices.dart';
import 'package:http/http.dart'as http;

class NetworkApiService extends BaseApiServices{


  @override
  Future getGetApiResponse(String url,) async{
    dynamic responseJson;
    try{
      final response= await http.post(Uri.parse(url)).timeout(const Duration(seconds: 15));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    // TODO: implement getPostApiResponse
  //  throw UnimplementedError();
    dynamic responseJson;
    try{
      // Response response = await post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      // responseJson = returnResponse(response);
      Response response= await post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      responseJson =returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:dynamic responseJson=jsonDecode(response.body);
      return responseJson;
      case 400:throw BadRequestException(response.body.toString());
      case 404:throw UnAuthorizedException(response.body.toString());
      default: throw FetchDataException('Error Accrued while communication with server'+
      'with status code'+response.statusCode.toString());
    }
  }
}