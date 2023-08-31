import 'package:flutter/material.dart';

import 'package:cabto/utilities/constants.dart';
import 'package:cabto/utilities/textfield_input_decoration.dart';

class Rental extends StatefulWidget {
  const Rental({super.key});

  @override
  State<Rental> createState() => _RentalState();
}

class _RentalState extends State<Rental> {
  static const allPadding = Constants.allPadding;
  static const sidePadding = Constants.sidePadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Select packages",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 115,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 28.0, bottom: 28, right: 16),
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFFffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text("8 Hr"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text("80 KM"),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: TextfieldInputDecoration()
                //st parameter label,2nd hint Text ,3rd Error message
                .textfieldInputDecoration(
                    "Destination", "Enter Destination", "Enter Destination"),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
