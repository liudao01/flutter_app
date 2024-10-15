import 'package:dio/dio.dart';
import 'package:flutterfirst/http/dio_instance.dart';

import 'httpmanager.dart';

class WanApi{

  static WanApi? _instance;

  WanApi._internal();

  static WanApi instance() {
    return _instance ??= WanApi._internal();
  }
  static const String baseUrl = "http://www.wanandroid.com/";

  //首页文章列表 http://www.wanandroid.com/article/list/0/json
  static const String ARTICLE_LIST = "article/list/";

  static const String BANNER = "banner/json";

  static getHomeList(int page) async {
    return await HttpManager.getInstance().request('$ARTICLE_LIST$page/json');
  }

  static getBanner() async {
    return await HttpManager.getInstance().request(BANNER);
  }


  // ///获取首页banner数据
  // Future bannerList() async {
  //   Response response = await DioInstance.instance().get(path: "banner/json");
  //   var model = HomeBannerListModel.fromJson(response.data);
  //   return model.bannerList;
  // }
  // ///获取首页文章列表
  // Future homeList(String pageCount) async {
  //   Response response = await DioInstance.instance().get(path: "article/list/$pageCount/json");
  //   var model = HomeListModel();
  //   // model.fromData(response.data);
  //   return HomeListModel.fromJson(response.data);
  //   // return null;
  // }

  ///获取置顶文章列表
  // Future<HomeTopListModel> topHomeList() async {
  //   Response response = await DioInstance.instance().get(path: "article/top/json");
  //   return HomeTopListModel.fromJson(response.data);
  // }

}