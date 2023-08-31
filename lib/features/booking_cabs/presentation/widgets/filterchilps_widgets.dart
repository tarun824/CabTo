import 'package:flutter/material.dart';

class FilterchipsWidgets extends StatefulWidget {
  FilterchipsWidgets({
    super.key,
    required this.text1,
    required this.text2,
    required this.boolval,
  });
  final text1;
  final text2;
  final boolval;

  @override
  State<FilterchipsWidgets> createState() => _FilterchipsWidgetsState();
}

class _FilterchipsWidgetsState extends State<FilterchipsWidgets> {
  bool boolValue = false;
  String textValue = "";
  String text1Value = "";

  @override
  void initState() {
    boolValue = widget.boolval;
    textValue = widget.text1;
    text1Value = widget.text2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
                label: Text(textValue),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                //if boolValue is false then text1 will se selected
                selected: !boolValue,
                backgroundColor: Colors.transparent,
                selectedColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  side: !boolValue ? BorderSide.none : BorderSide(),
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: (selectedBool) {
                  //we are making boolValue true to make selected for text2

                  setState(() {
                    boolValue = false;
                  });
                }),
          ),
          FilterChip(
              backgroundColor: Colors.transparent,
              label: Text(text1Value),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
              //if boolValue is true then text2 will se selected
              selected: boolValue,
              selectedColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                side: boolValue ? BorderSide.none : BorderSide(),
                borderRadius: BorderRadius.circular(10),
              ),
              onSelected: (selectedBool) {
                setState(() {
                  boolValue = true;
                });
              }),
        ],
      ),
    );
  }
}
