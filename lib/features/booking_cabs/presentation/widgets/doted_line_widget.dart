import 'package:flutter/material.dart';

class DotedLineWidget extends StatelessWidget {
  const DotedLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 10,
          child: VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
