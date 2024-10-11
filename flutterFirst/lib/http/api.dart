import 'httpmanager.dart';

class Api{
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
}