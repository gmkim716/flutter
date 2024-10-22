import 'package:bamtol_market_app/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetView를 사용하면 위젯 내에서 controller에 바로 접근할 수 있습니다
// Obx를 사용할 수 있기 때문에 GetX를 사용하는 경우 이 방식을 많이 사용합니다
class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          // Obx는 GetX 위젯과 동일한 효과를 줍니다. Obx는 GetX 위젯의 약식 형태입니다
          () => Text(
            '${controller.loadStep.value.name}중 입니다.',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
