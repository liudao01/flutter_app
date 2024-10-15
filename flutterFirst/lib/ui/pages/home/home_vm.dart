import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfirst/datas/home_banner_data.dart';
import 'package:flutterfirst/datas/home_list_data.dart';
import 'package:flutterfirst/http/WanApi.dart';
import 'package:flutterfirst/http/dio_instance.dart';

// 获取首页banner图
class HomePageViewModel with ChangeNotifier {
  List<HomeBannerData?>?  bannerList;
  List<HomeListItemData?>?  listData;

  Future<List<HomeBannerData>?> getBanner() async {
    print("结束banner数据开始");
    // var result = await WanApi.getBanner();
    Response response = await DioInstance.instance().get(path: "banner/json");
    HomeListBannerData bannerData = HomeListBannerData.fromJson(response.data);

    if (bannerData.bannerList != null) {
      bannerList = bannerData.bannerList;
    } else {
      bannerList = [];
    }
    notifyListeners(); //数据改变后调用这个
  }

  //获取首页列表
  Future getHomeList(int page) async {
    // var result = await WanApi.getHomeList(page);
    Response response = await DioInstance.instance().get(path: "article/list/1/json");
    if (response != null) {
      HomeListData homeData = HomeListData.fromJson(response.data);
      print("获取首页列表 请求返回数据:  ${homeData.datas}");
      if (homeData.datas?.isNotEmpty == true) {
        listData = homeData.datas;
      } else {
        listData = [];
      }
      notifyListeners(); //数据改变后调用这个
    }
  }
}
