
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Diohelper
{
  static Dio? dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
          baseUrl:"https://newsapi.org/",
        receiveDataWhenStatusError:true ,
      )
    );
  }
 static Future get({
  required String url,
   Map<String,dynamic>? query,
}) async
  {
    return await dio?.get(url,queryParameters: query);
  }

}