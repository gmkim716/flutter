import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  // StatefulWidget으로 전환: 상태관리를 하기 위함
  // const HomeScreen({Key? key}) : super(key: key);
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 선택된 날짜를 관리할 변수
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // 새 일정 버튼
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          // BottomSheet 열기
          showModalBottomSheet(
            context: context,
            isDismissible: true, // 배경 탭했을 때 BottomSheet 닫기
            builder: (_) => const ScheduleBottomSheet(),
            // BottomSheet의 높이를 화면의 최대 높이로 정의하고 스크롤 가능하게 변경
            isScrollControlled: true,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      // 시스템 UI를 피해서 UI 구현하기

      body: SafeArea(
        // 달력과 리스트를 세로로 배치
        child: Column(
          children: [
            // 미리 작업해둔 달력 위젯 보여주기
            MainCalendar(
              // 선택된 날짜 전달하기
              selectedDate: selectedDate,
              // 날짜가 선택됐을 때 실행할 함수
              onDaySelected: onDaySelected,
            ),
            const SizedBox(height: 8.0),

            // 배너 추가하기
            TodayBanner(selectedDate: selectedDate, count: 0),

            const ScheduleCard(
              startTime: 12,
              endTime: 14,
              content: '프로그래밍 공부',
            ),

            const ScheduleBottomSheet()
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDay) {
    // 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
