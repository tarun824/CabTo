import 'package:cabto/features/booking_cabs/data/models/cars_model.dart';

class CarsDetailsJson {
  //This is dumy data but in real World This JSON will be fetched from Database with some filter
  final jsonList = [
    {
      "image": "assets/images/sedan.jpg",
      "title": "Sedan",
      "subTitle": "Maruthi Swift Dzire Or Similar",
      "price": 3729
    },
    {
      "image": "assets/images/suv.png",
      "title": "SUV",
      "subTitle": "Tayota Innova 6+1 Or Similar",
      "price": 5832
    },
    {
      "image": "assets/images/crysta.jpg",
      "title": "Crysta",
      "subTitle": "Tayota Innova Crysta 6+1 Or Similar",
      "price": 3729
    }
  ];
  List<CarsModel> getCarsModelListFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => CarsModel.fromJson(json)).toList();
  }

  List<CarsModel> convertJson() {
    return getCarsModelListFromJson(jsonList);
  }
}
