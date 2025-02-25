import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformCheck extends StatelessWidget {
  const PlatformCheck({super.key});

  bool get isWeb => kIsWeb;
  bool get isMobileDevice => Platform.isAndroid || Platform.isIOS;
  bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  bool get isMobileDeviceOrWeb => isMobileDevice || isWeb;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Text('Running on the web!');
    } else if (Platform.isAndroid) {
      return const Text('Running on Android!');
    } else if (Platform.isIOS) {
      return const Text('Running on iOS!');
    } else {
      return const Text('Running on Fuchsia!');
    }
  }
}

// MyHomePage 위젯: StatefulWidget 상태관리가 필요한 위젯
class ContainerView extends StatefulWidget {
  const ContainerView({super.key, required this.title});

  // title 변수: 홈페이지의 타이틀을 저장하는 런타임 상수
  final String title;

  // createState 함수를 호출하여 MyHomePageState 객체를 생성
  @override
  State<ContainerView> createState() => _MyHomePageState();
}

// MyHomePageState 클래스: MyHomePage 위젯의 상태를 관리하는 클래스
class _MyHomePageState extends State<ContainerView> {
  // build 함수: 위젯을 생성하는 함수
  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯: 머테리얼 디자인의 기본 레이아웃 구조를 제공
    return Scaffold(
      backgroundColor: Colors.grey,
      // body 속성에 Center 위젯을 사용하여 화면 중앙에 컨텐츠를 배치
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PlatformCheck 위젯을 생성하여 화면에 표시
          PlatformCheck(),
          _buildContainer(context),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    // kIsWeb 변수를 사용하여 현재 플랫폼이 웹인지 확인
    if (kIsWeb) {
      return _buildWideContainers();
      // Platform 클래스는 현재 플랫폼을 확인하는 기능을 제공
    } else if (Platform.isAndroid) {
      return _buildWideContainers();
    } else if (Platform.isIOS) {
      return _buildNarrowContainers();
    } else {
      return _buildNarrowContainers();
    }
  }

  Widget _buildWideContainers() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Red',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Green',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Blue',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowContainers() {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 100,
          child: Center(
            child: Text(
              'Red',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          color: Colors.green,
          height: 100,
          child: Center(
            child: Text(
              'Green',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Center(
            child: Text(
              'Blue',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
