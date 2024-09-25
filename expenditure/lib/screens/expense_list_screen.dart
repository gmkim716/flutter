import 'package:flutter/material.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('여행 경비 트래커'),
      ),
      body: const Center(
        child: Text("지출 내역을 표시할 화면입니다."),
      ),
    );
  }
}
