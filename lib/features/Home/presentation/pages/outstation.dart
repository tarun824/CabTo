import 'package:flutter/material.dart';
import 'package:cabto/utilities/constants.dart';
import 'package:cabto/utilities/textfield_input_decoration.dart';

class Outstation extends StatefulWidget {
  const Outstation({super.key});

  @override
  State<Outstation> createState() => _OutstationState();
}

class _OutstationState extends State<Outstation> {
  static const allPadding = Constants.allPadding;
  static const sidePadding = Constants.sidePadding;
  bool isRoundWay = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: TextfieldInputDecoration()
                //st parameter label,2nd hint Text ,3rd Error message
                .textfieldInputDecoration(
                    "Destination", "Enter Destination", "Enter Destination"),
            onChanged: (value) {
              // _searchLocation = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                    label: const Text("One-way"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8),
                    selected: !isRoundWay,
                    backgroundColor: Colors.transparent,
                    selectedColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      side: !isRoundWay ? BorderSide.none : const BorderSide(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (selectedBool) {
                      setState(() {
                        isRoundWay = false;
                      });
                    }),
              ),
              FilterChip(
                  backgroundColor: Colors.transparent,
                  label: const Text("Round-trip"),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                  selected: isRoundWay,
                  selectedColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    side: isRoundWay ? BorderSide.none : const BorderSide(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onSelected: (selectedBool) {
                    setState(() {
                      isRoundWay = true;
                    });
                  }),
            ],
          ),
        ),
        isRoundWay
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: TextfieldInputDecoration()
                      //st parameter label,2nd hint Text ,3rd Error message
                      .textfieldInputDecoration("Return Date",
                          "Enter Return Date", "Enter Return Date")
                      .copyWith(
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                      ),
                  onChanged: (value) {},
                ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
      ],
    );
  }
}
