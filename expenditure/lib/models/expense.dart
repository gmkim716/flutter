class Expense {
  final String title; // 지출 항목
  final double price; // 지출 금액
  final int amount; // 정수 타입 확인
  final DateTime time; // 시간
  final String category; // 지출 카테고리
  final String currency; // 화폐 단위
  final String paymentMethod; // 지불 수단(카드, 현금)
  final String? description; // 추가 설명
  final String location; // 지출 장소
  final String status; // 지출 상태 (지불완료/지불대기)
  final String? receiptUrl; // 영수증 URL

  // 생성자
  Expense({
    required this.title,
    required this.price,
    required this.amount,
    required this.time,
    required this.category,
    required this.currency,
    required this.paymentMethod,
    this.description,
    required this.location,
    required this.status,
    this.receiptUrl,
  }) {
    if (title.isEmpty) {
      throw ArgumentError('지출 내역을 입력해주세요.');
    }
    if (price <= 0) {
      throw ArgumentError('지출 금액은 0보다 커야 합니다.');
    }
    if (amount <= 0) {
      throw ArgumentError('지출 수량은 0보다 커야 합니다.');
    }
    if (currency.isEmpty) {
      throw ArgumentError('화폐 단위를 입력해주세요.');
    }
    if (category.isEmpty) {
      throw ArgumentError('지출 카테고리를 입력해주세요.');
    }
    if (paymentMethod.isEmpty) {
      throw ArgumentError('지불 수단을 입력해주세요.');
    }
    if (location.isEmpty) {
      throw ArgumentError('지출 장소를 입력해주세요.');
    }
    if (status.isEmpty) {
      throw ArgumentError('지불 상태를 입력해주세요.');
    }
    if (time.isAfter(DateTime.now())) {
      throw ArgumentError('미래의 날짜를 지정할 수 없습니다.');
    }
  }

  // 서버에서 받아온 데이터를 모델로 변환하는 팩토리 메서드
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      price: json['price'],
      amount: json['amount'],
      time: DateTime.parse(json['time']),
      category: json['category'],
      currency: json['currency'],
      paymentMethod: json['paymentMethod'],
      description: json['description'],
      location: json['location'],
      status: json['status'],
      receiptUrl: json['receiptUrl'],
    );
  }

  // 데이터를 서버로 전송할 때 사용할 JSON 변환 메서드
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'amount': amount,
      'time': time.toIso8601String(), // 날자 및 시간을 모두 포함하는 형식
      'category': category,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'description': description,
      'location': location,
      'status': status,
      'receiptUrl': receiptUrl,
    };
  }
}
