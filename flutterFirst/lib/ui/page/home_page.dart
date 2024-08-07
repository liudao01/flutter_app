import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutterfirst/ui/page/webview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homepageState();
}

class _homepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Swiper(
                  itemCount: 3,
                  indicatorLayout: PageIndicatorLayout.NONE,
                  autoplay: true,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      height: 200,
                      color: Colors.lightGreenAccent,
                    );
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _listitem();
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _listitem() {
    return GestureDetector(
      onTap: () {
        // 点击事件的处理逻辑
        print('点击事件被触发');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebviewPage()));
      },
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                      "https://www.shiguang.pro/skycaiji/data/images/e6/486d9fe4e71771ed64224f0a3507ab.jpg",
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill),
                ),
                SizedBox(width: 5),
                Text(
                  "作者",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Spacer(),
                Text(
                  "2024-08-07 14:40",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(width: 5),
                Text(
                  "置顶",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                )
              ],
            ),
            SizedBox(height: 5),
            Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "分类",
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/img_collect_grey.png",
                  width: 30,
                  height: 30,
                )
              ],
            )
          ])),
    );
  }
}
