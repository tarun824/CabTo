import 'package:cabto/features/booking_cabs/data/models/cars_model.dart';
import 'package:flutter/material.dart';

class CarsListWidget extends StatefulWidget {
  CarsListWidget({super.key, required this.argument});
  final argument;
  @override
  State<CarsListWidget> createState() => _CarsListWidgetState();
}

class _CarsListWidgetState extends State<CarsListWidget> {
  List<CarsModel> carDetails = [];
  int selectedIndex = 0;
  @override
  void initState() {
    carDetails = widget.argument;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: _height * 0.32,
      child: ListView.builder(
          itemCount: carDetails.length,
          itemBuilder: (context, index) {
            Widget _listTile(index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 22,
                  child: Image.asset(carDetails[index].image, fit: BoxFit.fill),
                ),
                title: Text(
                  carDetails[index].title,
                  style: const TextStyle(
                      fontFamily: "Inter", fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  carDetails[index].subTitle,
                  style: const TextStyle(
                      fontFamily: "Inter", fontWeight: FontWeight.w600),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "₹ ${carDetails[index].price.toString()}",
                      style: const TextStyle(
                          color: Color(0xFF61A667),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w800),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8.0),
                      child: Icon(Icons.info_outlined),
                    )
                  ],
                ),
              );
            }

            return selectedIndex == index
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFFffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7.0,
                              spreadRadius: 2.0,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            )
                          ],
                        ),
                        child: _listTile(index)),
                  )
                : GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 12),
                      child: _listTile(index),
                    ),
                  );
          }),
    );
  }
}
