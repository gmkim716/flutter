import 'package:flutter/material.dart';
import 'screens/expense_input_screen.dart';
import 'screens/expense_list_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '여행 경비 트래커',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(), // BottomNavigation을 앱의 메인 화면으로 설정
    );
  }
}

// BottomNavigation 위젯 정의
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    ExpenseInputScreen(),
    ExpenseListScreen(),
    SettingsScreen(),
  ];

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
        child: _screens[_selectedIndex], // 선택된 화면을 보여줌
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        onTap: _onItemTapped, // 탭 선택 시 화면 전환
      ),
    );
  }
}
