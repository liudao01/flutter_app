import 'package:flutterfirst/datas/homeBannerData.dart';
import 'package:flutterfirst/http/api.dart';
import 'package:flutterfirst/http/httpmanager.dart';

class HomePageViewModel {
  static List<String> bannerList = [];
  static List<String> articleList = [];

  static Future<List<BannerItemData>?> getBanner() async {
    print("结束请求");
    var result = await Api.getBanner();
    print("请求返回数据:  $result");
    HomeBannerData bannerData = HomeBannerData.fromJson(result);
    if (bannerData != null && bannerData.data != null) {
      return bannerData.data;
    } else {
      return null;
    }
  }

  Future getArticleList(int page) async {
    var result = await Api.getArticleList(page);
    if (result != null) {}
  }
}
