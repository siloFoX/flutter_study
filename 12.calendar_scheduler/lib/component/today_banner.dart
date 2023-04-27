import "package:flutter/material.dart";

import "package:calendar_scheduler/const/colors.dart";


class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;
  final int count;

  const TodayBanner ({
    required this.selectedDate,
    required this.count,
    Key? key,
  }) : super(key : key);

  @override
  Widget build (BuildContext context) {
    final textStyle = TextStyle(
      fontWeight : FontWeight.w600,
      color : Colors.white,
    );

    return Container(
      color : PRIMARY_COLOR,
      child : Padding(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children : [
          Text(
            "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일",
            style : textStyle,
          ),
        ],
      ),
    );
  }
}