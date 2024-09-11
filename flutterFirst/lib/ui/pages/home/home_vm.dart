import 'package:flutterfirst/http/api.dart';
import 'package:flutterfirst/http/httpmanager.dart';

class HomePageViewModel {

  static List<String> bannerList = [];
  static List<String> articleList = [];

 static  Future getBanner() async {
    var result = await Api.getBanner();
    if (result != null) {
      print(result);
      // bannerList = result;
      print("结束请求");
    }
  }

  Future getArticleList(int page) async {
    var result = await Api.getArticleList(page);
    if (result != null){}
  }
}