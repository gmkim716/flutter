import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        // 테마를 지정할 수 있는 클래스
        fontFamily: 'sunflower', // 기본 글씨체
        textTheme: const TextTheme(
          // 글짜 테마를 적용할 수 있는 클래스
          // diplayLarge
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700, // 글씨 두께
            fontFamily: 'parisienne', // 글씨체
          ),

          // diplayMedium
          displayMedium: TextStyle(
              color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w700),

          // displaySmall
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
          ),

          // headlineMedium
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
