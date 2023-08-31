import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'package:provider/provider.dart';
import 'package:cabto/data/services/get_current_location.dart';
import 'package:cabto/features/booking_cabs/presentation/state_management/cars_details_provider.dart';

class DisplayMap extends StatefulWidget {
  const DisplayMap({super.key});

  @override
  State<DisplayMap> createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  late GoogleMapController mapController;
  String _darkMapStyle = "";
  late LocationData currentLocation =
      LocationData.fromMap({'latitude': 0.0, 'longitude': 0.0});

  @override
  void initState() {
    _loadMapStyles();
    super.initState();
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString("assets/map_dark_theme.json");
    currentLocation = await GetUserLocation().getUserLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<CarsDetailsProvider>(context, listen: true);
    final isLoading = loading.getIsLoading();
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;

              if (Theme == Brightness.dark) {
                setState(() {
                  controller.setMapStyle(_darkMapStyle);
                });
              }
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation.latitude ?? 0,
                    currentLocation.longitude ?? 0)),
            markers: {
              Marker(
                markerId: const MarkerId('My Location'),
                position: LatLng(currentLocation.latitude ?? 0,
                    currentLocation.longitude ?? 0),
                infoWindow: const InfoWindow(title: 'My Location'),
              ),
            },
          );
  }
}
