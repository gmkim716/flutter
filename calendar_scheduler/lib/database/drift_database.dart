import 'dart:io';

import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

// private값까지 불러올 수 있음
part 'drift_database.g.dart'; // part 파일 지정

@DriftDatabase(
  // 사용할 테이블 등록
  tables: [
    Schedules,
  ],
)
// Code Generation으로 생성할 클래스 상속: class {상속 클래스명} extends_${부모 클래스}
// 코드를 입력할 때는 클래스가 생성되지 않아 에러가 발생하지만
// flutter pub run build_runner build 명령어를 입력하면 클래스가 생성됨, drift_database.g.dart 파일 생성
class LocalDatabase extends _$LocalDatabase {
  // 데이터베이스 파일을 생성하고 연동. 드리프트 DB 객체는 부모 생성자에 LazyDatabase를 필수로 넣어줘야 한다.
  // LazyDatabase 객체에는 데이터베이스를 생성할 위치에 대한 정보를 입력해준다
  LocalDatabase() : super(_openConnection());

  // get
  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      // 데이터 조횜 및 변화 감지, 특정 날짜의 일정만 불러오기 위해 where 사용, 드래프트로 필터링을 진행할 때는 == 가 아닌 equals()로 비교
      (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

  // insert
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  // delete
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  // 드리프트 데이터베이스 클래스는 필수로 schemaVersion 값을 지정해줘야 한다
  // 기본적으로 1부터 시작하고, 변화가 있을 때마다 1씩 올려주서ㅓ 테이블 구조가 변경된다는 걸 드리프트에 인지시키는 기능
  @override
  int get schemaVersion => 1;
}

// SQLite는 파일 기반으로 데이터를 저장하기 때문에 필수적으로 DB 파일 위치를 제공해줘야 한다
// path_provider 패키지의 getApplicationDocumentsDirectory() 함수를 사용하면 현재 앱에 배정된 폴더의 경로를 받을 수 있다.
// db.sqlite라는 파일을 데이터베이스 파일로 사용해보자
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 데이터베이스 파일을 저장할 폴더
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
