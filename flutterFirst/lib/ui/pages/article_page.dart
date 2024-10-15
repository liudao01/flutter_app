import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/http/WanApi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterfirst/ui/widget/article_item.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticiePageState();
}

class _ArticiePageState extends State<ArticlePage> {
  bool isLoading = true;

  int curPage = 0;

  int totalPage = 0;

  ///请求到的文章数据
  List articles = [];
  List banners = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    _pullToRefresh();
  }

  Future<void> _pullToRefresh() async {
    debugPrint("下拉刷新");
    curPage = 0;
    Iterable<Future> futures = [_getArticlelist()];
    // Iterable<Future> futures = [_getArticlelist(), _getBanner()];
    await Future.wait(futures);
    debugPrint("下拉刷新结束");
    setState(() {
      isLoading = false;
    });
    return null;
  }

  _getBanner([bool update = true]) async {
    var data = await WanApi.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  _getArticlelist([bool isUpdate = true]) async {
    /// 请求成功是map，失败是null
    var data = await WanApi.getHomeList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];
      print("datas = $datas ");
      debugPrint("datas = $datas ");
      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);

      totalPage = map["pageCount"];
      if (isUpdate) {
        setState(() {});
      }
    }
  }

  // Widget _bannerView() {
  //   //map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
  //   //map方法最终会返回一个  Iterable<T>
  //   List<Widget> list = banners.map((item) {
  //     return Image.network(item['imagePath'], fit: BoxFit.cover); //fit 图片充满容器
  //   }).toList();
  //   return list.isNotEmpty
  //       ? BannerView(
  //     list,
  //     //控制轮播时间
  //     intervalDuration: const Duration(seconds: 3),
  //   )
  //       : null;
  // }
  Widget _buildItem(int i) {
    // if (i == 0) {
    //   //Container ：容器
    //   return new Container(
    //     //MediaQuery.of(context).size.height: 全屏幕高度
    //     height: MediaQuery.of(context).size.height*0.3,
    //     child: _bannerView(),
    //   );
    // }
    // var itemData = articles[i - 1];
    return new ArticleItem(articles);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
            offstage: isLoading,
            child: new Center(
              child: CircularProgressIndicator(),
            )),
        Offstage(
          offstage: !isLoading,
          //下拉刷新组件
          child: new RefreshIndicator(
            onRefresh: _pullToRefresh,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _buildItem(index);
              },
              itemCount: articles.length,
              // itemCount: articles.length + 1,
            ),
          ),
        ),
      ],
    );
  }
}
