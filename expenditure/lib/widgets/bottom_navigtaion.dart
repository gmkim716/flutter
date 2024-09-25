import 'package:flutter/material.dart';

class BottomNavigtaion extends StatefulWidget {
  final List<Widget> screens;

  const BottomNavigtaion(
      {super.key, required this.screens}); // screen을 필수로 받는 생성자

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigtaion> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('여행 경비 트래커'),
      ),
      body: Center(
        child: widget.screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '지출 입력',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '지출 내역',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // 탭 선택 시 화면을 전환한다
      ),
    );
  }
}
