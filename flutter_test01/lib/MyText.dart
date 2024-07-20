import 'package:flutter/material.dart';

// 定义主函数，Flutter 应用的入口点
void main() {
  // 运行 MyApp2 类的实例作为应用程序的根组件
  runApp(const MyApp2());
}

// 定义一个继承自 StatelessWidget 的类 MyApp2
class MyApp2 extends StatelessWidget {
  // 构造函数，使用 const 关键字表示这个类是不可变的
  const MyApp2({super.key});

  // 重写 build 方法，返回一个 Widget 树
  @override
  Widget build(BuildContext context) {
    // 返回一个 Center Widget，它是一个容器，用来居中显示其子组件
    // return Center(
    //   child: Text(
    //     "hello myText",  // Text Widget 的内容
    //     textDirection: TextDirection.ltr,  // 文本方向设置为从左到右
    //   ),
    // );

    //使用MaterialApp 包裹 不用指定方向
// 返回一个 MaterialApp，这是 Flutter 中一个常用的应用程序类
    return MaterialApp(
        // 指定 MaterialApp 的 home 属性，即应用程序的初始路由
        home: Scaffold(
            // Scaffold 是一个布局类，提供了一些常见的布局元素
            body: Center(
      // Center 是一个容器，用来居中显示其子组件
      child: Text(
        "hello myText", // Text Widget 的内容
      ),
    )));
  }
}
