import 'package:cabto/utilities/textfield_input_decoration.dart';
import 'package:flutter/material.dart';

class CityCab extends StatefulWidget {
  const CityCab({super.key});

  @override
  State<CityCab> createState() => _CityCabState();
}

class _CityCabState extends State<CityCab> {
  String _searchLocation = '';
  TextEditingController _searchLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: _searchLocationController,
        decoration: TextfieldInputDecoration()
            //st parameter label,2nd hint Text ,3rd Error message
            .textfieldInputDecoration(
                "Destination", "Enter Destination", "Enter Destination"),
        onChanged: (value) {
          _searchLocation = value;
        },
      ),
    );
  }
}
