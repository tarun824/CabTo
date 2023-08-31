class CarsModel {
  String image;
  String title;
  String subTitle;
  int price;

  CarsModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });
  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      image: json['image'],
      title: json['title'],
      subTitle: json['subTitle'],
      price: json['price'],
    );
  }
}
