import "package:flutter/material.dart";
import "package:drift/drift.dart" hide Column;
import "package:get_it/get_it.dart";

import "package:calendar_scheduler/component/custom_text_field.dart";
import "package:calendar_scheduler/const/colors.dart";
import "package:calendar_scheduler/database/drift_database.dart";


class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet ({
    required this.selectedDate,
    Key? key,
    }) :super(key : key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build (BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Form(
      key : formKey,
      child : SafeArea(
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
                        onSaved : (String? val) {
                          startTime = int.parse(val!);
                        },
                        validator : timeValidator,
                      ),
                    ),
                    const SizedBox(width : 16.0),
                    Expanded(
                      child : CustomTextField(
                        label : "end time",
                        isTime : true,
                        onSaved : (String? val) {
                          endTime = int.parse(val!);
                        },
                        validator : timeValidator,
                      ),
                    ),
                    const SizedBox(height : 8.0),
                    Expanded(
                      child : CustomTextField(
                        label : "content",
                        isTime : false,
                        onSaved : (String? val) {
                          content = val;
                        },
                        validator : contentValidator,
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
      ),
    );

    void onSavePressed() async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        await GetIt.I<localDatabase>().createSchedule(
          SchedulesCompanion(
            startTime : Value(startTime!),
            endTime : Value(endTime!),
            content : Value(content!),
            date : Value(widget.selectedDate),
          ),
        );

        Navigator.of(context).pop();
      }
    }

    String? timeValidator (String? val) {
      if (val == null)
        return "Please write the contents";
      
      int? number;

      try {
        number = int.parse(val);
      } catch (e) {
        return "Please write numbers";
      }

      if (number < 0 || number > 24) 
        return "Please write number 0 to 24";

      return null;
    }

    String? contentValidator (String? val) {
      if (val == null || val.length == 0)
        return "Please write contents";
      
      return null;
    }
  }
}