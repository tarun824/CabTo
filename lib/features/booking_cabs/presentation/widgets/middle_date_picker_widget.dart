import 'package:cabto/features/booking_cabs/data/services/pick_date_time_service.dart';
import 'package:flutter/material.dart';

class MiddleDatePickerWidget extends StatefulWidget {
  const MiddleDatePickerWidget({super.key});

  @override
  State<MiddleDatePickerWidget> createState() => _MiddleDatePickerWidgetState();
}

class _MiddleDatePickerWidgetState extends State<MiddleDatePickerWidget> {
  String dateTimePicked = "Select Date and Time";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Top Suggestions for you",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "Pickup Date Time",
                    style: TextStyle(
                        fontFamily: "Inter", fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, left: 3, right: 22),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey[500],
                      ),
                      GestureDetector(
                          onTap: () async {
                            dateTimePicked = await PickDateTimeService()
                                .pickDateTime(context);
                            setState(() {});
                          },
                          child: Text(dateTimePicked)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
