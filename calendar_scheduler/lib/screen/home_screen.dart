import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';

import 'package:get_it/get_it.dart';
import 'package:calendar_scheduler/database/drift_database.dart';

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
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate, // 선택된 날짜 전달
            ),
            // BottomSheet의 높이를 화면의 최대 높이로 정의하고 스크롤 가능하게 변경
            isScrollControlled: true,
          );
        },

        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
          // 시스템 UI를 피해서 UI 구현하기
          child: Column(
        // 달력과 리스트를 세로로 배치
        children: [
          MainCalendar(
            // 미리 작업해둔 달력 위젯 보여주기
            selectedDate: selectedDate, // 선택된 날짜 전달하기
            onDaySelected: onDaySelected, // 날짜가 선택됐을 때 실행할 함수
          ),
          const SizedBox(height: 8.0),

          // 배너 추가하기
          TodayBanner(selectedDate: selectedDate, count: 0),
          const SizedBox(height: 8.0),

          Expanded(
              // 남은 공간 모두 차지하기
              child: StreamBuilder<List<Schedule>>(
                  // 일정 정보가 Stream으로 제공되기 때문에 StreamBuilder 사용
                  stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      // 데이터가 없을 때
                      return Container();
                    }

                    return ListView.builder(
                      // 화면에 보이는 값들만 렌더링하는 리스트
                      itemCount: snapshot.data!.length, // 리스트에 입력할 값들의 총 개수
                      itemBuilder: (context, index) {
                        final schedule =
                            snapshot.data![index]; // 현재 index에 해당되는 일정

                        return Padding(
                          // 좌우로 패딩을 추가해서 UI 개선
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 8.0, right: 8.0),
                          child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content),
                        );
                      },
                    );
                  }))
        ],
      )),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDay) {
    // 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
