import 'dart:isolate';

void main() {
//简单使用- 实际开发中不需要自己创建
//   Isolate.spawn(entryPoint, "hello world");
  var receiver = new ReceivePort();
  Isolate.spawn(entryPoint, receiver.sendPort);
  // Isolate.spawn(entryPoint, "hello world", onExit: receiver.sendPort);
  // Isolate.spawn(entryPoint, "hello world");
  receiver.listen((message) {
    print("接受entryPoint的异步 message is $message");
  });
}

void entryPoint(SendPort sendport) {
  // print("异步 message is $message");
  var receiver = new ReceivePort();
  sendport.send(receiver.sendPort);

  receiver.listen((message) {
    print("接受主线程的异步 message is $message");
  });
}
