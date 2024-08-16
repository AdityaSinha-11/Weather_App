import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_homepage.dart';

void main() {
  runApp(const weather_app());
}

class weather_app extends StatelessWidget {
  const weather_app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weatherhomepage(),
    );
  }
}


