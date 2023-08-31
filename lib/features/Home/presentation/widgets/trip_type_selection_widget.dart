import 'package:flutter/material.dart';

class TripTypeSelectionWidget extends StatelessWidget {
  TripTypeSelectionWidget(
      {super.key,
      required this.iconData,
      required this.text,
      required this.color});
  IconData iconData;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(
            iconData,
            color: color,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              text,
              style: TextStyle(
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
