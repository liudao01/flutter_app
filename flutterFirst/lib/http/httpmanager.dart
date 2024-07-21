import 'package:dio/dio.dart';
import 'api.dart';

class HttpManager {
  late Dio _dio; //这里也要用late
  static late HttpManager _instance;

  factory HttpManager.getInstance() {
    if (_instance == null) {
      _instance = HttpManager._internal();
    }
    return _instance;
  }

  // 私有构造函数，以 _ 开头，防止外部直接实例化
  HttpManager._internal() {
    // 初始化 BaseOptions 对象
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    // 使用 BaseOptions 对象创建 Dio 实例，并赋值给 _dio
    _dio = Dio(options);
  }

  request(rul, {String method = 'get'}) async {
    try{
      Options option = new Options(method: method);
      var result = await _dio.request(rul, options: option);
      return result.data;
    }  catch(e){

    }
  }
}
