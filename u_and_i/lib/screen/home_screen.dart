import 'package:flutter/material.dart';

// 쿠퍼티노 (iOS) 위젯을 사용하기 위해 필요
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        // 시스템 UI를 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              // 하트를 눌렀을 때 실행할 함수 전달
              onHeartPressed: onHeartPressed,
              firstDay: firstDay, //
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    // 하트 눌렀을 때 실행할 함수
    print('클릭');

    // // 상태 변경 시 setState() 함수 실행
    // setState(() {
    //   // firstDay 변수에서 하루 빼기
    //   firstDay = firstDay.subtract(const Duration(days: 1));
    // });

    showCupertinoDialog(
      // 쿠퍼티노 다이얼로그 실행
      context: context, // 보여줄 다이얼로그 빌드
      builder: (BuildContext context) {
        // 날짜 선택하는 다이얼로그
        return Align(
          // 정렬을 지정하는 위젯
          alignment: Alignment.bottomCenter, // 아래 중간으로 정렬
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              // 날짜가 변경되면 실행되는 함수
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true, // 외부 탭할 경우 다이얼로그 닫기
    );
  }
}

class _DDay extends StatelessWidget {
  // 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  const _DDay({
    required this.onHeartPressed, // 상위에서 함수 입력받기
    required this.firstDay, // 날짜 변수 입력받기
  });

  @override
  Widget build(BuildContext context) {
    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); // 현재 날짜 시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          // 최상단 U%I 글자
          'U&I',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 16.0),
        Text(
          // 두 번째 글자
          '우리가 처음 만난 날',
          style: textTheme.headlineMedium,
        ),
        Text(
          // // 임시로 지정한 만난 날짜
          // '2019.5.19',
          // DateTime을 년.월.일로 형태 변경
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red, // 색상 빨강으로 변경
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          // 'D+365',
          // DDay 계산하기
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headlineSmall,
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // 이미지 중앙 정렬
      child: Image.asset(
        'asset/img/middle_image.png',
        // 화면 높이의 반만큼 높이 구현
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
