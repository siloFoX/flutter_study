import "package:flutter/material.dart";

import "package:calendar_scheduler/component/custom_text_field.dart";
import "package:calendar_shceduler/const/colors.dart";


class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet ({Key? key}) :super(key : key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build (BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child : Container(
        height : MediaQuery.of(context).size.height / 2 + bottomInset,
        color : Colors.white,
        child : Padding(
          padding : const EdgeInsets.only(left : 8, right : 8, top : 8, bottom : bottomInset),
          child : Column(
            children : [
              Row(
                children : [
                  Expanded(
                    child : CustomTextField(
                      label : "start time",
                      isTime : true,
                    ),
                  ),
                  const SizedBox(width : 16.0),
                  Expanded(
                    child : CustomTextField(
                      label : "end time",
                      isTime : true,
                    ),
                  ),
                  const SizedBox(height : 8.0),
                  Expanded(
                    child : CustomTextField(
                      label : "content",
                      isTime : false,
                    ),
                  ),
                  SizedBox(
                    width : double.infinity,
                    child : ElevatedButton.styleForm(
                      primary : PRIMARY_COLOR,
                    ),
                    child : Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    void onSavePressed() {

    }
  }
}