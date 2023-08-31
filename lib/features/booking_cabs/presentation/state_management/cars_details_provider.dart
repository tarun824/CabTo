import 'package:cabto/features/booking_cabs/data/models/cars_model.dart';
import 'package:cabto/features/booking_cabs/data/services/cars_details_json.dart';
import 'package:flutter/material.dart';

class CarsDetailsProvider with ChangeNotifier {
  bool isLoading = false;
  List<CarsModel> _carsDetails = [];
  List<CarsModel> get carsDetails {
    return _carsDetails;
  }

  bool getIsLoading() {
    return isLoading;
  }

  void setIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchCarsDetails() {
    _carsDetails = CarsDetailsJson().convertJson();
  }
}
