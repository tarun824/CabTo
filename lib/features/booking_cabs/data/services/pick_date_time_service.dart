import 'package:flutter/material.dart';

class PickDateTimeService {
  DateTime datePicked = DateTime.now();

  String TimePicked = "";
  Future<String> pickDateTime(context) async {
    DateTime? dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (dateSelected != null) {
      datePicked = dateSelected;
    }
    TimeOfDay? timeSelected =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timeSelected != null) {
      TimePicked = timeSelected.format(context);
    }
    if (datePicked != null &&
        TimePicked != "" &&
        datePicked != DateTime.now()) {
      return "${datePicked.day}-${datePicked.month}-${datePicked.year} ${TimePicked}";
    }
    return "Select Date and Time";
  }
}
