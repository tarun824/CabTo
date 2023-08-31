// import 'package:cabto/screens/homeScreen.dart';
import 'package:cabto/features/Home/presentation/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:cabto/features/booking_cabs/presentation/pages/booking_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':

        //for Home Screen
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/bookingScreen':

        //for booking Screen
        return MaterialPageRoute(builder: (_) => const BookingScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ));
    }
  }
}
