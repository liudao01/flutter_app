import 'dart:async';
import 'dart:io';

//async await 基本使用  async await
//async await 是dart语言中用于处理异步操作的关键字，它可以让异步代码看起来像同步代码一样，使代码更加简洁易读。
Future<String> readFile() async {
  String string = await new File("/Users/liumaolin/test.txt").readAsString();
  String string2 = await new File("/Users/liumaolin/test.txt").readAsString();

  return string;
}

void main() {
  readFile().then((value) => print(value));
}
