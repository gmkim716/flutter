import 'package:bamtol_market_app/src/common/component/app_font.dart';
import 'package:bamtol_market_app/src/common/component/btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class InitStartPage extends StatelessWidget {
  final Function()
      onStart; // 필수 함수로 받도록 처리하고, app.dart에서 onStart 함수를 정의해서 사용합니다
  const InitStartPage({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset('assets/images/logo_simbol.png'),
            ),
            const SizedBox(height: 40),
            Text(
              '당신 근처의 밤톨마켓',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              '중고 거래부터 동네 정보까지 \n지금 내 동네를 선택하고 시작해보세요!',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25 +
                // iOS에서 하단에서 위로 쓸어올리면 제어 센터 영역이 나타나기 때문에 UI가 답답해보일 수 있어, MediaQuery를 통해 iOS에서만 더 큰 간격을 줄 수 있도록 합니다
                Get.mediaQuery.padding.bottom),
        child: Btn(
          onTap: onStart,
          child: const AppFont(
            '시작하기',
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
