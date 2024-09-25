import 'dart:convert';
import 'package:http/http.dart' as http; // http 패키지를 추가
import 'package:expenditure/models/expense.dart';

class ExpenseService {
  final String apiUrl = 'https://api.example.com/expenses'; // 예시 API URL

  // 서버에서 지출 데이터를 가져오는 메서드
  Future<List<Expense>> fetchExpenses() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Expense.fromJson(json)).toList();
    } else {
      throw Exception('지출 내역을 불러오는데 실패했습니다.');
    }
  }

  // 서버에 새로운 지출 데이터를 추가하는 메서드
  Future<void> addExpense(Expense expense) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(expense.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('지출 내역을 추가하는데 실패했습니다.');
    }
  }

  // 서버에서 특정 지출 항목을 삭제하는 메서드
  Future<void> deleteExpense(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('지출 내역을 삭제하는데 실패했습니다.');
    }
  }

  // 서버에서 특정 지출 항목을 업데이트하는 메서드
  Future<void> updateExpense(String id, Expense expense) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {
        'Content-Type': 'application/json; charset-UTF-8',
      },
      body: jsonEncode(expense.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('지출 내역을 업데이트하는데 실패했습니다.');
    }
  }
}
