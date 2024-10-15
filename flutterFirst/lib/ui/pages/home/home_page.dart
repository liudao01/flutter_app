import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutterfirst/datas/home_list_data.dart';
import 'package:flutterfirst/ui/pages/home/home_vm.dart';
import 'package:flutterfirst/ui/route/RouteUtils.dart';
import 'package:flutterfirst/ui/route/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homepageState();
}

class _homepageState extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getBanner();
    viewModel.getHomeList(1);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [_swiper(), _homeList()]))),
      ),
    );
  }

  Widget _homeList() {
    print("homeList 调用");
    return Consumer<HomePageViewModel>(builder: (context, vm, child) {
      return ListView.builder(
          shrinkWrap: true,
          //shrinkWrap可计算所有子组件高度
          physics: NeverScrollableScrollPhysics(),
          //滑动让SingleChildScrollView接管
          itemCount: vm.listData?.length ?? 0,
          itemBuilder: (context, index) {
            return _listitem(vm.listData?[index]);
          });
    });
  }

  Widget _swiper() {
    return Consumer<HomePageViewModel>(builder: (context, vm, child) {
      print("_swiper 调用");
      return Container(
        width: double.infinity,
        height: 200,
        child: Swiper(
          itemCount: vm.bannerList?.length ?? 0,
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 200.h,
              color: Colors.lightGreenAccent,
              child: Image.network(
                vm.bannerList![index]?.imagePath! ?? "",
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _listitem(HomeListItemData? itemData) {

    var name;
    if(itemData?.author?.isNotEmpty == true) {
      name = itemData?.author;
    }else{
      name = itemData?.shareUser;
    }

    return GestureDetector(
      onTap: () {
        // 点击事件的处理逻辑
        print('点击事件被触发');

        //使用工具类
        RouteUtils.pushForNamed(context, RoutePath.webview,
            arguments: {"name": "使用路由传值"});

        //使用工具类
        // RouteUtils.push(context, WebviewPage(title: "首页过来的"));

        //使用name
        // Navigator.pushNamed(context, RoutePath.webview);

        //使用普通的
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => WebviewPage()));
      },
      child: Container(
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                      "https://img0.baidu.com/it/u=2045844358,1687804338&fm=253&fmt=auto?w=800&h=800",
                      width: 30.r,
                      height: 30.r,
                      fit: BoxFit.fill),
                ),
                SizedBox(width: 5),
                Text(
                  name,
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
                SizedBox(width: 5),
                Spacer(),
                Text(
                  "置顶",
                  style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(itemData?.title ?? "itemData?.title"),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  itemData?.chapterName ?? "",
                  style: TextStyle(fontSize: 14.sp, color: Colors.green),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/img_collect_grey.png",
                  width: 30.r,
                  height: 30.r,
                )
              ],
            )
          ])),
    );
  }
}
