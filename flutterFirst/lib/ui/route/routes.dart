import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutterfirst/ui/page/home_page.dart';
import 'package:flutterfirst/ui/page/webview_page.dart';

//路由管理
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage());
      case RoutePath.webview:
        return pageRoute(WebviewPage());
      default:
        return pageRoute(Scaffold(
          body: Center(
            child: Text('404 No route defined for ${settings.name}'),
          ),
        ));
    }
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
    bool? barrierDismissible,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      allowSnapshotting: allowSnapshotting ?? true,
      barrierDismissible: barrierDismissible ?? false,
      maintainState: maintainState ?? true,
    );
  }
}

//路由地址
class RoutePath {
  //首页
  static const String home = '/';

  //webview
  static const String webview = '/webview_page';
}
