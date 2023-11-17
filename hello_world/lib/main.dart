// 머티리얼 디자인과 관련된 기능으 불러오는 코드
// material.dart 파일을 불러와야 플러터에서 기본 제공해주는 위젯들을 사용할 수 있다
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      // 머티리얼 디자인 위젯
      home: Scaffold(
          // Scaffoled 위젯: MaterialApp 위젯 다음으로 위치하는 위젯, 화면 전체를 차지하고, 레이아웃을 도와주며 UI 관련 특수 기능을 제공. ex) 화면에 알림과 같은 스낵바 실행, 화면 위에 앱바 추가, 아래에 탭바 추가 등
          body: Center(
              child: Text(
    'Hello Code Factory', // 마지막 매개변수 끝에 콤마 추가하기: 코드 자동 정리 실행 시 기준
  )))));
}
