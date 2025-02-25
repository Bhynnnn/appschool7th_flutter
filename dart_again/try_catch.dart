import 'dart:async';

import 'async_await.dart';

void main() {
  // try-catch
  try {
    int result = 10 ~/ 0;
    print('결과: $result');
  } catch (e) {
    print('에러 발생: $e');
  }

  // try-catch-finally
  try {
    // file open
    // process
    int result = 10 ~/ 0;
    print('결과: $result');
  } catch (e) {
    // error handling
    print('에러 발생: $e');
  } finally {
    // file close
    print('작업 완료');
  }

  // try-catch-on
  try {
    // 여러 종류의 에러가 발생할 수 있는 코드
    // dynamic value = "123";  // TypeError를 피하기 위해 주석처리.
    // dynamic value = "abc";
    // int number = int.parse(value); // FormatException 발생 가능
    // print(number);
    int number = 4;
    List<int> list = [1, 2, 3];
    print(list[number]); // RangeError 발생 가능 (number가 3보다 크면)
  } on FormatException catch (e) {
    print("FormatException 처리: $e");
  } on RangeError catch (e) {
    print("RangeError 처리: $e");
  } on TypeError catch (e) {
    //dynamic 사용시 타입체크가 런타임에 일어나므로, TypeError도 여기서 잡힘
    print("TypeError 처리: $e");
  } catch (e) {
    print("그 외 다른 에러 처리: $e"); // 위의 catch 블록에서 처리되지 않은 모든 에러
  }

  try {
    dynamic value = 'abc';
    int number = int.parse(value);
    print(number);
    List<int> list = [1, 2, 3];
    print(list[number]);
  } catch (e) {
    if (e is FormatException) {
      print("FormatException (조건문): $e");
    } else if (e is RangeError) {
      print("RangeError: $e");
    } else if (e is TypeError) {
      print("TypeError: $e");
    } else {
      print("그 외 다른 에러 $e");
    }
  }

  Future<int> future1 = Future.delayed(
    Duration(seconds: 1),
    () => int.parse("abc"),
  );

  Future<int> future2 = Future.delayed(Duration(seconds: 2), () => 10);
  Future<int> future3 = Future.delayed(
    Duration(seconds: 1),
    () => [1, 2, 3][5],
  );

  Future.wait([
    future1.catchError((e) {
      print("future1에러 : $e");
      return -1;
    }),
    future2.catchError((e) {
      print("future2에러 : $e");
      return -2;
    }),
    future3.catchError((e) {
      print("future3에러: $e");
    }),
  ]).then((results) {
    print("Future.wait 결과: $results");
  }).catchError((e) {
    print("Future.wait 자체 에러: $e");
  });
  processData()
      .then((value) => print("processData완료"))
      .catchError((e) => print("processData에서 전역 에러 : $e"));
}

Future<void> processData() async {
  try {
    String data = await fetchData();
    int number = int.parse(data);
    print(number);
  } on TimeoutException catch (e) {
    print("TimeoutException: $e");
  } on FormatException catch (e) {
    print("FormatException: $e");
  } catch (e) {
    print("알 수 없는 에러: $e");
    rethrow; //상위 호출자에게 에러를 다시 던짐.
  } finally {
    print("finally 블록 실행 (항상 실행됨)");
  }
}

Future<String> fetchData() async {
  // Future.delayed(
  //   Duration(seconds: 2),
  // ).timeout(Duration(milliseconds: 500)); //TimeoutException

  return Future.delayed(Duration(seconds: 2), () => "123"); //정상적인 경우
  //return Future.delayed(Duration(seconds: 2), () => "abc");  //FormatException
}
