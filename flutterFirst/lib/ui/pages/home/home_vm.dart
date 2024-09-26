import 'package:flutter/widgets.dart';
import 'package:flutterfirst/datas/homeBannerData.dart';
import 'package:flutterfirst/http/api.dart';

class HomePageViewModel with ChangeNotifier{
  List<BannerItemData>? bannerList;
   Future<List<BannerItemData>?> getBanner() async {
    print("结束banner数据开始");
    var result = await Api.getBanner();
    print("请求返回数据:  $result");
    HomeBannerData bannerData = HomeBannerData.fromJson(result);
    if (bannerData != null && bannerData.data != null) {
      bannerList = bannerData.data;
      notifyListeners();//数据改变后调用这个
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
