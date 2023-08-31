import 'package:cabto/app_route.dart';
import 'package:cabto/features/Home/presentation/pages/homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cabto/features/booking_cabs/presentation/state_management/cars_details_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CarsDetailsProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: "/",
          title: 'Flutter Demo',
          home: const HomeScreen(),
        ));
  }
}
