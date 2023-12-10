import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:toriedufin_flutter/src/components/calendar_widget.dart';
import 'package:toriedufin_flutter/src/controller/user_controller.dart';

import 'package:intl/intl.dart';

class Home extends GetView<UserController> {
  const Home({super.key});

  Widget homeBox({
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              content,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 81, 78, 78)),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeRateBox({
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('로고'),
        backgroundColor: Colors.grey[200],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img02.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(controller.userGrade.value.grade,
                        style:
                            TextStyle(fontSize: 20, color: Colors.amber[600])),
                  ],
                ),
                Text('반갑습니다 ${controller.userName.value}님',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            '토리에듀핀과 함께',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '총 ${controller.attendanceDays.length}일',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            '가입 ${DateFormat('yyyy.MM.dd').format(controller.userCreateDate)}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Image.asset(
                          'assets/images/image01.png',
                          width: 150,
                          height: 150,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                homeBox(title: '금융지능순위', content: '${controller.userRate}위'),
                const SizedBox(height: 15),
                homeBox(title: '정답율', content: '${controller.success.value}%'),
                const SizedBox(height: 15),
                homeBox(
                    title: '학습량', content: '${controller.totalStudy.value}%'),
                const SizedBox(height: 15),
                homeBox(
                    title: '총 학습 Gold',
                    content: NumberFormat('###,###,###,###')
                        .format(controller.totalGold.value)),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const CalendarWidget(),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 202, 198, 198)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '${controller.calendarMonth.value}월 출석  ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            TextSpan(
                                text:
                                    '총 ${controller.userAttendance.value.toString()}일',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(width: 3),
                        Text(
                          '수익률 현황',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        controller.showChangeChartDialog(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            controller.chartMode.value.text,
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 15),
                homeRateBox(
                    title: '이달 수익률', content: '-3%', color: Colors.blue),
                const SizedBox(height: 15),
                homeRateBox(
                    title: '누적수익률',
                    content: '23%',
                    color: const Color.fromARGB(255, 232, 163, 72)),
                const SizedBox(height: 15),
                homeRateBox(
                    title: '손익금액',
                    content: '25,340',
                    color: const Color.fromARGB(255, 232, 163, 72)),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
