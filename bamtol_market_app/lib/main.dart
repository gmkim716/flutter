import 'package:bamtol_market_app/splash/splash_controller.dart';
import 'package:bamtol_market_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int count = 0;
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '당근마켓 클론 코딩',
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color(0xff212123),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff212123),
      ),
      initialBinding: BindingsBuilder(() {  // initialBinding 옵션을 통해 SplashController를 등록
        Get.put(SplashController());
      }),
      getPages: [
        GetPage(name: '/', page: () => const App()),
      ],
    );
  }
}
