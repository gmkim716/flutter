import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: const Text('100원 1000원 모으는 짠테크 시대'),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        '10원 100원 아끼는 짠테크 시대',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
