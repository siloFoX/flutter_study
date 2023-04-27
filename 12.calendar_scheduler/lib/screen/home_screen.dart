import "package:flutter/material.dart";

import "package:calendar_scheduler/component/main_calendar.dart";
import "package:calendar_scheduler/component/schedule_card.dart";
import "package:calendar_scheduler/component/today_banner.dart";
import "package:calendar_scheduler/component/schedule_bottom_sheet.dart";
import "package:calendar_scheduler/const/colors.dart";


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      floatingActionButton : FloatingActionButton(
        backgroundColor : PRIMARY_COLOR,
        onPressed : () {
          showModelBottomSheet(
            context : context,
            isDismissible : true,
            builder : (_) => scheduleBottomSheet(),
            isScrollControlled : true,
          );
        },
        child : Icon(
          icon : Icons.add,
        ),
      ),
      body : SafeArea(
        child : Column(
          children : [
            MainCalendar(
              selectedDate : selectedDate,
              onDaySelected : onDaySelected,
            ),
            SizedBox(height : 8.0),
            TodayBanner(
              selectedDate : selectedDate,
              count : 0,
            ),
            ScheduleCard(
              startTime : 12,
              endTime : 14,
              content : "schedule card sample",
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected (DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}