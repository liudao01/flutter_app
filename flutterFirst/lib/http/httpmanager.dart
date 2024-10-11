import 'package:dio/dio.dart';
import 'api.dart';

class HttpManager {
  late Dio _dio;
  static HttpManager? _instance; // 修改为可空类型

  factory HttpManager.getInstance() {
    _instance ??= HttpManager._internal(); // 如果 _instance 为 null 则实例化
    return _instance!;
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

  request(url, {String method = 'get'}) async {
    try {
      Options option = Options(method: method);
      print('请求地址: $option.baseUrl$url');
      print('请求地址 option: $option');
      var result = await _dio.request(url, options: option);
      print('请求结果 : ${result.data}');
      return result.data;
    } catch (e) {
      // 捕获异常并打印
      print('请求出错: $e');
      return null;
    }
  }
}
