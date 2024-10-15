import 'package:flutter/material.dart';
import 'package:flutterfirst/http/dio_instance.dart';
import 'package:flutterfirst/myapp.dart';
void main() {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");

  runApp(const MyApp());
}

