import 'package:bamtol_market_app/main.dart';
import 'package:bamtol_market_app/src/init/init_start_page.dart';
import 'package:bamtol_market_app/src/init/splash.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool isInitStarted; // 앱이 처음으로 실행된 적이 있는 지 판단하는 변수

  @override
  void initState() {
    super.initState();
    isInitStarted = prefs.getBool('isInitStarted') ??
        true; // 저장된 boolean 값을 불러옵니다. 앱이 처음 실행된 상태라면 null이 됩니다. 이때 null 대신 true가 주입되도록 설정합니다
  }

  @override
  Widget build(BuildContext context) {
    // isInitStarted에 따라 초기 소개 페이지 또는 스플레시 페이지로 이동합니다
    return isInitStarted
        ? InitStartPage(
            onStart: () {
              setState(() {
                isInitStarted = false;
              });
              prefs.setBool('isInitStarted', isInitStarted);
            },
          )
        : const SplashPage();
  }
}
