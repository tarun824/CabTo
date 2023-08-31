// import 'dart:html';

import 'package:cabto/features/Home/presentation/widgets/selected_container_widget.dart';
import 'package:cabto/features/Home/presentation/widgets/trip_type_selection_widget.dart';
import 'package:cabto/utilities/drawer/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cabto/features/Home/presentation/pages/city_cab.dart';
import 'package:cabto/features/Home/presentation/pages/outstation.dart';
import 'package:cabto/features/Home/presentation/pages/rental.dart';
import 'package:cabto/utilities/textfield_input_decoration.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchLocation = '';
  TextEditingController _searchLocationController = TextEditingController();
  int selected = 0;
  List pages = [CityCab(), Rental(), Outstation()];
  late GoogleMapController mapController;
  String _darkMapStyle = "";
  late LocationData currentLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: const Text(
            "CABTO",
            style: TextStyle(
                fontSize: 26,
                fontFamily: "AlumniSans",
                fontWeight: FontWeight.w800),
          )),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                  "assets/images/main_map.png",
                  fit: BoxFit.cover,
                )),
                Positioned(
                  top: 25,
                  right: 25,
                  left: 25,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _searchLocationController,
                    textInputAction: TextInputAction.next,
                    decoration: TextfieldInputDecoration()
                        //st parameter label,2nd hint Text ,3rd Error message
                        .textfieldInputDecoration("Destination",
                            "Enter Destination", "Enter Destination")
                        .copyWith(fillColor: Colors.white, filled: true),
                    onChanged: (value) {
                      _searchLocation = value;
                    },
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 0;
                          });
                        },
                        child: selected == 0
                            ? Column(
                                children: [
                                  TripTypeSelectionWidget(
                                      iconData: Icons.car_repair_outlined,
                                      text: "CityCab",
                                      color: Colors.black),
                                  selectedContainerWidget(50.0),
                                ],
                              )
                            : TripTypeSelectionWidget(
                                iconData: Icons.car_repair_outlined,
                                text: "CityCab",
                                color: Colors.grey[400]!),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 1;
                          });
                        },
                        child: selected == 1
                            ? Column(
                                children: [
                                  TripTypeSelectionWidget(
                                      iconData: Icons.car_rental_outlined,
                                      text: "Rental",
                                      color: Colors.black),
                                  selectedContainerWidget(40.0),
                                ],
                              )
                            : TripTypeSelectionWidget(
                                iconData: Icons.car_rental_outlined,
                                text: "Rental",
                                color: Colors.grey[400]!),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 2;
                          });
                        },
                        child: selected == 2
                            ? Column(
                                children: [
                                  TripTypeSelectionWidget(
                                      iconData: Icons.family_restroom_outlined,
                                      text: "Outstation",
                                      color: Colors.black),
                                  selectedContainerWidget(60.0),
                                ],
                              )
                            : TripTypeSelectionWidget(
                                iconData: Icons.family_restroom_outlined,
                                text: "Outstation",
                                color: Colors.grey[400]!),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 8, left: 8, bottom: 8),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 9.0,
                            spreadRadius: 5.0,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                          )
                        ],
                      ),
                      //  pages[0]: city-cab
                      //  pages[1]: Rental
                      //  pages[2]: outstation

                      // if setected icon is City cab then we go with city-cab
                      child: selected == 1
                          ? pages[1]
                          : selected == 2
                              ? pages[2]
                              : pages[0]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, left: 8, top: 8, bottom: 16),
                  child: SizedBox(
                      height: 36,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, "/bookingScreen");
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontFamily: "Inter", fontWeight: FontWeight.w900),
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
