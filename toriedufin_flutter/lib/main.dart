import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:toriedufin_flutter/src/controller/bottom_navigation_controller.dart';
import 'package:toriedufin_flutter/src/controller/user_controller.dart';
import 'package:toriedufin_flutter/src/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(UserController());
        Get.put(BottomNavigationController());
      }),
      home: const RootWidget(),
    );
  }
}
