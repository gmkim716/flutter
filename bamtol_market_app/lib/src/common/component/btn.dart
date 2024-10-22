import 'package:bamtol_market_app/src/common/component/app_font.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child; // 위젯을 받으면 다양한 위젯을 버튼에 넣을 수 있다
  final Function() onTap; // 부모 위젯에서 처리할 수 있도록 하고 전달 받는다
  const Btn({
    super.key,
    // btn 위젯 사용에 필요한 child, onTab에는 required 옵션을 추가한다
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: const Color(0xffED7738),
          child: const AppFont(
            '시작하기',
            align: TextAlign.center,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
