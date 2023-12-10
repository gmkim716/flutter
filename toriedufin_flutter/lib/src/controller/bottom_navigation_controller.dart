import 'package:get/get.dart';

enum RootPage { HOME, PAGE1, PAGE2, PAGE3, PAGE4 }

class BottomNavigationController extends GetxController {
  static BottomNavigationController get to => Get.find();
  Rx<RootPage> currentPage = RootPage.HOME.obs;
  int selectedIndex = 0;

  void changePage(int pageIndex) {
    var page = RootPage.values[pageIndex];
    switch (page) {
      case RootPage.HOME:
        break;
      case RootPage.PAGE1:
        break;
      case RootPage.PAGE2:
        break;
      case RootPage.PAGE3:
        break;
      case RootPage.PAGE4:
        break;
    }
    currentPage(page);
  }
}
