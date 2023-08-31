// import 'package:flutter/material.dart';
import 'package:cabto/features/booking_cabs/presentation/state_management/cars_details_provider.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class GetUserLocation {
  late LocationData currentLocation;
  Future<LocationData> getUserLocation(context) async {
    final loading = Provider.of<CarsDetailsProvider>(context, listen: false);
    loading.setIsLoading();
    // loading.fetchCarsDetails();
    final locationService = Location();
    currentLocation = await locationService.getLocation();

    return currentLocation;
  }
}
