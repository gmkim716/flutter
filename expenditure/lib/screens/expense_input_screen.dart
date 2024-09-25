import 'package:expenditure/widgets/current_location_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseInputScreen extends StatefulWidget {
  const ExpenseInputScreen({super.key});

  @override
  _ExpenseInputScreenState createState() => _ExpenseInputScreenState();
}

class _ExpenseInputScreenState extends State<ExpenseInputScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  String? _selectedCategory;
  final List<String> _categories = ['식비', '숙박비', '교통비', '문화생활', '기타'];

  void _pickDateTime() async {
    // 날짜 선택
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // 시간 선택
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  // 메시지를 상단에 잠시 표시하는 메서드
  void _showErrorMessage(String message) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0, // 메시지의 위치
        left: 0.0,
        right: 0.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    // 메시지를 상단에 추가
    Overlay.of(context).insert(overlayEntry);

    // 2초 후에 메시지 자동으로 사라지게 함
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry?.remove();
    });
  }

  // 지출 내역을 저장한다
  void saveExpense() {
    String title = _titleController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String formattedDate = DateFormat('yMMMd, HH:mm').format(_selectedDateTime);
    String category = _selectedCategory ?? '카테고리 미선택';

    // 콘솔 창에서 확인
    print('Title: $title');
    print('Price: $price');
    print('Date: $formattedDate');
    print('Category: $category');

    // 예외 처리 및 검증 추가
    if (title.isEmpty || price <= 0) {
      _showErrorMessage('지출 명과 금액을 정확히 입력해주세요');
      return;
    }

    // 저장 후 입력 필드 초기화한다
    _titleController.clear();
    _priceController.clear();
    setState(() {
      _selectedCategory = null; // 선택된 카테고리 초기화
      _selectedDateTime = DateTime.now(); // 날짜 초기화
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지출 내역 입력'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              hint: const Text('카테고리 선택'),
              value: _selectedCategory,
              isExpanded: true,
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: '지출 내역',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: '금액',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CurrentLocationInput(locationController: _locationController),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '선택된 날짜: ${DateFormat('yMMMd, HH:mm').format(_selectedDateTime)}',
                  ),
                ),
                ElevatedButton(
                  onPressed: _pickDateTime,
                  child: const Text('날짜 선택'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveExpense,
              child: const Text('지출 저장'),
            ),
          ],
        ),
      ),
    );
  }
}
