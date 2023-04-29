import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:uuid/uuid.dart";

import "package:calendar_scheduler/model/schedule_model.dart";
import "package:calendar_scheduler/repository/schedule_repository";


class ScheduleProvider extends ChangeNotifier {
  final ScheduleRepository repository;
  
  DateTiem selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<ScheduleModel>> cache = {};

  ScheduleProvider ({required this.repository}) : super() {
    getSchedules(date : selectedDate);
  }

  void getSchedules ({required DateTime date }) async {
    final resp = await repossitory.getSchedules(date : date);
    
    cache.update(date, (value) => resp, ifAbsent : () => resp);

    notifyListeners();
  }

  void createSchedule ({required ScheduleModel schedule}) async {
    final targetDate = schedule.date;

    final uuid = Uuid();

    final tempId = uuid.v4();
    final newSchedule = schedule.copywith(id : tempId);

    // final savedSchedule = await repository.createSchedule(schedule : schedule);

    // cache.update(
    //   targetDate,
    //   (value) => [
    //     ...value,
    //     schedule.copywith(id : savedSchedule),
    //   ]..sort( (a, b) => a.startTime.compareTo(b.startTime) ),
    //   ifAbsent : () => [schedule],
    // );

    cache.update(
      targetDate,
      (value) => [
        ...value,
        newSchedule,
      ]..sort( (a, b) a.startTime.compareTo(b.startTime) ),
      ifAbsent : () => [newSchedule],
    );

    notifyListeners();

    try {
      final savedSchedule = await repository.createSchedule(schedule : schedule);

      cache.update(
        targetDate,
        (value) => value.map( 
          (e) => e.id == tempId ? e.copywith(id : savedSchedule) : e
          ).toList(),
      );
    } catch (e) {
      cache.update(
        targetDate,
        (value) => value.where( (e) => e.id != tempId).toList(),
      );
    }

    notifyListeners();
  }

  void deleteSchedule ({
    required DateTime date,
    required String id,
    }) async {
      // final resp = await repository.deleteSchedule(id : id);

      // cache.update(date, (value) => value.where( (e) => e.id != id ).toList(), ifAbsent : () => []);
      final targetSchedule = cache[date]!.firstWhere( (e) => e.id == id );

      cache.update(
        date,
        (value) => value.where( (e) => e.id != id ).toList(),
        ifAbsent : () => [],
      );

      notifyListeners();

      try {
        await repository.deleteSchedule(id : id);
      } catch (e) {
        cache.update(
          date,
          (value) => [...value, targetSchedule]..sort( (a, b) => a.startTime.compareTo(b.startTime) ),
        );
      }

      notifyListeners();
    }

    void changeSelectedDate ({required DateTime date}) {
      selectedDate = date;
      notifyListeners();
    }
}