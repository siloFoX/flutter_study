import "package:drift/drift.dart";
import "package:drift/native.dart";
import "pakage:path_provider/path_provider.dart";
import "package:path/path.dart" as p;
import "dart:io";

import "package:calendar_scheduler/model/schedule.dart";


part "drift_database.g.dart";

@DriftDatabase(
  tables : [
    Schedules,
  ],
)


class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Stream<List<Schedule>> watchSchedules (DateTime date) => 
    (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

  Future<int> createSchedule (SchedulesCompanion data) => into(schedules).insert(data);

  Future<int> removeSchedule (int id) => (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  @override
  int get schemaVersion => 1;
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase(file);
  });
}