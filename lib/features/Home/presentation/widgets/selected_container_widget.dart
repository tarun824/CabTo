import 'package:flutter/material.dart';

Widget selectedContainerWidget(width) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Container(
      height: 5,
      width: width,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22))),
    ),
  );
}
