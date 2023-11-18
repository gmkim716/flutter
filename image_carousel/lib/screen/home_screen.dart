import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async'; // async 패키지 불러오기

// StatefulWidget 정의
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// _HomeScreenState 정의
class _HomeScreenState extends State<HomeScreen> {
  // PageController 생성
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState(); // 부모 initState() 실행

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        // 현재 페이지 가져오기
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return; // 페이지 값이 없을 때 예외 처리
        }

        if (nextPage == 4) {
          // 첫 페이지와 마지막 페이지 분기 처리
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          // 페이지 변경
          nextPage, duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색상 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
        controller: pageController, // PageController 등록
        children: [1, 2, 3, 4, 5] // 심플 리스트 생성
            .map(
              // 위젯으로 매핑
              (number) => Image.asset(
                'assets/img/$number.jpg',
                fit: BoxFit.cover, // BoxFit.cover 설정
              ),
            )
            .toList(),
      ),
    );
  }
}
