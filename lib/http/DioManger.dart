import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:micro_course/http/ResultCode.dart';
import 'package:micro_course/http/GlobalConfig.dart';
class DioManger{
  static DioManger _instance;

  static DioManger getInstance() {
    if (_instance == null) {
      _instance = new DioManger();
    }
    return _instance;
  }
  Dio dio = new Dio();

  DioManger(){
//    dio.options.headers = {
//    默认headers
//    };
    dio.options.baseUrl = "https://keep-portal.kuaizaixuetang.com/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
  }

  get(String url,Map params,Map<String,String> headers,Function successCallBack,Function errorCallBack) async{
   _requestHttp(url,headers,successCallBack,'get',params,errorCallBack);
  }

  post(String url,params,Map<String,String> headers,Function successCallBack,Function errorCallBack) async{
   _requestHttp(url, headers,successCallBack,'post',params,errorCallBack);
  }

  _requestHttp(String url ,Map<String,String> headers,Function successCallBack,[
    String method, Map params, Function errorCallBack
  ]) async{
    Response response;
    try{
      if(headers != null){
        ///显示指定Map的限定类型 动态添加headers
        dio.options.headers.addAll(new Map<String,String>.from(headers));
      }
      if (method == 'get') {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    }on DioError catch(error){
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }
      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('请求结果: ' + response.toString());
      }
    }
//    String dataStr = json.encode(response.data);
//    Map<String, dynamic> dataMap = json.decode(dataStr);
//    if (dataMap == null || dataMap['state'] == 0) {
//      _error(errorCallBack, '错误码：' + dataMap['errorCode'].toString() + '，' + response.data.toString());
//    }else if (successCallBack != null) {
//      successCallBack(dataMap);
//    }
    successCallBack(response.toString());

  }
  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}