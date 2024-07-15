import 'dart:async';
import 'dart:io';

void main() {
  // stream1();
  // stream2();
  stream3();
}

void stream3() {
  //创建一个流管理器

  StreamController controller = StreamController.broadcast();

  //添加数据
  controller.add(1);

  //监听 先添加再监听 无法接收到通知
  controller.stream.listen((event) {
    print("stream3 $event");
  });

  //添加数据
  controller.add(2);

  //关闭
  controller.close();

}

//多订阅模式 而广播是可以有多个订阅者。通过 Stream.asBroadcastStream()- 广播模式
// 可以将一个单订阅模式的 Stream 转换成一个多订阅模式的 Stream，isBroadcast 属性可以判断当前 Stream 所处的模式。
void stream2() {
  //通过 asBroadcastStream 转化为多订阅模式
  var broadcastStream =
      File('/Users/liumaolin/test.pdf').openRead().asBroadcastStream();
  broadcastStream.listen((s) {
    print(" 订阅者1");
  });
  broadcastStream.listen((s) {
    print(" 订阅者2");
  });
}

//单订阅模式-
void stream1() {
  //使用stream 多次读取一个文件 (文件比较大的情况,如果过小则只会回调一次, 面对大文件可以多次读取, 避免)//openRead 返回一个stream
  Stream<List<int>> stream = File('/Users/liumaolin/test.pdf').openRead();
  var listen = stream.listen((s) {
    print("多次回调");
  });
  //取消
  // listen.cancel();

  //重新指定
  listen.onData((s) {
    print("多次回调 onData重新指定");
  });
}
