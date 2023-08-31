import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:cabto/data/services/get_current_location.dart';
import 'package:cabto/features/booking_cabs/data/models/cars_model.dart';
import 'package:cabto/features/booking_cabs/presentation/state_management/cars_details_provider.dart';
import 'package:cabto/features/booking_cabs/presentation/widgets/cars_list_widget.dart';
import 'package:cabto/features/booking_cabs/presentation/widgets/doted_line_widget.dart';
import 'package:cabto/features/booking_cabs/presentation/widgets/filterchilps_widgets.dart';
import 'package:cabto/features/booking_cabs/presentation/widgets/middle_date_picker_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _myLocationController = TextEditingController();
  bool isBookForOthers = false;

  late GoogleMapController mapController;
  String _darkMapStyle = "";
  late LocationData currentLocation =
      LocationData.fromMap({'latitude': 0.0, 'longitude': 0.0});
  List<dynamic> destinationLocation = [];
  Set<Marker> marker = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    _loadMapStyles();

    super.initState();
  }

  Future _loadMapStyles() async {
    ;
    _darkMapStyle = await rootBundle.loadString("assets/map_dark_theme.json");
    currentLocation = await GetUserLocation().getUserLocation(context);
    marker.add(
      Marker(
        markerId: const MarkerId('My Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(
            currentLocation.latitude ?? 0, currentLocation.longitude ?? 0),
        infoWindow: const InfoWindow(title: 'My Location'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.height;

    void _showRoute() async {
      final destination = _destinationController.text;

      destinationLocation = await locationFromAddress(destination);
      marker.add(Marker(
        markerId: const MarkerId('destination Location'),
        position: LatLng(destinationLocation.first.latitude ?? 0,
            destinationLocation.first.longitude ?? 0),
        infoWindow: InfoWindow(title: 'destination Location'),
      ));
      if (currentLocation != null && destinationLocation != null) {
        setState(() {
          polylines = {
            Polyline(
              polylineId: PolylineId('route'),
              color: Colors.blue,
              points: [
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
                LatLng(destinationLocation.first.latitude,
                    destinationLocation.first.longitude),
              ],
            ),
          };
        });
      }
    }

    final carDetailsHelper =
        Provider.of<CarsDetailsProvider>(context, listen: true);
    final isLoading = carDetailsHelper.getIsLoading();
    carDetailsHelper.fetchCarsDetails();
    final List<CarsModel> carDetails = carDetailsHelper.carsDetails;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                  "assets/images/sub_map.jpg",
                  fit: BoxFit.fill,
                )),
                Positioned(
                    top: 5,
                    left: 5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.adaptive.arrow_back_rounded)))
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            size: 30,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 10,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          DotedLineWidget(),
                          DotedLineWidget(),
                          DotedLineWidget(),
                          SizedBox(),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.red,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: _width * 0.38,
                              height: 70,
                              child: TextField(
                                controller: _myLocationController,
                                decoration: const InputDecoration(
                                  hintText: " Enter Source Location",
                                  labelText: "Source Location",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: _width * 0.38,
                            height: 70,
                            child: TextField(
                              controller: _destinationController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: "Enter Destination Location",
                                labelText: "Destination Location",
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    _showRoute();
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                const MiddleDatePickerWidget(),
                CarsListWidget(argument: carDetails),
                FilterchipsWidgets(
                    text1: "Book for myself",
                    text2: "Book for others",
                    boolval: isBookForOthers),
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
                        onPressed: () {},
                        child: const Text(
                          "Book",
                          style: TextStyle(
                              fontFamily: "Inter", fontWeight: FontWeight.w900),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
