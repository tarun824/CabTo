import 'package:cabto/utilities/constants.dart';
import 'package:flutter/material.dart';

class TextfieldInputDecoration {
  // TextfielInputDecoration(String this.da);
  static const textFieldborderRadius = Constants.textFieldBorderRadius;

  InputDecoration textfieldInputDecoration(
      String labelText, String hintText, String errorText) {
    //st parameter label,2nd hint Text ,3rd Error message
    return InputDecoration(
      hintText: "  $hintText", labelText: labelText,
      labelStyle: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600),
      // label: Text("  ${labelText}"),
      // errorText: errorText,
      prefixIcon: const Icon(Icons.search_rounded),
      fillColor: Colors.grey.shade200,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 18),
      // border: const OutlineInputBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(10.0),
      //   ),
      // ),
      // enabledBorder: const OutlineInputBorder(
      //   borderRadius: textFieldborderRadius,
      // ),
    );
  }
}
