import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserGrade {
  BRONZE('BRONZE'),
  SILVER('SILVER'),
  GOLD('GOLD');

  const UserGrade(this.grade);
  final String grade;
}

enum ChartMode {
  DAY('일별'),
  MONTH('월별'),
  YEAR('연도별');

  const ChartMode(this.text);
  final String text;
}

class UserController extends GetxController {
  static UserController get to => Get.find();
  RxString userName = '토리'.obs;
  Rx<UserGrade> userGrade = UserGrade.GOLD.obs;
  RxInt totalDays = 35.obs;
  DateTime userCreateDate = DateTime(2023, 8, 3);
  RxInt userRate = 9.obs;
  RxDouble success = 97.0.obs;
  RxInt totalStudy = 70.obs;
  RxInt totalGold = 150000.obs;
  RxInt calendarMonth = DateTime.now().month.obs;
  RxInt userAttendance = 0.obs;
  Rx<ChartMode> chartMode = ChartMode.DAY.obs;
  Map<DateTime, List<String>> attendanceDays = {
    DateTime(2023, 12, 1): ['출석'],
    DateTime(2023, 12, 12): ['출석'],
    DateTime(2023, 12, 24): ['출석'],
    DateTime(2023, 12, 28): ['출석'],
  };

  @override
  void onInit() {
    super.onInit();
    changeMonthAttendance(DateTime.now().month);
  }

  List<String> getEventForDay(DateTime day) {
    return attendanceDays[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void changeMonthAttendance(int month) {
    var i = 0;
    for (var element in attendanceDays.keys) {
      if (element.month == month) {
        i++;
      }
      userAttendance(i);
    }
  }

  void changeMonth(int month) {
    calendarMonth(month);
  }

  void changeChartMode(String mode) {
    if (mode == '일별') {
      chartMode(ChartMode.DAY);
    } else if (mode == '월별') {
      chartMode(ChartMode.MONTH);
    } else {
      chartMode(ChartMode.YEAR);
    }
  }

  void showChangeChartDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width / 1.3,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    changeChartMode('일별');
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        '일별',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    changeChartMode('월별');
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        '월별',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    changeChartMode('연도별');
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        '연도별',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
