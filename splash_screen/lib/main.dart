import 'package:flutter/material.dart';

void main() {
  runApp(const SplashScreen()); // SplashScreen 위젯을 첫 화면으로 지정
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // stateless 위젯 선언

  @override
  Widget build(BuildContext context) {
    // 위젯의 UI 구현
    return MaterialApp(
      home: Scaffold(
        // 항상 최상단에 입력되는 위젯
        body: Container(
          // 항상 두번째로 입력되는 위젯
          decoration: const BoxDecoration(
            // 컨테이너 위젯
            color: Colors.amber,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 300 // 너비 추가
                      ),
                  const Text(
                    '안녕하세진',
                    style: TextStyle(fontSize: 50),
                  ),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ), // 로딩 애니메이션
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
