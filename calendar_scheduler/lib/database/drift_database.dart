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
class LocalDatabase extends _$LocalDatabase {}
