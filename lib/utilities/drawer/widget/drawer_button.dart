import 'package:cabto/utilities/constants.dart';
import 'package:flutter/material.dart';

Container DrawerButton(BuildContext context, IconData icon,
    String onPressedNavigate, String text) {
  // IconData icon = Icons.border_all_rounded;
  // String onPressed = "";
  // String text = "";
  return Container(
    padding: Constants.allPadding,
    height: 60,
    width: double.infinity,
    child: TextButton.icon(
        style: const ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          // onPressed
          Navigator.popAndPushNamed(context, onPressedNavigate);
        },
        icon: Icon(
          icon,
          color: Color.fromRGBO(104, 126, 255, 1),
        ),
        label: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
  );
}
