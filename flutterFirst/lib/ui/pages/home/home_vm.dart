import 'package:flutter/widgets.dart';
import 'package:flutterfirst/datas/homeBannerData.dart';
import 'package:flutterfirst/datas/homeListData.dart';
import 'package:flutterfirst/http/api.dart';

// 获取首页banner图
class HomePageViewModel with ChangeNotifier {
  List<BannerItemData>? bannerList;
  List<HomeListItemData>? listData;

  Future<List<BannerItemData>?> getBanner() async {
    print("结束banner数据开始");
    var result = await Api.getBanner();
    print("请求返回数据:  $result");
    HomeBannerData bannerData = HomeBannerData.fromJson(result);
    if (bannerData != null && bannerData.data != null) {
      bannerList = bannerData.data;
    } else {
      bannerList = [];
    }
    notifyListeners(); //数据改变后调用这个
  }

  //获取首页列表
  Future getHomeList(int page) async {
    var result = await Api.getHomeList(page);
    if (result != null) {
      HomeData homeData = HomeData.fromJson(result);
      print("获取首页列表 请求返回数据:  ${homeData.data}");
      if (homeData.data != null && homeData.data?.datas != null) {
        listData = homeData.data?.datas;
      } else {
        listData = [];
      }
      notifyListeners(); //数据改变后调用这个
    }
  }
}
