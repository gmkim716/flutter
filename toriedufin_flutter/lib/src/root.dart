import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toriedufin_flutter/src/controller/bottom_navigation_controller.dart';
import 'package:toriedufin_flutter/src/home.dart';
import 'package:toriedufin_flutter/src/page/page_1.dart';
import 'package:toriedufin_flutter/src/page/page_2.dart';
import 'package:toriedufin_flutter/src/page/page_3.dart';
import 'package:toriedufin_flutter/src/page/page_4.dart';

class RootWidget extends GetView<BottomNavigationController> {
  const RootWidget({super.key});

  Widget indexStack() {
    return Obx(
      () => IndexedStack(
          index: controller.currentPage.value.index,
          children: const [
            Home(),
            PageOne(),
            PageTwo(),
            PageThree(),
            PageFour()
          ]),
    );
  }

  BottomNavigationBarItem bottomNavItemWidget(
      {required Icon icon, required String label, required Icon activeIcon}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: icon,
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: activeIcon,
      ),
      label: label,
    );
  }

  Widget navMenu() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, -0.3),
        )
      ]),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentPage.value.index,
        onTap: controller.changePage,
        selectedFontSize: 12,
        selectedItemColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          bottomNavItemWidget(
              icon: const Icon(Icons.home),
              label: '메인',
              activeIcon: const Icon(
                Icons.home,
                color: Colors.blue,
              )),
          bottomNavItemWidget(
              icon: const Icon(Icons.book),
              label: '금융퀴즈',
              activeIcon: const Icon(
                Icons.book,
                color: Colors.blue,
              )),
          bottomNavItemWidget(
              icon: const Icon(Icons.add_chart_outlined),
              label: '모의투자',
              activeIcon: const Icon(
                Icons.add_chart_outlined,
                color: Colors.blue,
              )),
          bottomNavItemWidget(
              icon: const Icon(Icons.chat),
              label: '커뮤니티',
              activeIcon: const Icon(
                Icons.chat,
                color: Colors.blue,
              )),
          bottomNavItemWidget(
              icon: const Icon(Icons.person_2_outlined),
              label: '내정보',
              activeIcon: const Icon(
                Icons.person_2_outlined,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: indexStack(),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}
