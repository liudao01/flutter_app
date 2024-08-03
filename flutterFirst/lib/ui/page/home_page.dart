import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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
                        return Text("itemText");
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
