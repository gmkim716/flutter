import 'package:bamtol_market_app/splash/enum/step_type.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // StepType enum 클래스를 만들고 상태관리에 등록합니다
  // 초깃값으로 dataLoad 단계를 설정합니다
  Rx<StepType> loadStep = StepType.dataLoad.obs;

  // 상태 변경을 담당하는 함수를 추가
  changeStep(StepType type) {
    loadStep(type);
  }
}
