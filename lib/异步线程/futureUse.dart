import 'dart:io';

void main() {
  print('main start');
  //先把main内单线程所有内容执行完后才执行future队列内的任
  Future.delayed(Duration(seconds: 2), () {
    print('2秒后执行');
  });
  print('main end');

  testFuture();
  testFuture2();
  testFuture3();


}

void testFuture3() {
  //如果我们需要等待一组任务都执行完成再统一处理一些事情，可以通过wait()完成。 使用readAsString 返回Future
  Future readDone = new File("/Users/liumaolin/test.txt").readAsString();
  //延迟3s
  Future delayedDone = Future.delayed(Duration(seconds: 3));
  Future.wait([readDone, delayedDone]).then((values) {
    print(values[0]); //第一个future的结果
    print(values[1]); //第二个future的结果
    print("testFuture3  end -----"); //第二个future的结果

  });
}

//有两种futture  一种是micro 一种是普通futture
void testFuture() {
  //写个打印文件内容
  new File("/Users/liumaolin/test.txt").readAsString().then((content) {
    print(content);
    //当给到一个不存在的文件地址时会发生异常，这时候可以利用catchError捕获此异常。
  }).then((content) {
    // `then()`的返回值同样是一个future对象，可以利用队列的原理进行组合异步任务
    print('then1');
  }).catchError((e, s) {
    print(e);
    print(s);
  }).then((content) {
    print('then2');
    print("testFuture end------");
  });
}

// 上面的方式是等待执行完成读取文件之后，再执行一个新的future。如果我们需要等待一组任务都执行完成再统一处理一些事情，可以通过`wait()`完成。
void testFuture2() {
  Future readDone = new File("/Users/liumaolin/test.txt").readAsString();
  //延迟3s
  Future delayedDone = Future.delayed(Duration(seconds: 3));

  Future.wait([readDone, delayedDone]).then((values) {
    print(values[0]); //第一个future的结果
    print(values[1]); //第二个future的结果
    print("testFuture2 end------");

  });
}
